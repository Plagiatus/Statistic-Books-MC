tag @s add sb.self
summon minecraft:text_display ~ ~ ~ {Tags:["sb_temp_name"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0f,0f,0f]}}
data modify entity @e[type=minecraft:text_display,limit=1,tag=sb_temp_name,sort=nearest] text set value '{"selector":"@p[tag=sb.self]"}'

data modify storage sb:tmp name set from entity @e[type=minecraft:text_display,limit=1,tag=sb_temp_name,sort=nearest] text

data modify storage sb:tmp name set string storage sb:tmp name 9 -1
execute store result storage sb:tmp tmp.i int 1 run scoreboard players set #i sb.tmp 0
execute store result storage sb:tmp tmp.i1 int 1 run scoreboard players add #i sb.tmp 1

function sb:store/name/trim with storage sb:tmp tmp

$data modify storage sb:tracking names[{uuid:$(UUID)}].name set from storage sb:tmp name

tag @s remove sb.self