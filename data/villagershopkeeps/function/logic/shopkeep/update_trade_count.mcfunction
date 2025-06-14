#
#   Update Trade Count
#   
#   Purpose: To update the amount of trades this shopkeep can do
#
#   Input: None
#


# Assume 0
scoreboard players set temp.shopkeep.trade_count villagershopkeeps.master 0

# Number of Trades = Stored Item Count / Cost (rounding down, which works due to integer division

# Trade count initial value
execute store result score temp.shopkeep.trade_count villagershopkeeps.master run data get entity @s data.villagershopkeeps.stored_item.count

# Cost
execute store result score temp.shopkeep.cost villagershopkeeps.master run data get entity @s Offers.Recipes[0].sell.count

scoreboard players operation temp.shopkeep.trade_count villagershopkeeps.master /= temp.shopkeep.cost villagershopkeeps.master

# Save as max uses
execute store result entity @s Offers.Recipes[0].maxUses int 1 run scoreboard players get temp.shopkeep.trade_count villagershopkeeps.master
data modify entity @s Offers.Recipes[0].uses set value 0

