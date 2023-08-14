# tellraw @a ["recursive, n:",{"score":{"name":"#n","objective":"sb.tmp"}}, " i:",{"score":{"name":"#i","objective":"sb.tmp"}}, " place:",{"score":{"name":"#place","objective":"sb.tmp"}}, " max:",{"score":{"name":"#maxPerPage","objective":"sb.tmp"}}," data:",{"nbt":"array[0]","storage":"sb:tmp"}]
scoreboard players add #place sb.tmp 1

data merge storage sb:tmp {book:{page:'["",{"bold":true,"text":"'}}
data modify storage sb:tmp book.uuid set from storage sb:tmp array[0].uuid
function sb:update/get_name with storage sb:tmp book
function sb:update/combine with storage sb:tmp book
data merge storage sb:tmp {book:{tmp:'"}]'}}
function sb:update/combine with storage sb:tmp book
data modify storage sb:tmp book.pageArray append from storage sb:tmp book.page

data merge storage sb:tmp {book:{page:'["",{"italic":true,"text":"'}}
data modify storage sb:tmp book.tmp set string storage sb:tmp array[0].value
function sb:update/combine with storage sb:tmp book
data merge storage sb:tmp {book:{tmp:'"}]'}}
function sb:update/combine with storage sb:tmp book
data modify storage sb:tmp book.pageArray append from storage sb:tmp book.page
# tellraw @a ["page array 2: ",{"nbt":"book.pageArray","storage":"sb:tmp"}]

data remove storage sb:tmp array[0]

scoreboard players add #i sb.tmp 1
execute if score #maxPerPage sb.tmp <= #i sb.tmp run function sb:update/new_page

execute if score #n sb.tmp > #place sb.tmp run function sb:update/recursive