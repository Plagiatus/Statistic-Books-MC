# check if needed

$execute store success score #s sb.tmp if data storage sb:tracking names[{uuid:$(UUID)}]

execute if score #s sb.tmp matches 0 run function sb:store/name/run with entity @s