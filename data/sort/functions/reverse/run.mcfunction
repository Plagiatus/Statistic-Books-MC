# put latest element into the beginning
data modify storage sort:reverse result prepend from storage sort:reverse array[0]
data remove storage sort:reverse array[0]

# continue until array is empty
scoreboard players remove #n sort.tmp 1
execute if score #n sort.tmp matches 1.. run function sort:reverse/run