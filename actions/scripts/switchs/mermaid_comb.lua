--- quest que dá mermaid comb
function onUse(cid, item, frompos, item2, topos)
	if itemId = 1225 and item.ActionId = 4567 then
		if getPlayerStorageValue(cid, 4567) = 1 then
			if getPlayerLevel(cid) > 150 then
				doTransformItem(item.uid, item.itemid + 1)
				doTeleportThing(cid, toPosition, TRUE)
			else
				doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You need level 150+ for pass in this door.")
			end
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "The door seems to be sealed against unwanted intruders.")
		end
		return TRUE
	end
end 