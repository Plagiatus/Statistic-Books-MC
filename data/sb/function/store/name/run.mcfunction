tag @s add sb.self

summon armor_stand ~ ~400 ~ {Tags:["sb.tmp_name"]}
loot replace entity @e[tag=sb.tmp_name,limit=1] weapon.mainhand loot sb:set_name

data modify storage sb:tmp name set from entity @e[limit=1,tag=sb.tmp_name,sort=nearest] HandItems[0].components."minecraft:profile".name
kill @e[tag=sb.tmp_name]


$data modify storage sb:tracking names[{uuid:$(UUID)}].name set from storage sb:tmp name

tag @s remove sb.self