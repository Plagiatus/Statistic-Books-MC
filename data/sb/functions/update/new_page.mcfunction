
# data modify storage sb:tmp book.tmp set value '"}'
# function sb:update/combine with storage sb:tmp book

item modify entity @e[tag=sb.itemholder,limit=1] weapon.mainhand sb:page_to_lore
data modify storage sb:tmp book.pages append from entity @e[tag=sb.itemholder,limit=1] HandItems[0].tag.display.Lore[]
data merge storage sb:tmp {book:{page:'',pageArray:[]}}
scoreboard players set #i sb.tmp 0