function sb:setup_objectives
scoreboard objectives add sb.tmp dummy

# setup the storage
execute store success score #s sb.tmp run data get storage sb:tracking tracked
execute if score #s sb.tmp matches 0 run data modify storage sb:tracking tracked set value []
execute store success score #s sb.tmp run data get storage sb:tracking storage
execute if score #s sb.tmp matches 0 run data modify storage sb:tracking storage set value []

# start the storing system
# function sb:store/run