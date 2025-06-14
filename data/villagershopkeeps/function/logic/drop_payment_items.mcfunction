#
#   Drop Payment Items
#   
#   Purpose: To drop all the items that this shopkeep received as payment
#
#   Input: None
#


execute unless data entity @s data.villagershopkeeps.payments[1] run return 0

# Summon the item payment summoner marker
summon marker ~ ~ ~ {Tags:["villagershopkeeps.stored_item.payment_summoner", "villagershopkeeps.stored_item.payment_summoner.new"]}

# Save the item data
data modify entity @e[type=marker,tag=villagershopkeeps.stored_item.payment_summoner.new,limit=1,sort=nearest] data.villagershopkeeps.payments set from entity @s data.villagershopkeeps.payments

# Reset stored item fully
data modify entity @s data.villagershopkeeps.payments set value []

# Untag marker as new
tag @e[type=marker,tag=villagershopkeeps.stored_item.payment_summoner.new,limit=1,sort=nearest] remove villagershopkeeps.stored_item.payment_summoner.new

