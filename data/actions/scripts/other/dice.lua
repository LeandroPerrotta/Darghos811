function onUse(cid, item, fromPosition, itemEx, toPosition)
	local dice = math.random(5792, 5797)
	if fromPosition.x ~= CONTAINER_POSITION then
		doSendMagicEffect(cid, fromPosition, CONST_ME_CRAPS)
	end
	doTransformItem(item.uid, dice)
	doCreatureSay(cid, getCreatureName(cid) .. ' rolled a ' .. dice - 5791 .. '.', TALKTYPE_ORANGE_1)
	return TRUE
end