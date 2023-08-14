$execute store result score #tmp sort.tmp run data get storage sort:search tmpArray[0]$(attribute) $(scale)
data remove storage sort:search tmpArray[0]

execute if score #lowest sort.tmp >= #tmp sort.tmp run scoreboard players operation #lowestIndex sort.tmp = #i sort.tmp
execute if score #lowest sort.tmp >= #tmp sort.tmp run scoreboard players operation #lowest sort.tmp = #tmp sort.tmp

execute if score #previous sort.tmp > #tmp sort.tmp run scoreboard players set #isSorted sort.tmp 0
scoreboard players operation #previous sort.tmp = #tmp sort.tmp

scoreboard players add #i sort.tmp 1 


execute if score #i sort.tmp < #length sort.tmp run function sort:search/inner with storage sort:search