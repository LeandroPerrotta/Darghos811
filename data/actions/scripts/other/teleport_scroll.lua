scrollUseTable = {}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	dofile("./config.lua")

	if sqlType == "mysql" then
		env = assert(luasql.mysql())
		con = assert(env:connect(mysqlDatabase, mysqlUser, mysqlPass, mysqlHost, mysqlPort))
	else -- sqlite
		env = assert(luasql.sqlite())
		con = assert(env:connect(sqliteDatabase))
	end

	if fromPosition.x ~= 65535 then
		doPlayerSendCancel(cid, "Esse item só pode ser usado quando dentro de um container.")

		return TRUE
	end

	if getPlayerPremiumDays(cid) ~= 0 then
		if getPlayerPremiumDays(cid) > 2 then
			local timeNowTerrivel = os.time() 

			if scrollUseTable[cid] and (timeNowTerrivel - scrollUseTable[cid]) < 3 then
				doPlayerSendCancel(cid, "Esse item só pode ser usado uma vez a cada 3 segundos.")

				return TRUE
			end

			print("O jogador ".. getPlayerName(cid) .." usou teleport Scroll.")	
			
			scrollUseTable[cid] = timeNowTerrivel

			doPlayerRemovePremiumDays(cid, 2)
			doSendMagicEffect(getPlayerPosition(cid),10)
					doSendMagicEffect(cid, {x = getPlayerPosition(cid).x + 1, y = getPlayerPosition(cid).y + 1, z = getPlayerPosition(cid).z},47) 
					doSendMagicEffect(cid, {x = getPlayerPosition(cid).x - 1, y = getPlayerPosition(cid).y - 1, z = getPlayerPosition(cid).z},47) 
					doSendMagicEffect(cid, {x = getPlayerPosition(cid).x, y = getPlayerPosition(cid).y - 1, z = getPlayerPosition(cid).z},47) 
					doSendMagicEffect(cid, {x = getPlayerPosition(cid).x - 1, y = getPlayerPosition(cid).y, z = getPlayerPosition(cid).z},47)
				    doSendMagicEffect(cid, {x = getPlayerPosition(cid).x, y = getPlayerPosition(cid).y + 1, z = getPlayerPosition(cid).z},47)
					doSendMagicEffect(cid, {x = getPlayerPosition(cid).x + 1, y = getPlayerPosition(cid).y, z = getPlayerPosition(cid).z},47)
					doSendMagicEffect(cid, {x = getPlayerPosition(cid).x + 1, y = getPlayerPosition(cid).y - 1, z = getPlayerPosition(cid).z},47)
					doSendMagicEffect(cid, {x = getPlayerPosition(cid).x - 1, y = getPlayerPosition(cid).y + 1, z = getPlayerPosition(cid).z},47)
				doRemoveCondition(cid, 1024)
				doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, 'Seu Pz Lock foi resetado, agora voce esta sem Battle.')
				
				
			if(getPlayerTown(cid) == 1) then
				doTeleportThing(cid,quendorTemple,1)
				doSendMagicEffect(quendorTemple,10)
				doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, 'Você gastou 2 premium days e foi teleportado para o templo de Quendor. Agora você possui ' .. getPlayerPremiumDays(cid) .. ' premium days.')
			elseif(getPlayerTown(cid) == 2) then
				doTeleportThing(cid,aracuraTemple,1)		
				doSendMagicEffect(aracuraTemple,10)

				doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, 'Você gastou 2 premium days e foi teleportado para o templo de Aracura. Agora você possui ' .. getPlayerPremiumDays(cid) .. ' premium days.')
			elseif(getPlayerTown(cid) == 3) then
				doTeleportThing(cid,rookTemple,1)
				doSendMagicEffect(rookTemple,10)
				doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, 'Você gastou 2 premium days e foi teleportado para o templo de Rookguard. Agora você possui ' .. getPlayerPremiumDays(cid) .. ' premium days.')
			elseif(getPlayerTown(cid) == 4) then
				doTeleportThing(cid,thornTemple,1)		
				doSendMagicEffect(thornTemple,10)
				doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, 'Você gastou 2 premium days e foi teleportado para o templo de Thorn. Agora você possui ' .. getPlayerPremiumDays(cid) .. ' premium days.')		
			elseif(getPlayerTown(cid) == 5) then
				doTeleportThing(cid,salazartTemple,1)		
				doSendMagicEffect(salazartTemple,10)
				doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, 'Você gastou 2 premium days e foi teleportado para o templo de Salazart. Agora você possui ' .. getPlayerPremiumDays(cid) .. ' premium days.')			
			elseif(getPlayerTown(cid) == 7) then
				doTeleportThing(cid,northrendTemple,1)		
				doSendMagicEffect(northrendTemple,10)
				doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, 'Você gastou 2 premium days e foi teleportado para o templo de Northrend. Agora você possui ' .. getPlayerPremiumDays(cid) .. ' premium days.')			
			end			

			if (getPlayerGroupId(cid) <= 2) then    
				assert(con:execute("INSERT INTO item_shop (`item_name`, `account_id`, `date`, `price`) values ('teleport scroll','" .. getPlayerAccount(cid) .. "','" .. timeNowTerrivel .. "','2');"))
			end

			
		else
			doPlayerSendCancel(cid, "Para usar este item é necessario ter 2 premium days disponiveis.")
		end	
	else
		doPlayerSendCancel(cid, "Para usar este item é necessario ser premium account.")
	end	

	return TRUE	
end 