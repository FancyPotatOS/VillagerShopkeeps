#
#   Lock Villager
#   
#   Purpose: To prevent any entities from modifying this villager
#
#   Input: None
#


# Tag as locked
tag @s add villagershopkeeps.unlocked
tag @s remove villagershopkeeps.locked

data remove entity @s data.villagershopkeeps.locker

particle minecraft:block{block_state:{Name:"minecraft:emerald_block"}} ~ ~1 ~ 0.2 0.3 0.2 10 40
playsound minecraft:block.note_block.bell neutral @a[distance=..20]

