function onUse(cid, item, fromPosition, itemEx, toPosition)
	RANDOM = math.random(1,100)
	CHANCE = 20
	if RANDOM < CHANCE then
		doPlayerAddItem(cid, 4842, 1)		
	end
	doSendMagicEffect(fromPosition, CONST_ME_GIFT_WRAPS)
	doRemoveItem(item.uid, 1)
end