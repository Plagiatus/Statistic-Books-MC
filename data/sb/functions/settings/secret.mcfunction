execute store result score #sec sb.tmp run data get block ~ ~ ~ Book.tag.secret

scoreboard players add #sec sb.tmp 1
execute if score #sec sb.tmp matches 3.. run scoreboard players set #sec sb.tmp 0
execute store result block ~ ~ ~ Book.tag.secret int 1 run scoreboard players get #sec sb.tmp

function sb:update/one

execute if score #sec sb.tmp matches 0 run title @s actionbar [{"text":"Secret Mode: No secrets.","translate":"sb.secret.default","color":"green"}]
execute if score #sec sb.tmp matches 1 run title @s actionbar [{"text":"Secret Mode: Names hidden.","translate":"sb.secret.names","color":"green"}]
execute if score #sec sb.tmp matches 2 run title @s actionbar [{"text":"Secret Mode: Scores hidden.","translate":"sb.secret.scores","color":"green"}]

scoreboard players set @s sb.secret 0