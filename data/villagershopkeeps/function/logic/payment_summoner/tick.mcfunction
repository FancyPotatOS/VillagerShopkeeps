#
#   Summoner Tick
#   
#   Purpose: To update this summoner marker to summon all the items and then die
#
#   Input: None
#


execute unless data entity @s data.villagershopkeeps.payments[1] if data entity @s data.villagershopkeeps.payments[{count:0}] run say nothing to Summon
execute unless data entity @s data.villagershopkeeps.payments[1] if data entity @s data.villagershopkeeps.payments[{count:0}] run return run kill @s

# Summon new item
summon item ~ ~ ~ {Tags:["villagershopkeeps.logic.payment_summoner.item"],Item:{id:"minecraft:dirt",count:1b}}

# Apply item data to item entity
data modify entity @e[type=item,tag=villagershopkeeps.logic.payment_summoner.item,limit=1,sort=nearest] Item set from entity @s data.villagershopkeeps.payments[0]

# Remove first payment data
data remove entity @s data.villagershopkeeps.payments[0]

# Untag summoned item
tag @e[type=item,tag=villagershopkeeps.logic.payment_summoner.item] remove villagershopkeeps.logic.payment_summoner.item

# Clean up marker once done
execute unless data entity @s data.villagershopkeeps.payments[0] run kill @s

