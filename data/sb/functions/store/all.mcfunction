# get current obj
data modify storage sb:tmp obj.obj set from storage sb:tmp tracked[0]
data remove storage sb:tmp tracked[0]

# make sure it exists in storage
function sb:store/setup_storage with storage sb:tmp obj

# run for every player
execute if score autoOptIn sb.settings matches 1 as @a at @s run function sb:store/player
execute if score autoOptIn sb.settings matches 0 as @a[scores={sb.optedin=1}] at @s run function sb:store/player

# check if needs to run again
scoreboard players remove #amt sb.tmp 1
execute if score #amt sb.tmp matches 1.. run function sb:store/all
