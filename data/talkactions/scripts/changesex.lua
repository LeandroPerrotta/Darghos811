function onSay(cid, words, param)
	if getPlayerPremiumDays(cid) > 2 then
		doPlayerRemovePremiumDays(cid, 3)
		if getPlayerSex(cid) == 0 then
			doPlayerSetSex(cid, 1)
		else
			doPlayerSetSex(cid, 0)
		end
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have changed your sex and lost three days of premium account.")
	else
		doPlayerSendCancel(cid, "You don't have enough premium days, changing sex costs three of your premium days.")
	end
end