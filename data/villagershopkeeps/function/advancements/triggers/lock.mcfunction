

scoreboard players reset @s villagershopkeeps.triggers.lock
advancement revoke @s only villagershopkeeps:triggers/lock

tag @s add villagershopkeeps.advancements.triggers.lock.executor

# Error checking
execute unless entity @e[type=villager,tag=villagershopkeeps.nitwit,distance=..10] run return run function villagershopkeeps:advancements/triggers/errors/lock/no_nitwits
execute as @e[type=villager,tag=villagershopkeeps.nitwit,distance=..10,limit=1,sort=nearest] unless entity @s[tag=villagershopkeeps.unlocked] run return run function villagershopkeeps:advancements/triggers/errors/lock/not_unlocked

execute as @e[type=villager,tag=villagershopkeeps.nitwit,distance=..10,limit=1,sort=nearest] if entity @s[tag=villagershopkeeps.unlocked] at @s run function villagershopkeeps:logic/lock_villager

tag @s remove villagershopkeeps.advancements.triggers.lock.executor
