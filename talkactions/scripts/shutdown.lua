function onSay(cid)
	
	if (getPlayerGroupId(cid) >= 5) then
		
		shutdown(cid, 1)
		addEvent(shutdown(cid, 2), 1000 * 60 * 5)
		addEvent(shutdown(cid, 3), 1000 * 60 * 7)
		addEvent(shutdown(cid, 4), 1000 * 60 * 9)
		addEvent(shutdown(cid, 5), 1000 * 60 * 10)
	end	
end 

function shutdown(cid, shutState)
	
	if shutState == 1 then
		broadcastMessage("Server is saving game in 10 minutes. Please come back in 10 minutes.", MESSAGE_STATUS_WARNING)
	elseif shutState == 2 then
		broadcastMessage("Server is saving game in 5 minutes. Please come back in 10 minutes.", MESSAGE_STATUS_WARNING)
	elseif shutState == 3 then
		broadcastMessage("Server is saving game in 3 minutes. Please come back in 10 minutes.", MESSAGE_STATUS_WARNING)
	elseif shutState == 4 then
		broadcastMessage("Server is saving game in 1 minutes. Please come back in 10 minutes.", MESSAGE_STATUS_WARNING)
	elseif shutState == 5 then
		saveData()
		doCreatureSay(cid, "/closeserver", TALKTYPE_SAY)
		print("/n Server is saved and closed... [done]")
		print("You can now exit program...")			
	end	
end 		