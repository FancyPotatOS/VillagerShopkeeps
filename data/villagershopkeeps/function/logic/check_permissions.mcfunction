#
#   Check Permissions
#   
#   Purpose: To check if this villager's locker's UUID matches the player tagged with 'villagershopkeeps.advancements.triggers.unlock.executor'
#
#   Input: None
#


# Set the locker's UUID
data modify storage villagershopkeeps:data locker set from entity @s data.villagershopkeeps.locker

# Attempt to overwrite it with the tagged player's
# If this fails, then they match! (Thus the score = 0)
scoreboard players set temp.check_permissions.failure villagershopkeeps.master 1
execute store success score temp.check_permissions.failure villagershopkeeps.master run data modify storage villagershopkeeps:data locker set from entity @p[tag=villagershopkeeps.check_permissions.target] UUID
tag @p[tag=villagershopkeeps.check_permissions.target] remove villagershopkeeps.check_permissions.target

execute if score temp.check_permissions.failure villagershopkeeps.master matches 1 run return fail

return 1

