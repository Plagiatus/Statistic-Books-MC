## stores every online players stats of the ones that were requested at least once.

# run every 5 minutes
# schedule function sb:store/run 300s replace

data modify storage sb:tmp tracked set from storage sb:tracking tracked
execute store result score #amt sb.tmp run data get storage sb:tmp tracked

tellraw @a [{"score":{"objective":"sb.tmp","name":"#amt"}}]

execute if score #amt sb.tmp matches 1.. run function sb:store/all
