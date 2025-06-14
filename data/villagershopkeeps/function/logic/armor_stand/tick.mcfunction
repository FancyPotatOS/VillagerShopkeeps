#
#   Armor Stand Tick
#   
#   Purpose: To update this armor stand marker to check if my villager has died
#
#   Input: None
#


# Tag paired villager by id
scoreboard players operation current_id villagershopkeeps.id = @s villagershopkeeps.id
execute as @e[type=minecraft:villager,tag=villagershopkeeps.nitwit,distance=..5] if score @s villagershopkeeps.id = current_id villagershopkeeps.id run tag @s add villagershopkeeps.armor_stand.rider_exists

# If no villager exists, then go through death motions
execute unless entity @e[type=minecraft:villager,tag=villagershopkeeps.nitwit,distance=..5,tag=villagershopkeeps.armor_stand.rider_exists] run return run function villagershopkeeps:logic/armor_stand/unpaired

# Clear tag off villager
tag @e[tag=villagershopkeeps.armor_stand.rider_exists] remove villagershopkeeps.armor_stand.rider_exists

