execute store result score #l sb.tmp run data get storage sb:tmp names[0].name

execute if score #l sb.tmp matches 1.. run data modify storage sb:tmp namesCleaned append from storage sb:tmp names[0]

data remove storage sb:tmp names[0]

scoreboard players remove #n sb.tmp 1
execute if score #n sb.tmp matches 1.. run function sb:store/name/cleanup/reset_empty_recursive