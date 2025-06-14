#
#   Drop All Stored Items
#   
#   Purpose: To summon a marker that will drop all this entity's stored items
#
#   Input: None
#


# We need to summon a marker who will tick and summon all the item entities to drop
# This is because we can only summon items of a '99' stack (which will divide itself into 64 and 35 stacks automatically) at a time
# I don't want to do recursion because this seems like a cleaner way to do it (if we are dealing with 100's of 1000's of items, for some ludicrous reason
# To ensure ALL the items are returned in their rightful condition, we will do it this way.

# Do not process if no stored items
execute if data entity @s data.villagershopkeeps.stored_item{count:0} run return 0

# Summon the item summoner marker
summon marker ~ ~ ~ {Tags:["villagershopkeeps.stored_item.summoner", "villagershopkeeps.stored_item.summoner.new"]}

# Save the item data
data modify entity @e[type=marker,tag=villagershopkeeps.stored_item.summoner.new,limit=1,sort=nearest] data.villagershopkeeps.item set from entity @s data.villagershopkeeps.stored_item.item

# Save the count into the master scoreboard
execute store result score @e[type=marker,tag=villagershopkeeps.stored_item.summoner.new,limit=1,sort=nearest] villagershopkeeps.master run data get entity @s data.villagershopkeeps.stored_item.count

# Reset stored item fully
data modify entity @s data.villagershopkeeps.stored_item.count set value 0

# Untag marker as new
tag @e[type=marker,tag=villagershopkeeps.stored_item.summoner.new,limit=1,sort=nearest] remove villagershopkeeps.stored_item.summoner.new

