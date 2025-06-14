#
#   Update Paired Armor Stand
#   
#   Purpose: To update the stored item count/data for the paired armor stand
#
#   Input: None
#


data modify storage villagershopkeeps:data stored_item set from entity @s data.villagershopkeeps.stored_item
data modify storage villagershopkeeps:data payments set from entity @s data.villagershopkeeps.payments

scoreboard players operation current_id villagershopkeeps.id = @s villagershopkeeps.id
execute as @e[type=armor_stand,tag=villagershopkeeps.armor_stand] if score @s villagershopkeeps.id = current_id villagershopkeeps.id run function villagershopkeeps:logic/shopkeep/set_armor_stand_values

