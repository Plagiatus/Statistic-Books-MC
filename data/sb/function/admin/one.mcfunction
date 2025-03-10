execute align xyz as @e[type=marker,dx=0,tag=sb.lectern] at @s run function sb:update/one
scoreboard players set @s sb.update 0

execute align xyz if entity @e[type=marker,dx=0,tag=sb.lectern] run title @s actionbar [{"fallback":"Lectern updated.","color":"green","translate":"sb.update.success"}]
execute align xyz unless entity @e[type=marker,dx=0,tag=sb.lectern] run title @s actionbar [{"fallback":"No lectern found.","color":"red","translate":"sb.update.fail"}]