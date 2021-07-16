local function doRemoveObject(cid, pos)
	pos.stackpos = 255
	local object = getThingfromPos(pos)
	local playerPos = getPlayerPosition(cid)

	if(object.uid > 0 and isCreature(object.uid) == FALSE and isMoveable(object.uid) == TRUE) then
		doPlayerSendTextMessage(cid,22,"Runa desativada temporariamente.")
		return LUA_NO_ERROR
	end

	doPlayerSendDefaultCancel(cid, RETURNVALUE_NOTPOSSIBLE)
	doSendMagicEffect(playerPos, 26)
	return LUA_ERROR
end

function onCastSpell(cid, var)
	local pos = variantToPosition(var)
	if(pos.x ~= 0 and pos.y ~= 0 and pos.z ~= 0) then
		doPlayerSendTextMessage(cid,22,"Runa desativada temporariamente.")
	end

	doPlayerSendDefaultCancel(cid, RETURNVALUE_NOTPOSSIBLE)
	doSendMagicEffect(getPlayerPosition(cid), 26)
	return LUA_ERROR
end