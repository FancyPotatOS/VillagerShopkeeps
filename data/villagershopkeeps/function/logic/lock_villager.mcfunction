#
#   Lock Villager
#   
#   Purpose: To prevent any entities from modifying this villager
#
#   Input: None
#


# Tag as locked
tag @s remove villagershopkeeps.unlocked
tag @s add villagershopkeeps.locked

# Remove the tutorial trade
execute if data entity @s Offers.Recipes[1] run data remove entity @s Offers.Recipes[1]

data modify entity @s CustomName set value {"text":"Shopkeep"}
data modify entity @s CustomNameVisible set value false

# Save locker's UUID
data modify entity @s data.villagershopkeeps.locker set from entity @p[tag=villagershopkeeps.advancements.triggers.lock.executor] UUID

# Player sound for locking
particle minecraft:block{block_state:{Name:"minecraft:iron_bars"}} ~ ~1 ~ 0.2 0.3 0.2 10 40
playsound minecraft:block.note_block.basedrum neutral @a[distance=..20]

