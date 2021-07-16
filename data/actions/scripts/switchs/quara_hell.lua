---- script da quest que da acesso as caves de quaras.
function onUse(cid, item, frompos, item2, topos)
	if item.actionid == 7001 then
		if item.itemid == 1304 then						
			if getPlayerStorageValue(cid, 5555) == -1 and getPlayerStorageValue(cid, 6555) == 1 then
				if getPlayerItemCount(cid,3970) >= 1 then
					setPlayerStorageValue(cid, 5555,1)
					doPlayerSendTextMessage(cid,22,"You are conquisted the Herams missions, now you have acess to Quara Hell!")
									
					doSendMagicEffect(teleportPos,10)
				end
			end	
		else
			doPlayerSendCancel(cid,"Sorry, not possible.")			
		end
	end

	return 1
end 