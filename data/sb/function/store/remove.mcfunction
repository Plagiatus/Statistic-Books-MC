# get current obj
data modify storage sb:tmp remove.obj set from storage sb:tmp remove.tracked[0]
data remove storage sb:tmp remove.tracked[0]

function sb:store/remove_one with storage sb:tmp remove

scoreboard players remove #amt sb.tmp 1
execute if score #amt sb.tmp matches 1.. run function sb:store/remove with storage sb:tmp remove