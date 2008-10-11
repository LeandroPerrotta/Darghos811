function onUse(cid, item, frompos, item2, topos)

	
	if item.itemid == 1546 then
		if item2.actionid > 0 then
			if item.actionid == item2.actionid then
				doTransformItem(item.uid, 1547)
				doPlayerSendCancel(cid, "Opened.")
			else
				doPlayerSendCancel(cid, "Sorry, not possible.")
			end
		end	
	elseif item.itemid == 1547 then
		if item2.actionid > 0 then
			if item.actionid == item2.actionid then
				doTransformItem(item.uid, 1546)
				doPlayerSendCancel(cid, "Opened.")
			else
				doPlayerSendCancel(cid, "Sorry, not possible.")
			end
		end			
	else
		return 0
	end	
end