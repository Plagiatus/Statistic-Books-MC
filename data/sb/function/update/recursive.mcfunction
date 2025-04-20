# tellraw @a ["recursive, n:",{"score":{"name":"#n","objective":"sb.tmp"}}, " i:",{"score":{"name":"#i","objective":"sb.tmp"}}, " place:",{"score":{"name":"#place","objective":"sb.tmp"}}, " max:",{"score":{"name":"#maxPerPage","objective":"sb.tmp"}}," data:",{"nbt":"array[0]","storage":"sb:tmp"}]
scoreboard players add #place sb.tmp 1

# name
data modify storage sb:tmp book.uuid set from storage sb:tmp array[0].uuid
function sb:update/get_name with storage sb:tmp book
data modify storage sb:tmp book.page append value "\n"

# score
data modify storage sb:tmp book.tmp set value {italic:true, text:""}
data modify storage sb:tmp book.tmp.text set string storage sb:tmp array[0].value
execute if score allowSecret sb.settings matches 1..2 if score #sec sb.tmp matches 2 run data modify storage sb:tmp book.tmp.text set value "???"
data modify storage sb:tmp book.page append from storage sb:tmp book.tmp

data modify storage sb:tmp book.page append value "\n"
# tellraw @a ["page array 2: ",{"nbt":"book.pageArray","storage":"sb:tmp"}]

data remove storage sb:tmp array[0]

scoreboard players add #i sb.tmp 1
execute if score #maxPerPage sb.tmp <= #i sb.tmp run function sb:update/new_page

execute if score #n sb.tmp > #place sb.tmp run function sb:update/recursive