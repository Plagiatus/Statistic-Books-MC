schedule function sb:loop 1s

# opt-in
execute if score autoOptIn sb.settings matches 0 run scoreboard players enable @a sb.optin

execute as @a[scores={sb.optin=1..,sb.optedin=1}] run function sb:settings/opt_out
execute as @a[scores={sb.optin=1..}] run function sb:settings/opt_in

# refresh type
execute if score refreshType sb.settings matches 1..2 run scoreboard players enable @a sb.update
execute if score refreshType sb.settings matches 1 as @a[scores={sb.update=1..}] at @s run function sb:admin/one
execute if score refreshType sb.settings matches 2 as @a[scores={sb.update=1..}] at @s run function sb:admin/area

# secrets
execute if score allowSecret sb.settings matches 1 run scoreboard players enable @a sb.secret
execute if score allowSecret sb.settings matches 1 as @a[scores={sb.secret=1..}] at @s run function sb:admin/secret

# help
scoreboard players enable @a sb.help
execute as @a[scores={sb.help=1..}] run function sb:settings/help

# remove markers that have their lectern removed
execute as @e[tag=sb.lectern] at @s unless block ~ ~ ~ minecraft:lectern run kill @s 