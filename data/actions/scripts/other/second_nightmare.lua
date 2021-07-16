function onUse(cid, item, fromPosition, itemEx, toPosition)

	if getPlayerStorageValue(cid, 258259) == -1 then
		doCreatureSay(cid,'Congratulations! Now you have the Second Nightmare addons! ' , TALKTYPE_ORANGE_1)
		doPlayerAddOutfit(cid, 269,2)
		doPlayerAddOutfit(cid, 268,2)
		doSendMagicEffect(getPlayerPosition(cid),11)
		doSendMagicEffect(cid, {x = getPlayerPosition(cid).x + 1, y = getPlayerPosition(cid).y + 1, z = getPlayerPosition(cid).z},11) 
		doSendMagicEffect(cid, {x = getPlayerPosition(cid).x - 1, y = getPlayerPosition(cid).y - 1, z = getPlayerPosition(cid).z},1) 
		doSendMagicEffect(cid, {x = getPlayerPosition(cid).x, y = getPlayerPosition(cid).y - 1, z = getPlayerPosition(cid).z},11) 
		doSendMagicEffect(cid, {x = getPlayerPosition(cid).x - 1, y = getPlayerPosition(cid).y, z = getPlayerPosition(cid).z},11)
		doSendMagicEffect(cid, {x = getPlayerPosition(cid).x, y = getPlayerPosition(cid).y + 1, z = getPlayerPosition(cid).z},11)
		doSendMagicEffect(cid, {x = getPlayerPosition(cid).x + 1, y = getPlayerPosition(cid).y, z = getPlayerPosition(cid).z},11) 
		
		doRemoveItem(item.uid, 1)
		setPlayerStorageValue(cid,258259,1)
	else
	doCreatureSay(cid,'You already have this addon! ' , TALKTYPE_ORANGE_1)	
	doSendMagicEffect(getPlayerPosition(cid),2)
	end

	
end