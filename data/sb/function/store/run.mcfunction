## stores every online players stats of the ones that were requested at least once.

# if it's still active, check again in a minute
execute if score #amt sb.update matches 1.. run schedule function sb:store/run 60s replace
execute if score #amt sb.update matches 1.. run return 0

# run again in 5 minutes
schedule function sb:store/run 300s replace

# update all custom values that are registered in the function tag
execute as @a run function #sb:run_before

# setup run data
data modify storage sb:tmp tracked set from storage sb:tracking tracked
execute store result score #amt sb.update run data get storage sb:tmp tracked

# setup uuid -> name
execute as @a at @s run function sb:store/name/setup with entity @s

# run the process for every tracked display
execute if score #amt sb.update matches 1.. run function sb:store/all