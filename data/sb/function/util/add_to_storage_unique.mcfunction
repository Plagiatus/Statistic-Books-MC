## only adds a given value to an nbt storage array if it's not present yet

$execute store success score #s sb.tmp if data storage $(location) {$(path):[$(value)]}
$execute if score #s sb.tmp matches 0 run data modify storage $(location) $(path) append value $(value)