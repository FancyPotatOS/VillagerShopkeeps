#
#   Summoner Tick
#   
#   Purpose: To update this summoner marker to summon all the items and then die
#
#   Input: None
#


# No items to drop
execute unless score @s villagershopkeeps.master matches 1.. run return run kill @s

# Summon new item
summon item ~ ~ ~ {Tags:["villagershopkeeps.logic.summon.item", "villagershopkeeps.item.ignore"],Item:{id:"minecraft:dirt",count:1b}}

# Get how many items to drop (Max 99)
scoreboard players operation temp.summoner.item.dropped_count villagershopkeeps.master = @s villagershopkeeps.master
execute if score temp.summoner.item.dropped_count villagershopkeeps.master matches 100.. run scoreboard players set temp.summoner.item.dropped_count villagershopkeeps.master 99

# Calculate how many are left
scoreboard players operation @s villagershopkeeps.master -= temp.summoner.item.dropped_count villagershopkeeps.master

# Apply drop count to item data
execute store result entity @s data.villagershopkeeps.item.count int 1 run scoreboard players get temp.summoner.item.dropped_count villagershopkeeps.master

# Apply item data to item entity
data modify entity @e[type=item,tag=villagershopkeeps.logic.summon.item,limit=1,sort=nearest] Item set from entity @s data.villagershopkeeps.item

# Reset count nbt data
data remove entity @s data.villagershopkeeps.item.count

# Clean up marker once done
execute if score @s villagershopkeeps.master matches ..0 run kill @s

# Untag summoned item
tag @e[type=item,tag=villagershopkeeps.logic.summon.item,limit=1,sort=nearest] remove villagershopkeeps.logic.summon.item

