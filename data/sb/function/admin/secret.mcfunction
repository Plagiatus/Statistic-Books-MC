execute align xyz if entity @e[type=marker,dx=0,tag=sb.lectern] positioned ~.5 ~.5 ~.5 run function sb:settings/secret

execute align xyz unless entity @e[type=marker,dx=0,tag=sb.lectern] run title @s actionbar [{fallback:"No lectern found.",color:"red",translate:"sb.update.fail"}]