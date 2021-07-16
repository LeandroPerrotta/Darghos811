function onUse(cid, item, fromPosition, itemEx, toPosition)

	if item.itemid == 1945 and item.uid == 4415 then
		doRemoveItem(getThingfromPos({x = 1045, y = 2913, z = 11, stackpos = 1}).uid, 1)
		doTransformItem(item.uid, item.itemid + 1)	
	elseif item.itemid == 1946 and item.uid == 4415 then
		doCreateItem(1304, 1, {x = 1045, y = 2913, z = 11})	
		doTransformItem(item.uid, item.itemid - 1)	
	end
	return TRUE
end 