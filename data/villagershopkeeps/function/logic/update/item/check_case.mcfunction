#
#   Check Case
#   
#   Purpose: To check if this item matches a specific special item case and update it accordingly
#
#   Input: None
#


execute if entity @s[tag=villagershopkeeps.item.ignore] run return 0

execute if score temp.shopkeep.unlocked villagershopkeeps.master matches 1 if items entity @s contents #minecraft:bundles[minecraft:custom_name="Cost A"] if data entity @s Item.components."minecraft:bundle_contents"[0] run function villagershopkeeps:logic/update/item/cost_a
execute if score temp.shopkeep.unlocked villagershopkeeps.master matches 1 if items entity @s contents #minecraft:bundles[minecraft:custom_name="Cost B"] run function villagershopkeeps:logic/update/item/cost_b

execute if score temp.shopkeep.unlocked villagershopkeeps.master matches 1 if items entity @s contents #minecraft:bundles[minecraft:custom_name="Buy"] if data entity @s Item.components."minecraft:bundle_contents"[0] run function villagershopkeeps:logic/update/item/buy


# This MUST be the last case: Storing items to sell

# Attempt to overwrite selling storage data. If failed, then this item is actually the 'Buy' item!
data modify storage villagershopkeeps:data shopkeep.selling_temp set from storage villagershopkeeps:data shopkeep.selling
data modify storage villagershopkeeps:data shopkeep.selling_temp2 set from entity @s Item
data remove storage villagershopkeeps:data shopkeep.selling_temp2.count
scoreboard players set temp.is_buy_item.failure villagershopkeeps.master 0
execute store success score temp.is_buy_item.failure villagershopkeeps.master run data modify storage villagershopkeeps:data shopkeep.selling_temp set from storage villagershopkeeps:data shopkeep.selling_temp2

# If item has no thrower, accept it just fine
execute unless data entity @s Thrower if score temp.is_buy_item.failure villagershopkeeps.master matches 0 run return run function villagershopkeeps:logic/update/item/save_buy_item

# Otherwise we need to check the Thrower UUID vs. this villager's locked UUID

# Get copy of locker's UUID
data modify storage villagershopkeeps:data locker_copy set from storage villagershopkeeps:data locker

# Assume worked
scoreboard players set temp.is_throwers_item.failure villagershopkeeps.master 1

# Attempt to overwrite
execute store success score temp.is_throwers_item.failure villagershopkeeps.master run data modify storage villagershopkeeps:data locker_copy set from entity @s Thrower

# If failed, they match!
execute if score temp.is_throwers_item.failure villagershopkeeps.master matches 0 if score temp.is_buy_item.failure villagershopkeeps.master matches 0 run return run function villagershopkeeps:logic/update/item/save_buy_item

