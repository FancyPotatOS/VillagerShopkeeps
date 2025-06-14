#
#   Set Up
#   
#   Purpose: To initialize the nitwit villager
#
#   Input: None
#


tag @s add villagershopkeeps.nitwit
tag @s add villagershopkeeps.unlocked

data modify entity @s CustomName set value "Shopkeep"

data modify entity @s Offers set value {Recipes:[\
{\
    buy: {\
        id:"minecraft:bundle",\
        count:1,\
        components:{\
            "minecraft:custom_name":"Cost A",\
            "minecraft:lore":[\
                {"text":"Give a bundle named","color":"gray",italic:false},\
                [{"text":"  '","color":"gray",italic:false}, {"text":"Cost A","color":"white",italic:true}, {"text":"' to this Shopkeep","color":"gray",italic:false}],\
                {"text":"  to set this trade item.","color":"gray",italic:false},\
                {"text":"In this case, the price","color":"gray",italic:false},\
                {"text":"  would be 5 diamonds.","color":"gray",italic:false}\
            ],\
            "minecraft:bundle_contents":[{id:"diamond",count:5}]\
        }\
    },\
    buyB: {\
        id:"minecraft:bundle",\
        count:1,\
        components: {\
            "minecraft:custom_name":"Cost B",\
            "minecraft:lore": [\
                {"text":"Give a bundle named","color":"gray",italic:false},\
                [{"text":"  '","color":"gray",italic:false}, {"text":"Cost B","color":"white",italic:true}, {"text":"' to this Shopkeep","color":"gray",italic:false}],\
                {"text":"  to set this trade item.","color":"gray",italic:false},\
                {"text":"If the bundle is empty,","color":"gray",italic:false},\
                {"text":"  it will remove this trade item.","color":"gray",italic:false}\
            ]\
        }\
    },\
    sell: {\
        id:"minecraft:bundle",\
        count:1,\
        components: {\
            "minecraft:custom_name":"Buy",\
            "minecraft:lore": [\
                {"text":"Give a bundle named","color":"gray",italic:false},\
                [{"text":"  '","color":"gray",italic:false}, {"text":"Buy","color":"white",italic:true}, {"text":"' to this Shopkeep","color":"gray",italic:false}],\
                {"text":"  to change the purchase item.","color":"gray",italic:false},\
                {"text":"Remember to give the Shopkeep","color":"gray",italic:false},\
                {"text":"  the actual wares to enable","color":"gray",italic:false},\
                {"text":"  this trade!","color":"gray",italic:false}\
            ]\
        }\
    },\
    demand:0,\
    maxUses:0,\
    priceMultiplier:0,\
    rewardExp:false,\
    specialPrice:0,\
    uses:0,\
    xp:0\
},\
{\
    buy: {\
        id:"minecraft:knowledge_book",\
        count:1,\
        components: {\
            "minecraft:custom_name":{color:"white",italic:false,"text":"Tutorial (1/2)"},\
            "minecraft:lore": [\
                {"text":"There are four triggers to interact with this Shopkeep:","color":"gray",italic:false},"",\
                [{"text":"/trigger villagershopkeeps.triggers.lock","color":"white",italic:true},{"text":": This prevents","color":"gray",italic:false}],\
                {"text":"    the Shopkeep's trade from changing. A locked","color":"gray",italic:false},\
                {"text":"    Shopkeep cannot be unlocked by anybody else.","color":"gray",italic:false},"",\
                [{"text":"/trigger villagershopkeeps.triggers.unlock","color":"white",italic:true},{"text":": This allows","color":"gray",italic:false}],\
                {"text":"    the Shopkeep's trade to change. The Shopkeep can","color":"gray",italic:false},\
                {"text":"    then be locked by anybody else.","color":"gray",italic:false}\
            ]\
        }\
    },\
    buyB: {\
        id:"minecraft:knowledge_book",\
        count:1,\
        components: {\
            "minecraft:custom_name":{color:"white",italic:false,"text":"Tutorial (2/2)"},\
            "minecraft:lore": [\
                [{"text":"/trigger villagershopkeeps.triggers.drop_payment_items","color":"white",italic:true},{"text":": This drops all","color":"gray",italic:false}],\
                {"text":"    the Shopkeep's items that were traded.","color":"gray",italic:false},"",\
                [{"text":"/trigger villagershopkeeps.triggers.drop_product","color":"white",italic:true},{"text":": This drops all","color":"gray",italic:false}],\
                {"text":"    the Shopkeep's product that the owner gave it.","color":"gray",italic:false},"","",\
                {"text":"Lock this Shopkeep to remove the tutorial.","color":"gray",italic:false},\
            ]\
        }\
    },\
    sell: {\
        id:"minecraft:barrier",\
        count:1,\
        components: {\
            "minecraft:tooltip_display": {\
                hide_tooltip:true\
            }\
        }\
    },\
    demand:0,\
    maxUses:0,\
    priceMultiplier:0,\
    rewardExp:false,\
    specialPrice:0,\
    uses:0,\
    xp:0}]}

data modify entity @s data.villagershopkeeps set value {payments:[],stored_item:{count:0,item:{id:"minecraft:dirt"}}}

summon minecraft:armor_stand ~ ~ ~ {Tags:["villagershopkeeps.armor_stand", "villagershopkeeps.armor_stand.new"],Invisible:1b,Invulnerable:1b,NoGravity:1b,NoAI:1b,attributes:[{base:0.1,id:"minecraft:scale"}]}

ride @e[tag=villagershopkeeps.armor_stand.new,limit=1] mount @s

scoreboard players operation @s villagershopkeeps.id = next_id villagershopkeeps.id
scoreboard players operation @e[tag=villagershopkeeps.armor_stand.new,limit=1] villagershopkeeps.id = next_id villagershopkeeps.id

scoreboard players add next_id villagershopkeeps.id 1

tag @e[tag=villagershopkeeps.armor_stand.new] remove villagershopkeeps.armor_stand.new
