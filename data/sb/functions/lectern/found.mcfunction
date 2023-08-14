
execute if data block ~ ~ ~ Book.tag.statBook unless entity @e[type=marker,distance=...2,tag=sb.lectern] run summon marker ~ ~ ~ {Tags:["sb.lectern"]}

execute if score refreshType sb.settings matches 0 as @e[type=marker,distance=...2,tag=sb.lectern] run function sb:update/one