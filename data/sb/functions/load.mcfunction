function sb:setup_objectives
scoreboard objectives add sb.tmp dummy
scoreboard objectives add sb.settings dummy
scoreboard objectives add sb.optedin dummy
scoreboard objectives add sb.optin trigger
scoreboard objectives add sb.update trigger
scoreboard objectives add sb.secret trigger

# setup default settings
execute unless score refreshType sb.settings = refreshType sb.settings run scoreboard players set refreshType sb.settings 0
execute unless score autoOptIn sb.settings = autoOptIn sb.settings run scoreboard players set autoOptIn sb.settings 1
execute unless score allowSecret sb.settings = allowSecret sb.settings run scoreboard players set allowSecret sb.settings 1

# setup the storage
execute store success score #s sb.tmp if data storage sb:tracking tracked
execute if score #s sb.tmp matches 0 run data modify storage sb:tracking tracked set value []
execute store success score #s sb.tmp if data storage sb:tracking storage
execute if score #s sb.tmp matches 0 run data modify storage sb:tracking storage set value []
execute store success score #s sb.tmp if data storage sb:tracking names
execute if score #s sb.tmp matches 0 run data modify storage sb:tracking names set value []

scoreboard players set #needsSorting sb.tmp 1

# start the storing system
function sb:store/run

# start the trigger checks
function sb:loop