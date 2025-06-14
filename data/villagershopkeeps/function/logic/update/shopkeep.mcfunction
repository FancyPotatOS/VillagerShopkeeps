#
#   Update Shopkeep
#   
#   Purpose: To update this unlocked shopkeep's with relevant items nearby
#
#   Input: None
#


tag @s add villagershopkeeps.logic.update.shopkeep

scoreboard players set temp.shopkeep.unlocked villagershopkeeps.master 0
execute if entity @s[tag=villagershopkeeps.unlocked] run scoreboard players set temp.shopkeep.unlocked villagershopkeeps.master 1

# Save locker UUID so this villager won't steal other's items!
execute if entity @s[tag=villagershopkeeps.locked] run data modify storage villagershopkeeps:data locker set from entity @s data.villagershopkeeps.locker

data modify storage villagershopkeeps:data shopkeep.selling set from entity @s data.villagershopkeeps.stored_item.item

execute as @e[type=item,tag=!villagershopkeeps.update.item.accounted,distance=..2,sort=nearest] run function villagershopkeeps:logic/update/item/check_case

tag @s remove villagershopkeeps.logic.update.shopkeep

