# $tellraw @a [{"text":"$(obj)"}, ": ", {"score":{"name":"@s","objective":"$(obj)"}}]

# actually set the value
$execute store result storage sb:tracking storage[{obj:"$(obj)"}].values[{uuid:$(uuid)}].value int 1 run scoreboard players get @s $(obj) 