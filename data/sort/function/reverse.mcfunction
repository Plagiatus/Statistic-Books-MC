# reverses a given array
# 
# @param type						storage | entity | block
# @param target 				depending on the above, either the storage namespace, entity selector or block location
# @param targetPath 		the path to the NBT array you want reversed

# store given data in own storage object for speed and to know where it's located
$data modify storage sort:reverse array set from $(type) $(target) $(targetPath)
data merge storage sort:reverse {result:[]}

execute store result score #n sort.tmp run data get storage sort:search array

# run the sort
execute if score #n sort.tmp matches 1.. run function sort:reverse/run

# copy the result to the original array
$data modify $(type) $(target) $(targetPath) set from storage sort:reverse result