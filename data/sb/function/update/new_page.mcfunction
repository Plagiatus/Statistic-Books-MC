
# data modify storage sb:tmp book.tmp set value '"}'
# function sb:update/combine with storage sb:tmp book

data modify storage sb:tmp book.pages append from storage sb:tmp book.page
data merge storage sb:tmp {book:{page:[""]}}
scoreboard players set #i sb.tmp 0