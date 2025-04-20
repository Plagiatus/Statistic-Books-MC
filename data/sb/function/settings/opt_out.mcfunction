scoreboard players set @s sb.optedin 0
scoreboard players set @s sb.optin 0

tellraw @s [{translate:"sb.opt_out",color:"gray",italic:true,fallback:"You have chosen not to be included in the statistics. Your scores will be removed the next time the books are updated."}]

# remove player from existing storages
data modify storage sb:tmp remove.uuid set from entity @s UUID
data modify storage sb:tmp remove.tracked set from storage sb:tracking tracked
execute store result score #amt sb.tmp run data get storage sb:tmp remove.tracked
execute if score #amt sb.tmp matches 1.. run function sb:store/remove with storage sb:tmp remove