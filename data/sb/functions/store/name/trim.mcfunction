$data modify storage sb:tmp tmp.name set string storage sb:tmp name $(i) $(i1)
execute store success score #s sb.tmp run data merge storage sb:tmp {tmp:{name:'"'}}

$execute if score #s sb.tmp matches 0 run data modify storage sb:tmp name set string storage sb:tmp name 0 $(i)

execute if score #s sb.tmp matches 1 store result storage sb:tmp tmp.i int 1 run scoreboard players get #i sb.tmp 
execute if score #s sb.tmp matches 1 store result storage sb:tmp tmp.i1 int 1 run scoreboard players add #i sb.tmp 1
execute if score #s sb.tmp matches 1 run function sb:store/name/trim with storage sb:tmp tmp
