$tellraw @a [{"text":"$(obj)"}, ": ", {"score":{"name":"@s","objective":"sb.$(obj)"}}]

tag @s add sb.self

data modify entity @e[type=minecraft:text_display,limit=1,tag=sb_temp_name] text set value '{"selector":"@p[tag=sb.self]"}'
data modify storage sb:tmp obj.name set from entity @e[type=minecraft:text_display,limit=1,tag=sb_temp_name] text

tag @s remove sb.self
