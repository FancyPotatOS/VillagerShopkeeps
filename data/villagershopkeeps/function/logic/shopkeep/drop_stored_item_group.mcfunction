#
#   Drop Stored Item Group
#   
#   Purpose: To drop up to 99 of this entity's stored 'Buy' items
#
#   Input: None
#


# Do not process if no stored items
execute if data entity @s data.villagershopkeeps.stored_item{count:0} run return 0

# Summon temporary item
summon minecraft:item ~ ~ ~ {Tags:["villagershopkeeps.stored_item.temp"],Item:{id:"minecraft:dirt",count:1b}}

# Get the item count
execute store result score temp.stored_item.count villagershopkeeps.master run data get entity @s data.villagershopkeeps.stored_item.count

# Get how many items to drop (Max 99)
execute store result score temp.stored_item.drop_count villagershopkeeps.master run data get entity @s data.villagershopkeeps.stored_item.count
execute if score temp.stored_item.drop_count villagershopkeeps.master matches 100.. run scoreboard players set temp.stored_item.drop_count villagershopkeeps.master 99

# Calculate how many are left
scoreboard players operation temp.stored_item.count villagershopkeeps.master -= temp.stored_item.drop_count villagershopkeeps.master
execute store result entity @s data.villagershopkeeps.stored_item.count int 1 run scoreboard players get temp.stored_item.count villagershopkeeps.master

# Apply the count to the item data
data modify entity @s data.villagershopkeeps.stored_item.item.count set from entity @s data.villagershopkeeps.stored_item.count
data modify entity @e[type=item,tag=villagershopkeeps.stored_item.temp,limit=1,sort=nearest] Item set from entity @s data.villagershopkeeps.stored_item.item

# If not all out of the item, remove the new 'count' nbt data from the actual item reference
execute unless data entity @s data.villagershopkeeps.stored_item{count:0} run data remove entity @s data.villagershopkeeps.stored_item.item.count

# If all out of the item, reset it fully
execute if data entity @s data.villagershopkeeps.stored_item{count:0} run data modify entity @s data.villagershopkeeps set value {stored_item:{count:0,item:{id:"minecraft:dirt"}}}

# Update paired armor stand
function villagershopkeeps:logic/shopkeep/update_paired_armor_stand

# Remove temporary item tag
tag @e[type=item] remove villagershopkeeps.stored_item.temp

