function onUse(cid, item, frompos, item2, topos)
	
	local playerAccess = getPlayerGroupId(cid)
	
	--Elven Quest Trap
	if item.uid == 1000 then
		queststatus = getPlayerStorageValue(cid,7500)
		if queststatus == -1 or queststatus == 0 or playerAccess == 6 then
			if os.time() > timer_actions.time2 or timer_actions.time2 == 0 then		
				timer_actions.time2 = os.time() + 60*5		
				monster = {name = "Elf Arcanist", countMin = 8, countMax = 12}
				radius = 5	
				centerPos = {x=2394, y=1785, z=9}

				doMakeRespawn(monster, centerPos, radius)
				doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "The elfs have a good present for the visitors!")
				
				setPlayerStorageValue(cid,7500,1)
			else
				doPlayerSendTextMessage(cid,22,"It is empty.")
			end
		else
			doPlayerSendTextMessage(cid,22,"It is empty.")
		end
	else
		return 0
   	end		
		
   	return 1	
end