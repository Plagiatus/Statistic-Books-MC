
# how big is the array?
execute store result score #length sort.tmp run data get storage sort:search array

# go through the array and find the lowest value
scoreboard players set #highest sort.tmp -2147483648
scoreboard players set #highestIndex sort.tmp -1
scoreboard players set #i sort.tmp 0

# end if rest is sorted
scoreboard players set #isSorted sort.tmp 1
scoreboard players set #previous sort.tmp 2147483647

data modify storage sort:search tmpArray set from storage sort:search array

function sort:search/inner with storage sort:search

# is the remaining array already fully sorted?
execute if score #isSorted sort.tmp matches 1 run data modify storage sort:search result append from storage sort:search array[]
execute if score #isSorted sort.tmp matches 1 run return 1

execute store result storage sort:search i int 1 run scoreboard players get #highestIndex sort.tmp
function sort:search/copy_lowest with storage sort:search

# continue until array is empty
execute if score #length sort.tmp matches 1.. run function sort:search/run with storage sort:search