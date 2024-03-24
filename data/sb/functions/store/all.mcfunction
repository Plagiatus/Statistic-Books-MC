# get current obj
data modify storage sb:tmp obj.obj set from storage sb:tmp tracked[0]
data remove storage sb:tmp tracked[0]

# make sure it exists in storage
function sb:store/setup_storage with storage sb:tmp obj

# run for every player
execute if score autoOptIn sb.settings matches 1 as @a at @s run function sb:store/player
execute if score autoOptIn sb.settings matches 0 as @a[scores={sb.optedin=1}] at @s run function sb:store/player

# check if needs to run again
scoreboard players remove #amt sb.update 1
execute if score #amt sb.update matches 1.. run schedule function sb:store/all 1t

# if setup in the settings, run a global update
execute if score #amt sb.update matches 0 if score refreshType sb.settings matches 3 run schedule function sb:update/all 1s
