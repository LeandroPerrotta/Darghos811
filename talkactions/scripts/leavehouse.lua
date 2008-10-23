function onSay(cid, words, param)
	local pos = getPlayerPosition(cid)
	local houseInfo = getTileHouseInfo(pos)

	if pos ~= 0 then
		if getHouseOwner(houseInfo) == getPlayerGUID(cid) then
			setHouseOwner(houseInfo, 0)
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have successfully left your house.")
		else
			doPlayerSendCancel(cid, "You are not the owner of this house.")
			doSendMagicEffect(pos, CONST_ME_POFF)
		end
	else
		doPlayerSendCancel(cid, "You are not inside a house.")
		doSendMagicEffect(pos, CONST_ME_POFF)
	end
end