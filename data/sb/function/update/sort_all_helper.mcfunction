function sb:update/sort_one with storage sb:tmp sortAll[0]
data remove storage sb:tmp sortAll[0]
scoreboard players remove #sortAll sb.tmp 1
execute if score #sortAll sb.tmp matches 1.. run function sb:update/sort_all_helper