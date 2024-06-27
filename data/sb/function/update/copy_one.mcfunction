# @param obj		The scoreboard objective whose scores need to be sorted

$data modify storage sb:tmp array set from storage sb:tracking storage[{obj:"$(obj)"}].values