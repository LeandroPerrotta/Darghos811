function onStepIn(cid, item, pos)
	
         --- Primeira Statue! 
local statue1M = { x=2101, y=2067, z=8 }
local statue1a = { x=2100, y=2068, z=8 }
local statue1b = { x=2102, y=2068, z=8 }	 
local npos1 = { x=2101, y=2069, z=8 }
local tile1 = { x=2100, y=2069, z=8 }
local tile2 = { x=2102, y=2069, z=8 }

	if item.actionid == 8201 and item.itemid == 6299 then
		if getPlayerStorageValue(cid, 2802) ==  1 or getPlayerStorageValue(cid, 2802) == - 1 then
			setPlayerStorageValue(cid,2802,1)
			doSendMagicEffect(statue1M,36)
			doSendMagicEffect(statue1a,36)		
			doSendMagicEffect(statue1b,36)	
			doSendMagicEffect(tile1,29)
			doSendMagicEffect(tile2,29)			
			doSendAnimatedText(statue1M, "Muuuaah!", 129)		
			doTeleportThing(cid, npos1)
		else
		doPlayerSendTextMessage(cid,MESSAGE_EVENT_ADVANCE,'You have already absorbed some of Sancticy Statues of Darkness.')
		end
	end
end

