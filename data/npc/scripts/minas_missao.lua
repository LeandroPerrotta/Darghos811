local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

-- OTServ event handling functions start
function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) 	npcHandler:onCreatureSay(cid, type, msg) end
function onThink() 						npcHandler:onThink() end
-- OTServ event handling functions end

function creatureSayCallback(cid, type, msg) 
    -- Place all your code in here. Remember that hi, bye and all that stuff is already handled by the npcsystem, so you do not have to take care of that yourself. 
    if(npcHandler.focus ~= cid) then 
        return false 
    end 
     
	if msgcontains(msg, 'mission') then
		if getPlayerStorageValue(cid,6699) == -1 then
			selfSay(msg, 'I need 40 shards, you brought them?')
			talk_state = 1
		else
			selfSay(msg, 'You have already done that mission.')
		end
		
	elseif msgcontains(msg, 'yes') and talk_state == 1 then	
		if getPlayerItemCount(cid,7290) >= 40 then 
			if doPlayerTakeItem(cid,7290,40) == 0 then 
				selfSay('Very good, you got access the dangerous mines.')
				setPlayerStorageValue(cid, 6699, 1) 
			end
		else 
			selfSay('Sorry, you need a 40 shards for complet this mission!') 
		end 
		
		talk_state = 0
		-- Place all your code in here. Remember that hi, bye and all that stuff is already handled by the npcsystem, so you do not have to take care of that yourself. 
	end	
	
    return true 
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback) 
npcHandler:addModule(FocusModule:new())