function sb:setup_objectives
scoreboard objectives add sb.tmp dummy

# setup the storage
execute store success score #s sb.tmp if data storage sb:tracking tracked
execute if score #s sb.tmp matches 0 run data modify storage sb:tracking tracked set value []
execute store success score #s sb.tmp if data storage sb:tracking storage
execute if score #s sb.tmp matches 0 run data modify storage sb:tracking storage set value []
execute store success score #s sb.tmp if data storage sb:tracking names
execute if score #s sb.tmp matches 0 run data modify storage sb:tracking names set value []

# start the storing system
# function sb:store/run