function onLogin(cid)
	registerCreatureEvent(cid, "PlayerDeath")	

	if math.random(1, 100000) <= 400 then
		local randomNumber = math.random(1, 2)

		if randomNumber == 1 then
			broadcastMessage("Saiba mais sobre o World of Darghos acessando o nosso website! -> www.darghos.com",MESSAGE_STATUS_WARNING)	
		elseif randomNumber == 2 then
			broadcastMessage("Adquira agora mesmo sua premium account e desfrute ao máximo do Darghos! Maiores informações -> ot.darghos.com/about.php?subtopic=getpremium",MESSAGE_STATUS_WARNING)	
		end
	end
	
--[[	globalStorageSave = 255
	
	if getGlobalStorageValue(globalStorageSave) < os.time() or getGlobalStorageValue(globalStorageSave) == nil then
		setGlobalStorageValue(globalStorageSave, os.time() + (60 * 60))		
		local saveTime1 = os.time()
        broadcastMessage("Sistema pausado para salvamento, aguarde um momento...", MESSAGE_STATUS_CONSOLE_BLUE)
		saveData()
		local saveTime2 = os.time()
		local saveDataTime = os.difftime (saveTime2, saveTime1)
		broadcastMessage("Sistema salvo com sucesso em ".. saveDataTime .. " segundo(s)!", MESSAGE_STATUS_CONSOLE_BLUE)
		print("AUTO SERVER SAVE... [Salvo em ".. saveDataTime .."s]")	
	end ]]--
	
	return TRUE
end