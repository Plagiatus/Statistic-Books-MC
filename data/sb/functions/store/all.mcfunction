
data modify storage sb:tmp obj.obj set from storage sb:tmp tracked[0]
data remove storage sb:tmp tracked[0]

execute at @a[sort=random,limit=1] run summon minecraft:text_display ~ ~ ~ {Tags:["sb_temp_name"]}

execute as @a run function sb:store/one with storage sb:tmp obj

scoreboard players remove #amt sb.tmp 1
execute if score #amt sb.tmp matches 1.. run function sb:store/all

kill @e[type=text_display,tag=sb_temp_name]