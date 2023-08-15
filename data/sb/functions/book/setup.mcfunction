data merge storage sb:tmp {newBook:{location:"sb:tracking","path":"tracked"}}
data modify storage sb:tmp newBook.value set string block ~ ~ ~ Book.tag.pages[0] 9 -2

summon armor_stand ~ 500 ~ {Tags:["sb.itemholder"],HandItems:[{id:"minecraft:stone",Count:1b},{}],Invisible:1b,Invulnerable:1b,NoGravity:1b,Marker:1b}
data modify entity @e[tag=sb.itemholder,limit=1] HandItems[0] set from block ~ ~ ~ Book

item modify entity @e[tag=sb.itemholder,limit=1] weapon.mainhand sb:make_book
data modify block ~ ~ ~ Book set from entity @e[tag=sb.itemholder,limit=1] HandItems[0]
function sb:util/add_to_storage_unique with storage sb:tmp newBook

kill @e[tag=sb.itemholder]