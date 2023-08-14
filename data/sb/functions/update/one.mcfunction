# find obj and sort it
data modify storage sb:tmp book.obj set from block ~ ~ ~ Book.tag.stat
execute if score #needsSorting sb.tmp matches 1 run function sb:update/sort_one with storage sb:tmp book

# reset book pages
data merge storage sb:tmp {book:{pages:[],page:'',pageArray:[],tmp:''}}

# summon armorstand with item to have item to use as a text combinator
# because using item modifier with lore is a convenient way to combine text
execute unless entity @e[type=armor_stand,tag=sb.itemholder] run summon armor_stand ~ 500 ~ {Tags:["sb.itemholder"],HandItems:[{id:"minecraft:stone",Count:1b},{}],Invisible:1b,Invulnerable:1b,NoGravity:1b,Marker:1b}

# fill pages with new data
scoreboard players set #maxPerPage sb.tmp 7
scoreboard players set #i sb.tmp 0
scoreboard players set #place sb.tmp 0
execute store result score #n sb.tmp run data get storage sb:tmp array

function sb:update/recursive
execute unless score #i sb.tmp matches 0 run function sb:update/new_page

data modify block ~ ~ ~ Book.tag.pages set from storage sb:tmp book.pages

schedule function sb:update/cleanup 1t