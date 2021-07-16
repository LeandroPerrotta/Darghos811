function onUse(cid, item, fromPosition, itemEx, toPosition)
	if getPlayerSlotItem(cid, CONST_SLOT_HEAD).itemid == 6578 then
		doSendMagicEffect(getPlayerPosition(cid), CONST_ME_GIFT_WRAPS)
		return TRUE
	end
	return FALSE
end