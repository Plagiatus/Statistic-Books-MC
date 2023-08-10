
# make sure it exists in storage
$execute store success score #s sb.tmp if data storage sb:tracking storage[{obj:"$(obj)"}]
$execute if score #s sb.tmp matches 0 run data modify storage sb:tracking storage append value {obj:"$(obj)",values:[]}