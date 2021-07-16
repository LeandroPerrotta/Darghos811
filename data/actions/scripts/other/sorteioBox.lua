function onUse(cid, item, fromPosition, itemEx, toPosition)

	if item.actionid == 7890 and item.itemid == 3612 then
		dofile("./config.lua")
		if sqlType == "mysql" then
			env = assert(luasql.mysql())
			con = assert(env:connect(mysqlDatabase, mysqlUser, mysqlPass, mysqlHost, mysqlPort))
		else -- sqlite
			env = assert(luasql.sqlite())
			con = assert(env:connect(sqliteDatabase))
		end
		
		local cur = assert(con:execute("SELECT `key` FROM site.`account_tickets`;"))
		local tickets_rows = numRows(cur)
		local sortID = math.random(1, tickets_rows) 
		
		cur:close()
		
		local cur = assert(con:execute("SELECT `key` FROM site.`account_tickets` WHERE `id` = '".. sortID .. "';"))
		local row = cur:fetch({}, "a")
		local key_prized = row.key
		
		cur:close()
		con:close()
		env:close()		
			
		prizeStorage = 245
		
		local allPrizes = 0
		
		if getGlobalStorageValue(prizeStorage) == nil or getGlobalStorageValue(prizeStorage) == -1 then
			prize = "um Ipod Shuffler"
			setGlobalStorageValue(prizeStorage, 1)
		elseif getGlobalStorageValue(prizeStorage) == 1 then
			prize = "um Ipod Shuffler"
			setGlobalStorageValue(prizeStorage, 2)
		elseif getGlobalStorageValue(prizeStorage) == 2 then
			prize = "360 premium days"
			setGlobalStorageValue(prizeStorage, 3)	
		elseif getGlobalStorageValue(prizeStorage) == 3 then
			prize = "90 premium days"
			setGlobalStorageValue(prizeStorage, 4)
		elseif getGlobalStorageValue(prizeStorage) == 4 then
			prize = "90 premium days"
			setGlobalStorageValue(prizeStorage, 5)		
		elseif getGlobalStorageValue(prizeStorage) == 5 then
			prize = "90 premium days"
			setGlobalStorageValue(prizeStorage, 6)		
		elseif getGlobalStorageValue(prizeStorage) == 6 then
			prize = "90 premium days"
			setGlobalStorageValue(prizeStorage, 7)	
		elseif getGlobalStorageValue(prizeStorage) == 7 then
			prize = "90 premium days"		
			setGlobalStorageValue(prizeStorage, 8)	
		else
			allPrizes = 1
		end	
		
		if allPrizes == 0 then
			broadcastMessage("Foi sorteado " .. prize .. " ao bilhete com a chave numero: ".. key_prized .. "! Ao proprietario do bilhete parabens pelo prêmio!", MESSAGE_STATUS_WARNING)	
		end
			
		return TRUE	
	end	
end 