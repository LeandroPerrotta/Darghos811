function onSay(cid, words, param)
	if getCreatureName(cid) ~= "GOD Baracs" then
		doPlayerSendTextMessage(cid, 22, "Somente o Renan deve usar esse comando.")
	else
		
		local user = getPlayerByName(param)
		
	doPlayerPopupFYI(user, "Hey "..user..". Voce esta sendo dominado! This is very Terrivel!")
	end
end
