function onUse(cid, item, fromPosition, itemEx, toPosition)

	if item.itemid == 1945 and item.uid == 4412 then
		doRemoveItem(getThingfromPos({x = 990, y = 2961, z = 10, stackpos = 1}).uid, 1)
		doTransformItem(item.uid, item.itemid + 1)	
	elseif item.itemid == 1946 and item.uid == 4412 then
		doCreateItem(1037, 1, {x = 990, y = 2961, z = 11})	
		doTransformItem(item.uid, item.itemid - 1)	
	end
	return TRUE
end 