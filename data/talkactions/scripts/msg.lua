function onSay(cid, words, param)

	if (getPlayerGroupId(cid) >= 3) then
		broadcastMessage(param,MESSAGE_STATUS_WARNING)	
	else
        doPlayerSendCancel(cid, "You can not execute this command.")
    end	
end