scoreboard players set #needsSorting sb.tmp 0
function sb:update/sort_all
execute at @e[type=marker,tag=sb.lectern_marker] run function sb:update/one
scoreboard players set #needsSorting sb.tmp 1