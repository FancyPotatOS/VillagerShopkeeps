#
#   Buy
#   
#   Purpose: To update the shopkeep with the tag 'villagershopkeeps.logic.update.shopkeep''s selling item
#
#   Input: None
#


# Get the stored item count
scoreboard players set temp.stored_item.count villagershopkeeps.master 0
execute store result score temp.stored_item.count villagershopkeeps.master run data get entity @e[type=villager,tag=villagershopkeeps.logic.update.shopkeep,limit=1,sort=nearest] data.villagershopkeeps.stored_item.count

# Get the item entity's count
execute store result score temp.thrown_item.count villagershopkeeps.master run data get entity @s Item.count

# Sum them
scoreboard players operation temp.stored_item.count villagershopkeeps.master += temp.thrown_item.count villagershopkeeps.master

# Return to stored item count
execute store result entity @e[type=villager,tag=villagershopkeeps.logic.update.shopkeep,limit=1,sort=nearest] data.villagershopkeeps.stored_item.count int 1 run scoreboard players get temp.stored_item.count villagershopkeeps.master

execute as @e[type=villager,tag=villagershopkeeps.logic.update.shopkeep,limit=1,sort=nearest] at @s run function villagershopkeeps:logic/shopkeep/update_trade_count

# Update paired armor stand
execute as @e[type=villager,tag=villagershopkeeps.logic.update.shopkeep,limit=1,sort=nearest] at @s run function villagershopkeeps:logic/shopkeep/update_paired_armor_stand

# Clean up item entity
kill @s

