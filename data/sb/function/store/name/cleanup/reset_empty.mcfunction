data modify storage sb:tmp names set from storage sb:tracking names

execute store result score #n sb.tmp run data get storage sb:tmp names
data modify storage sb:tmp namesCleaned set value []

execute if score #n sb.tmp matches 1.. run function sb:store/name/cleanup/reset_empty_recursive

data modify storage sb:tracking names set from storage sb:tmp namesCleaned