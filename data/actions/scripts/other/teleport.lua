function onUse(cid, item, fromPosition, itemEx, toPosition)
	if item.itemid == 1386 or item.itemid == 3678 or item.itemid == 5543 then
		fromPosition.y = fromPosition.y + 1
		fromPosition.z = fromPosition.z - 1
	else
		fromPosition.z = fromPosition.z + 1
	end
	doTeleportThing(cid, fromPosition, FALSE)
	return TRUE
end