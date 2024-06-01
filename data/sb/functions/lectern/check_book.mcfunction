data merge storage sb:tmp {newBook: {title: "MCStats"}}
execute store success score #s sb.tmp run data modify storage sb:tmp newBook.title set from block ~ ~ ~ Book.components."minecraft.written_book_content".title.raw

execute if score #s sb.tmp matches 0 run function sb:book/setup