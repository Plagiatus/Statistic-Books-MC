execute unless data block ~ ~ ~ Book.components."minecraft:custom_data".statBook if data block ~ ~ ~ Book.components."minecraft:written_book_content".title run function sb:lectern/check_book
execute unless data block ~ ~ ~ Book.components."minecraft:custom_data".statBook run return 0

execute unless entity @e[type=marker,distance=...2,tag=sb.lectern] run summon marker ~ ~ ~ {Tags:["sb.lectern"]}

execute if score refreshType sb.settings matches 0 as @e[type=marker,distance=...2,tag=sb.lectern] run function sb:update/one