function onSay(cid, words, param)

local player = getPlayerByName(cid)
local pLvl = getPlayerLevel(cid)
local msg1 = "Seu Stage de experiencia no momento esta multiplicado por 12x."
local msg2 = "Seu Stage de experiencia no momento esta multiplicado por 8x."
local msg3 = "Seu Stage de experiencia no momento esta multiplicado por 6."
local msg4 = "Seu Stage de experiencia no momento esta multiplicado por 4x."
local msg5 = "Voce esta no ultimo Stage, apartir de agora, sua experiencia sera sempre multiplicada por 2x."

	if pLvl >= 1 and pLvl <= 100 then
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, msg1)
	elseif pLvl >= 101 and pLvl <= 150 then
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, msg2)		
	elseif pLvl >= 151 and pLvl <= 250 then
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, msg3)	
	elseif pLvl >= 251 and pLvl <= 300 then
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, msg4)	
	elseif pLvl >= 300 then
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, msg5)	
	return false
	end
end