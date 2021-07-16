local increaseItemID = {2041, 2044, 2047, 2050, 2052, 2054}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	if isInArray(increaseItemID, item.itemid) == 1 then
		doTransformItem(item.uid, item.itemid + 1)
	else
		doTransformItem(item.uid, item.itemid - 1)
	end
	doDecayItem(item.uid)
	return TRUE
end