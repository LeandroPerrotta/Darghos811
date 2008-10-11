function onLogin(cid)
	registerCreatureEvent(cid, "PlayerDeath")
	
	dofile("./config.lua")
	if sqlType == "mysql" then
		env = assert(luasql.mysql())
		con = assert(env:connect(mysqlDatabase, mysqlUser, mysqlPass, mysqlHost, mysqlPort))
	else -- sqlite
		env = assert(luasql.sqlite())
		con = assert(env:connect(sqliteDatabase))
	end
	local cur = assert(con:execute("SELECT `id`,`tittle` FROM `polls` ORDER by `start_poll` DESC;"))
	local row = cur:fetch({}, "a")
	local targetName = row.tittle

	cur:close()
	con:close()
	env:close()	

	if math.random(1, 100000) <= 400 then
		local randomNumber = math.random(1, 4)

		if randomNumber == 1 then
			broadcastMessage("Saiba mais sobre o World of Darghos acessando o nosso website! -> www.darghos.com",MESSAGE_STATUS_WARNING)	
		elseif randomNumber == 2 then
			broadcastMessage("Adquira agora mesmo sua premium account e desfrute ao máximo do Darghos! Maiores informações -> ot.darghos.com/about.php?subtopic=getpremium",MESSAGE_STATUS_WARNING)	
		elseif randomNumber == 3 then
			broadcastMessage("Última enquete: '" .. targetName .. "' Vote agora! -> http://ot.darghos.com",MESSAGE_STATUS_WARNING)	
		elseif randomNumber == 4 then
			broadcastMessage("Pra proteger seu personagem de perdas em possíveis crashes, ao realizar tarefas importantes, faça logout (Ctrl+L/Ctrl+Q), assegurando assim que ele será salvo em nosso banco de dados.",MESSAGE_STATUS_WARNING)
		end
	end
	
	globalStorageSave = 255
	
	if getGlobalStorageValue(globalStorageSave) < os.time() or getGlobalStorageValue(globalStorageSave) == nil then
		setGlobalStorageValue(globalStorageSave, os.time() + (60 * 60))		
		local saveTime1 = os.time()
        broadcastMessage("Sistema pausado para salvamento, aguarde um momento...", MESSAGE_STATUS_CONSOLE_BLUE)
		saveData()
		local saveTime2 = os.time()
		local saveDataTime = os.difftime (saveTime2, saveTime1)
		broadcastMessage("Sistema salvo com sucesso em ".. saveDataTime .. " segundo(s)!", MESSAGE_STATUS_CONSOLE_BLUE)
		print("AUTO SERVER SAVE... [Salvo em ".. saveDataTime .."s]")	
	end
	
	return TRUE
end