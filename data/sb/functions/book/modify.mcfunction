data merge storage sb:tmp {newBook:{location:"sb:tracking","path":"tracked"}}
data modify storage sb:tmp newBook.value set string entity @s SelectedItem.tag.pages[0] 9 -2
item modify entity @s weapon.mainhand sb:make_book
function sb:util/add_to_storage_unique with storage sb:tmp newBook