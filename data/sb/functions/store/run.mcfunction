## stores every online players stats of the ones that were requested at least once.

# run every 5 minutes
# schedule function sb:store/run 300s replace

data modify storage sb:tmp tracked set from storage sb:tracking tracked
execute store result score #amt sb.tmp run data get storage sb:tmp tracked

# setup uuid -> name
execute as @a at @s run function sb:store/name/setup with entity @s
# remove text displays
kill @e[type=text_display,tag=sb_temp_name]

# run the process for every tracked display
execute if score #amt sb.tmp matches 1.. run function sb:store/all
