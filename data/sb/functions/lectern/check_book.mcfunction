data merge storage sb:tmp {newBook: {title: "MCStats"}}
execute store success score #s sb.tmp run data modify storage sb:tmp newBook.title set from block ~ ~ ~ Book.tag.title

execute if score #s sb.tmp matches 0 run function sb:book/setup