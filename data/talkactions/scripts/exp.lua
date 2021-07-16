function onSay(cid, words, param)

	local player = getPlayerByName(param)
	local storageToPlayer = 355
	local newExp = getPlayerExperience(player) * 4
	playerLvl_1 = getPlayerLevel(player)
	
	if getPlayerGroupId(cid) == 6 then
		if player ~= 0 then
			if getPlayerStorageValue(player, storageToPlayer) == 0 or getPlayerStorageValue(player, storageToPlayer) == -1 then
				doPlayerAddExp(player, newExp)
				playerLvl_2 = getPlayerLevel(player)
				setPlayerStorageValue(player, storageToPlayer, 1)
				doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "O jogador " .. param .. " recebeu ".. newExp .. " de experiencia passando de lvl ".. playerLvl_1 .. " para lvl ".. playerLvl_2 .. ".")
			else
				doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Este personagem já foi atualizado.")
			end
		else
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Jogador não encontrado.")
		end	
	end	
end 