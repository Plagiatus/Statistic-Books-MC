scoreboard players set #needsSorting sb.tmp 0
function sb:update/sort_all
execute as @e[type=marker,tag=sb.lectern] at @s run function sb:update/one
scoreboard players set #needsSorting sb.tmp 1