# @param obj		The scoreboard objective whose scores need to be sorted

$execute unless data storage sb:tracking storage[{obj:"$(obj)"}] run return 0
$function sort:search {type: "storage", target: "sb:tracking", targetPath: "storage[{obj:\"$(obj)\"}].values", attribute: ".value", scale: 1}
# $function sort:reverse {type: "storage", target: "sb:tracking", targetPath: "storage[{obj:\"$(obj)\"}].values"}
$function sb:update/copy_one {obj:"$(obj)"}