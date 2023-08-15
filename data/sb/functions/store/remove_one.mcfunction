$data remove storage sb:tracking storage[{obj:"$(obj)"}].values[{uuid:$(uuid)}]
# $tellraw @a [{"nbt":"storage[{obj:'$(obj)'}].values[{uuid:$(uuid)}]","storage":"sb:tracking"}, "$(obj)$(uuid)"]