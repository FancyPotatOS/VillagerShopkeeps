

execute as @e[type=villager,distance=..100,predicate=villagershopkeeps:is_nitwit] at @s run function villagershopkeeps:logic/shopkeep/on_trade

advancement revoke @s only villagershopkeeps:traded_with_nitwit
