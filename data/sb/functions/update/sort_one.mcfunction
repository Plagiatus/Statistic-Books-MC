# @param obj		The scoreboard objective whose scores need to be sorted

$function sort:search {type: "storage", target: "sb:tracking", targetPath: "storage[{obj:\"$(obj)\"}].values", attribute: ".value", "scale": 1}
$function sb:update/copy_one {obj:"$(obj)"}