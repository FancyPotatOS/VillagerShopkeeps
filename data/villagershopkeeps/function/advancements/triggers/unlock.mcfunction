

scoreboard players reset @s villagershopkeeps.triggers.unlock
advancement revoke @s only villagershopkeeps:triggers/unlock

tag @s add villagershopkeeps.advancements.triggers.unlock.executor

execute unless entity @e[type=villager,tag=villagershopkeeps.nitwit,distance=..10] run return run function villagershopkeeps:advancements/triggers/errors/unlock/no_nitwits
execute as @e[type=villager,tag=villagershopkeeps.nitwit,distance=..10,limit=1,sort=nearest] unless entity @s[tag=villagershopkeeps.locked] run return run function villagershopkeeps:advancements/triggers/errors/unlock/not_locked

tag @s add villagershopkeeps.check_permissions.target
execute as @e[type=villager,tag=villagershopkeeps.nitwit,distance=..10,limit=1,sort=nearest] if entity @s[tag=villagershopkeeps.locked] unless function villagershopkeeps:logic/check_permissions run return run function villagershopkeeps:advancements/triggers/errors/unlock/no_permissions

execute as @e[type=villager,tag=villagershopkeeps.nitwit,distance=..10,limit=1,sort=nearest] if entity @s[tag=villagershopkeeps.locked] at @s run function villagershopkeeps:logic/unlock_villager

tag @s remove villagershopkeeps.advancements.triggers.unlock.executor

