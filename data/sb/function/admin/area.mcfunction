execute as @e[type=marker,distance=..16,tag=sb.lectern] at @s run function sb:update/one
scoreboard players set @s sb.update 0

execute if entity @e[type=marker,distance=..16,tag=sb.lectern] run title @s actionbar [{"fallback":"Lectern(s) updated.","color":"green","translate":"sb.update.success"}]
execute unless entity @e[type=marker,distance=..16,tag=sb.lectern] run title @s actionbar [{"fallback":"No lectern found.","color":"red","translate":"sb.update.fail"}]