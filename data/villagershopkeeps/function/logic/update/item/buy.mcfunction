#
#   Buy
#   
#   Purpose: To update the shopkeep with the tag 'villagershopkeeps.logic.update.shopkeep''s selling item
#
#   Input: None
#


# Check if the buy item matches the current one, ignoring count (Return if so)
data modify storage villagershopkeeps:data shopkeep.stored_item set from entity @e[type=villager,tag=villagershopkeeps.logic.update.shopkeep,limit=1,sort=nearest] Offers.Recipes[0].sell
execute store result score temp.item.cost villagershopkeeps.master run data get storage villagershopkeeps:data shopkeep.stored_item.count
data remove storage villagershopkeeps:data shopkeep.stored_item.count

#tellraw @p ["",{"nbt":"shopkeep.stored_item","storage":"villagershopkeeps:data"}]

# Save bundle contents, ignoring count
scoreboard players set temp.already_is_buy_item.failure villagershopkeeps.master 1
data modify storage villagershopkeeps:data shopkeep.bundle_contents set from entity @s Item.components."minecraft:bundle_contents"[0]
execute store result score temp.item.new_cost villagershopkeeps.master run data get storage villagershopkeeps:data shopkeep.bundle_contents.count
data remove storage villagershopkeeps:data shopkeep.bundle_contents.count

# Save failure to overwrite from bundle components
execute store success score temp.already_is_buy_item.failure villagershopkeeps.master run data modify storage villagershopkeeps:data shopkeep.stored_item set from storage villagershopkeeps:data shopkeep.bundle_contents

#tellraw @p ["",{"nbt":"shopkeep.stored_item","storage":"villagershopkeeps:data"}]
#tellraw @p ["\n\n"]

# Clean up tags from potentially an old update
tag @s remove villagershopkeeps.item.differs
tag @s remove villagershopkeeps.item.only_new_cost

# It does not match, tag as so
execute if score temp.already_is_buy_item.failure villagershopkeeps.master matches 1 run tag @s add villagershopkeeps.item.differs

# If the items match, we need to quickly compare count
# In this case, we just want to change the price, which would mean we should not DROP ALL THE STORED ITEMS!!
execute unless entity @s[tag=villagershopkeeps.item.differs] unless score temp.item.cost villagershopkeeps.master = temp.item.new_cost villagershopkeeps.master run tag @s add villagershopkeeps.item.only_new_cost
execute unless entity @s[tag=villagershopkeeps.item.differs] unless score temp.item.cost villagershopkeeps.master = temp.item.new_cost villagershopkeeps.master run tag @s add villagershopkeeps.item.differs

# If not differs by now, just return
execute unless entity @s[tag=villagershopkeeps.item.differs] run tag @s add villagershopkeeps.update.item.accounted
execute unless entity @s[tag=villagershopkeeps.item.differs] run return 0

# Drop all of the villager's stored items unless we are only changing cost
execute if entity @s[tag=villagershopkeeps.item.differs] unless entity @s[tag=villagershopkeeps.item.only_new_cost] as @e[type=villager,tag=villagershopkeeps.logic.update.shopkeep,limit=1,sort=nearest] at @s run function villagershopkeeps:logic/shopkeep/drop_all_stored_items

# Save the item into the villager's data
data modify entity @e[type=villager,tag=villagershopkeeps.logic.update.shopkeep,limit=1,sort=nearest] data.villagershopkeeps.stored_item.item set from entity @s Item.components."minecraft:bundle_contents"[0]
data remove entity @e[type=villager,tag=villagershopkeeps.logic.update.shopkeep,limit=1,sort=nearest] data.villagershopkeeps.stored_item.item.count

execute unless entity @s[tag=villagershopkeeps.item.only_new_cost] as @e[type=villager,tag=villagershopkeeps.logic.update.shopkeep,limit=1,sort=nearest] run data modify entity @s data.villagershopkeeps.stored_item.count set value 0

# Save the item from the bundle into the offer
data modify entity @e[type=villager,tag=villagershopkeeps.logic.update.shopkeep,limit=1,sort=nearest] Offers.Recipes[0].sell set from entity @s Item.components."minecraft:bundle_contents"[0]

# Play sound show that trade changed
playsound minecraft:entity.villager.celebrate neutral @a[distance=..20] ~ ~ ~ 1 0.8

# Reevaluate possible trade counts
execute as @e[type=villager,tag=villagershopkeeps.logic.update.shopkeep,limit=1,sort=nearest] at @s run function villagershopkeeps:logic/shopkeep/update_trade_count

# Update paired armor stand
execute as @e[type=villager,tag=villagershopkeeps.logic.update.shopkeep,limit=1,sort=nearest] at @s run function villagershopkeeps:logic/shopkeep/update_paired_armor_stand

# Account for the bundle to not process until picked up
tag @s add villagershopkeeps.update.item.accounted

