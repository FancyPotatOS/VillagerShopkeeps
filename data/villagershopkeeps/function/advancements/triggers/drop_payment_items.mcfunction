

scoreboard players reset @s villagershopkeeps.triggers.drop_payment_items
advancement revoke @s only villagershopkeeps:triggers/drop_payment_items

tag @s add villagershopkeeps.advancements.triggers.drop_payment_items.executor


execute unless entity @e[type=villager,tag=villagershopkeeps.nitwit,distance=..10] run return run function villagershopkeeps:advancements/triggers/errors/drop_payment_items/no_nitwits

tag @s add villagershopkeeps.check_permissions.target
execute as @e[type=villager,tag=villagershopkeeps.nitwit,distance=..10,limit=1,sort=nearest] unless function villagershopkeeps:logic/check_permissions run return run function villagershopkeeps:advancements/triggers/errors/drop_payment_items/no_permissions

execute unless data entity @e[type=villager,tag=villagershopkeeps.nitwit,distance=..10,limit=1,sort=nearest] data.villagershopkeeps.payments[0] run return run function villagershopkeeps:advancements/triggers/errors/drop_payment_items/no_payment_items

execute as @e[type=villager,tag=villagershopkeeps.nitwit,distance=..10,limit=1,sort=nearest] at @s run function villagershopkeeps:logic/drop_payment_items

tag @s remove villagershopkeeps.advancements.triggers.drop_payment_items.executor

