#
#   On Trade
#   
#   Purpose: To update the shopkeep's data after a trade took place
#
#   Input: None
#


# Count how many trades took place
execute store result score temp.shopkeep.trades villagershopkeeps.master run data get entity @s Offers.Recipes[0].uses

# Save how many times the first trade item was purchased
data modify entity @s data.villagershopkeeps.payments append from entity @s Offers.Recipes[0].buy

# If has second trade item, then add that too
execute if data entity @s Offers.Recipes[0].buyB.id run data modify entity @s data.villagershopkeeps.payments append from entity @s Offers.Recipes[0].buyB

# Stop if no trades
execute if score temp.shopkeep.trades villagershopkeeps.master matches 0 run return 0

# Cost of trade
execute store result score temp.shopkeep.cost villagershopkeeps.master run data get entity @s Offers.Recipes[0].sell.count

# Spent item count = trades * cost
scoreboard players operation temp.shopkeep.spent_stores villagershopkeeps.master = temp.shopkeep.trades villagershopkeeps.master
scoreboard players operation temp.shopkeep.spent_stores villagershopkeeps.master *= temp.shopkeep.cost villagershopkeeps.master

# Reduce the stored_item count accordingly
execute store result score temp.shopkeep.stored_item_count villagershopkeeps.master run data get entity @s data.villagershopkeeps.stored_item.count
scoreboard players operation temp.shopkeep.stored_item_count villagershopkeeps.master -= temp.shopkeep.spent_stores villagershopkeeps.master

# Store new stored item count
execute store result entity @s data.villagershopkeeps.stored_item.count int 1 run scoreboard players get temp.shopkeep.stored_item_count villagershopkeeps.master

# Reset trade count
function villagershopkeeps:logic/shopkeep/update_trade_count

# Update paired armor stand
function villagershopkeeps:logic/shopkeep/update_paired_armor_stand

