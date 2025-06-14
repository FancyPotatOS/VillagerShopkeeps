#
#   Migration File V1
#   
#   Purpose: To update the datapack up to this level, then apply new/updated configs or setup
#
#   Input: None
#


tellraw @a ["",{"text":"[Villager Shopkeeps Datapack - V1]","bold":true,"color":"dark_blue"}," - Setup"]

# Apply last migration
#execute unless score version villagershopkeeps.master matches 1.. run function villagershopkeeps:meta/migrate/migration_v0

# Set the version
scoreboard players set version villagershopkeeps.master 1


scoreboard objectives add villagershopkeeps.triggers.lock trigger {"text":"Lock Shopkeep","italic":false,"color":"aqua"}
scoreboard objectives add villagershopkeeps.triggers.unlock trigger {"text":"Unlock Shopkeep","italic":false,"color":"aqua"}
scoreboard objectives add villagershopkeeps.triggers.drop_payment_items trigger {"text":"Drop Shopkeep's Payment Items","italic":false,"color":"aqua"}
scoreboard objectives add villagershopkeeps.triggers.drop_product trigger {"text":"Drop Shopkeep's Product","italic":false,"color":"aqua"}

scoreboard objectives add villagershopkeeps.id dummy
scoreboard players set next_id villagershopkeeps.id 0

scoreboard players set config.clock villagershopkeeps.master 20


return 0
# Used for Spyglass
scoreboard objectives add fpconflict.conflict_map dummy

