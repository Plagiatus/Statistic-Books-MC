## stores every online players stats of the ones that were requested at least once.

# if it's still active, check again in a minute
execute if score #amt sb.update matches 1.. run schedule function sb:store/run 60s replace
execute if score #amt sb.update matches 1.. run return 0

# run again in 5 minutes
schedule function sb:store/run 300s replace

data modify storage sb:tmp tracked set from storage sb:tracking tracked
execute store result score #amt sb.update run data get storage sb:tmp tracked

# setup uuid -> name
execute as @a at @s run function sb:store/name/setup with entity @s
# remove text displays
kill @e[type=text_display,tag=sb_temp_name]

# run the process for every tracked display
execute if score #amt sb.update matches 1.. run function sb:store/all

# if setup in the settings, run a global update
execute if score refreshType sb.settings matches 3 run schedule function sb:update/all 1s