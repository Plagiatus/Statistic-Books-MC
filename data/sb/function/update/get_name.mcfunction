#> 
# @param uuid 	the uuid of the name you're looking for

data modify storage sb:tmp book.tmp set value "<unknown>" 
$data modify storage sb:tmp book.tmp set from storage sb:tracking names[{uuid:$(uuid)}].name