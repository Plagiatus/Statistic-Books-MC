#> 
# @param uuid 	the uuid of the name you're looking for

data modify storage sb:tmp book.tmp set value {text: "<unknown>", bold: true} 
$data modify storage sb:tmp book.tmp.text set from storage sb:tracking names[{uuid:$(uuid)}].name
execute if score allowSecret sb.settings matches 1..2 if score #sec sb.tmp matches 1 run data modify storage sb:tmp book.tmp.text set value "???"

data modify storage sb:tmp book.page append from storage sb:tmp book.tmp