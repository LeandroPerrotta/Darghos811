function onUse(cid, item, fromPosition, itemEx, toPosition)
	if item.itemid == 2692 then
		if itemEx.itemid >= 2005 or itemEx.itemid <= 2009 or itemEx.itemid >= 2011 or itemEx.itemid <= 2015 or itemEx.itemid == 2023 or itemEx.itemid == 2031 or itemEx.itemid == 2031 or itemEx.itemid == 2032 or itemEx.itemid == 2033 or itemEx.itemid == 1775 then
			if itemEx.type == 9 then
				doChangeTypeItem(item.uid, item.type - 1)
				doPlayerAddItem(cid, 2693, 1)
				doChangeTypeItem(itemEx.uid, item.type - item.type)
				return TRUE
			end
		end
	else
		if itemEx.itemid == 1381 then
			doChangeTypeItem(item.uid, item.type - 1)
			doPlayerAddItem(cid, 2692, 1)
			return TRUE
		end
	end
	return FALSE
end