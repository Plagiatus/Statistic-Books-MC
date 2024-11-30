data modify storage sb:tmp sortAll set from storage sb:tracking storage
execute store result score #sortAll sb.tmp run data get storage sb:tmp sortAll
function sb:update/sort_all_helper