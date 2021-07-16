function onStepIn(cid, item, pos)
	if item.itemid == 416 or item.itemid == 3216 or item.itemid == 446 then
		doTransformItem(item.uid, item.itemid + 1)
		if item.actionid > 1000 then
			getLevelTile(cid, item, pos)
		else
			getDepotItems(cid, item)
		end
	-- Banshee Quest --	
	elseif item.uid == 5000 then
		if getPlayerStorageValue(cid, 5000) == -1 then
			setPlayerStorageValue(cid, 5000, 1)
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE,'You conquered the mission of Queenary Banshee Quest.')
			doSendMagicEffect(fromPosition, CONST_ME_MAGIC_BLUE)
		else
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE,'You have already won the Queenary Mission.')
		end
	-- Banshee Quest | 2 --
	elseif item.uid == 5001 then
		if getPlayerStorageValue(cid, 5001) == -1 then
			setPlayerStorageValue(cid, 5001, 1)
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE,'You conquered the mission of Rysion Banshee Quest.')
			doSendMagicEffect(fromPosition, CONST_ME_MAGIC_BLUE)
		else
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE,'You have already won the Rysion Mission.')
		end
	-- Banshee Quest | 3 --
	elseif item.uid == 5002 then
		if getPlayerStorageValue(cid, 5002) == -1 then
			setPlayerStorageValue(cid, 5002, 1)
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE,'You conquered the mission of Stalazan Banshee Quest.')
			doSendMagicEffect(fromPosition, CONST_ME_MAGIC_BLUE)
		else
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE,'You have already won the Stalazan Mission.')
		end
	-- Banshee Quest | 4 --
	elseif item.uid == 5003 then
		if getPlayerStorageValue(cid, 5003) == -1 then
			setPlayerStorageValue(cid, 5003, 1)
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE,'You conquered the mission of Saintly Banshee Quest.')
			doSendMagicEffect(fromPosition, CONST_ME_MAGIC_BLUE)
		else
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE,'You have already won the Saintly Mission.')
		end
	-- Banshee Quest | 5 --
	elseif item.uid == 5004 then
		if getPlayerStorageValue(cid, 5004) == -1 then
			setPlayerStorageValue(cid, 5004, 1)
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE,'You conquered the mission of Khazus Banshee Quest.')
			doSendMagicEffect(fromPosition, CONT_ME_MAGIC_BLUE)
		else
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE,'You have already won the Khazus Mission.')
		end
	-- Banshee Quest | 6 --
	elseif item.uid == 5005 then
		if getPlayerStorageValue(cid, 5005) == -1 then
			setPlayerStorageValue(cid, 5005, 1)
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE,'You conquered the mission of Rhamoa Banshee Quest.')
			doSendMagicEffect(fromPosition, CONT_ME_MAGIC_BLUE)
		else	
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE,'You have already won the Rhamoa Mission.')
		end	

		--------------- entrada secret tumba
									
			elseif item.ActionID == 1473 then
		if getPlayerStorageValue(cid, 1470) == 1 then
		teleportPos = {x=2282, y=2541, z=11}	
		doTeleportThing(cid,teleportPos,1)
			
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE,'You are in temple of mages.')
			doSendMagicEffect(fromPosition, CONST_ME_MAGIC_BLUE)
		else
			doPlayerSendCancel(cid,"Sorry, this place is for prepared peoples.")
		end
	
	elseif item.ActionID == 1471 then
		if getPlayerStorageValue(cid, 1472) == 1 then
			setPlayerStorageValue(cid, 1475, 1)
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE,'You conquered the mission of the Mages Temple Quest.')
			doSendMagicEffect(fromPosition, CONT_ME_MAGIC_BLUE)
		else	
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE,'Its only prepared peoples.')
		end	



		elseif item.itemid == 426 then
		doTransformItem(item.uid, 425)
		if item.actionid > 1000 then
			getLevelTile(cid, item, pos)
		else
			getDepotItems(cid, item)
		end
	elseif item.itemid == 1510 or item.itemid == 1512 then
		doTransformItem(item.uid, item.itemid+1)
		doCreatureAddHealth(cid, -30)
		doSendMagicEffect(pos,0)
		doSendAnimatedText(pos,30,180)
	elseif item.itemid == 293 or item.itemid == 461 then
		doTransformItem(item.uid, item.itemid + 1)
		doDecayItem(item.uid)
	elseif item.itemid == 2579 then
		doTransformItem(item.uid, item.itemid - 1)
		doSendMagicEffect(pos, CONST_ME_POFF)
		if getPlayerHealth(cid) > 30 then
			doCreateItem(2019, 2, pos)
			doSendAnimatedText(pos,30,180)
			if isPlayer(cid) == 1 then
				doPlayerSendTextMessage(cid, 20, "You lose 30 hitpoints.")
			end
		else
			doSendAnimatedText(pos, getCreatureHealth(cid), 180)
			if isPlayer(cid) == 1 then
				if getCreatureHealth(cid) > 1 then
					doPlayerSendTextMessage(cid, 20, "You lose " .. getHealth(cid) .. " hitpoints.")
				else
					doPlayerSendTextMessage(cid, 20, "You lose 1 hitpoint.")
				end
			end
		end
		doCreatureAddHealth(cid, -30)
	elseif item.itemid == 1387 then
		if item.actionid == 4000 then
			doPlayerSendTextMessage(cid,MESSAGE_EVENT_ADVANCE,'Now you are citizen of Quendor.')
			doPlayerSetTown(cid,1)
		elseif item.actionid == 4001 then
			doPlayerSendTextMessage(cid,MESSAGE_EVENT_ADVANCE,'Now you are citizen of Thorn.')
			doPlayerSetTown(cid,4)
		elseif item.actionid == 4002 then
			doPlayerSendTextMessage(cid,MESSAGE_EVENT_ADVANCE,'Now you are citizen of Aracura.')
			doPlayerSetTown(cid,2)
		elseif item.actionid == 4003 then
			doPlayerSendTextMessage(cid,MESSAGE_EVENT_ADVANCE,'Now you are citizen of Salazart.')
			doPlayerSetTown(cid,5)	
		elseif item.actionid == 4004 then
			doPlayerSendTextMessage(cid,MESSAGE_EVENT_ADVANCE,'Now you are citizen of Northrend.')
			doPlayerSetTown(cid,7)				
		elseif item.actionid == 4010 then
			createPos = {x=2052, y=2025, z=7, stackpos=1}
			doCreateItem(1304,1,createPos)
		end	
	end
end

function onStepOut(cid, item, pos)
	if item.itemid == 417 or item.itemid == 447 or item.itemid == 1511 or item.itemid == 1513 or item.itemid == 3217 then
		doTransformItem(item.uid, item.itemid - 1)
	elseif item.itemid == 425 then
		doTransformItem(item.uid, 426)
	end
end

function getLevelTile(cid, item, pos)
	if isPlayer(cid) == 1 then			
		if getPlayerLevel(cid) < item.actionid - 1000 then
			doTeleportThing(cid,teleport(cid))
			doSendMagicEffect(pos, CONST_ME_MAGIC_BLUE)
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You need level " .. item.actionid - 1000 .. " to pass here.")
		end
	end
end

function getDepotItems(cid, item)
	if item.actionid > 100 and item.actionid < 120 then
		if isPlayer(cid) == 1 then
			depotItems = getPlayerDepotItems(cid, item.actionid - 100)
			if depotItems < 2 then
				doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, "Your depot contains 1 item.")
			else
				doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, "Your depot contains " ..depotItems.. " items.")
			end
		end
	end
end