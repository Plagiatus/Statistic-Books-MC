
# how big is the array?
execute store result score #length sort.tmp run data get storage sort:search array

# go through the array and find the lowest value
scoreboard players set #lowest sort.tmp 2147483647
scoreboard players set #lowestIndex sort.tmp -1
scoreboard players set #i sort.tmp 0

data modify storage sort:search tmpArray set from storage sort:search array

function sort:search/inner with storage sort:search

execute store result storage sort:search i int 1 run scoreboard players get #lowestIndex sort.tmp
function sort:search/copy_lowest with storage sort:search

# continue until array is empty
execute if score #length sort.tmp matches 1.. run function sort:search/run with storage sort:search