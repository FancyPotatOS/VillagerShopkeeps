

scoreboard players reset @s villagershopkeeps.triggers.drop_product
advancement revoke @s only villagershopkeeps:triggers/drop_product

tag @s add villagershopkeeps.advancements.triggers.drop_product.executor


execute unless entity @e[type=villager,tag=villagershopkeeps.nitwit,distance=..10] run return run function villagershopkeeps:advancements/triggers/errors/drop_product/no_nitwits

tag @s add villagershopkeeps.check_permissions.target
execute as @e[type=villager,tag=villagershopkeeps.nitwit,distance=..10,limit=1,sort=nearest] unless function villagershopkeeps:logic/check_permissions run return run function villagershopkeeps:advancements/triggers/errors/drop_product/no_permissions

execute as @e[type=villager,tag=villagershopkeeps.nitwit,distance=..10,limit=1,sort=nearest] if data entity @s data.villagershopkeeps.stored_item{count:0} run return run function villagershopkeeps:advancements/triggers/errors/drop_product/no_product

execute as @e[type=villager,tag=villagershopkeeps.nitwit,distance=..10,limit=1,sort=nearest] at @s run function villagershopkeeps:logic/shopkeep/drop_all_stored_items

tag @s remove villagershopkeeps.advancements.triggers.drop_product.executor

