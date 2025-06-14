#
#   Tick
#   
#   Purpose: To update all logic
#
#   Input: None
#


scoreboard players enable @a villagershopkeeps.triggers.lock
scoreboard players enable @a villagershopkeeps.triggers.unlock
scoreboard players enable @a villagershopkeeps.triggers.drop_payment_items
scoreboard players enable @a villagershopkeeps.triggers.drop_product

execute as @e[type=villager,tag=!villagershopkeeps.nitwit,predicate=villagershopkeeps:is_nitwit] at @s run function villagershopkeeps:logic/shopkeep/setup

# Clock cycle to update shopkeeps
scoreboard players add clock villagershopkeeps.master 1
execute if score config.clock villagershopkeeps.master <= clock villagershopkeeps.master as @e[type=villager,tag=villagershopkeeps.nitwit] at @s run function villagershopkeeps:logic/update/shopkeep
scoreboard players operation clock villagershopkeeps.master %= config.clock villagershopkeeps.master

execute as @e[type=marker,tag=villagershopkeeps.stored_item.summoner] at @s run function villagershopkeeps:logic/summoner/tick
execute as @e[type=marker,tag=villagershopkeeps.stored_item.payment_summoner] at @s run function villagershopkeeps:logic/payment_summoner/tick

execute as @e[type=armor_stand,tag=villagershopkeeps.armor_stand] at @s run function villagershopkeeps:logic/armor_stand/tick

