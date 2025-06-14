#
#   Cost B
#   
#   Purpose: To update the shopkeep with the tag 'villagershopkeeps.logic.update.shopkeep''s second trade item
#
#   Input: None
#


execute unless data entity @s Item.components."minecraft:bundle_contents"[0] run data remove entity @e[type=villager,tag=villagershopkeeps.logic.update.shopkeep,limit=1,sort=nearest] Offers.Recipes[0].buyB
data modify entity @e[type=villager,tag=villagershopkeeps.logic.update.shopkeep,limit=1,sort=nearest] Offers.Recipes[0].buyB set from entity @s Item.components."minecraft:bundle_contents"[0]

# Play sound show that trade changed
playsound minecraft:entity.villager.celebrate neutral @a[distance=..20] ~ ~ ~ 1 0.8

tag @s add villagershopkeeps.update.item.accounted

