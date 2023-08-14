execute if block ~ ~ ~ minecraft:lectern align xyz positioned ~.5 ~.5 ~.5 run function sb:lectern/found
execute if block ~ ~ ~ minecraft:lectern run return 1

scoreboard players remove #steps sb.tmp 1
execute if score #steps sb.tmp matches 1.. positioned ^ ^ ^0.01 run function sb:lectern/ray
