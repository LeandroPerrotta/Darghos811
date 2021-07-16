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


         
	if msgcontains(msg, 'warlocks') and getPlayerItemCount(cid,7898) => 1 and getPlayerItemCount(cid,7895) => 1 then
		selfSay(msg, 'Now you must prove to me is really interested in having access to secret warlocks, you must sacrifice a robe lightning and a lightning legs. Are you ready?')
	talk_state = 1
		elseif msgcontains(msg, 'yes') and talk_state == 1 then
			doPlayerTakeItem(cid, 7895, 1)
			doPlayerTakeItem(cid, 7898, 1)
		setPlayerStorageValue(cid, 4567, 1)
		selfSay('Very good, now you are a brave warrior coming from darkness, and has a power that many wanted to have, enjoy!')
		talk_state = 0
		end
			else
		selfSay('You dont is a good warrior!')
	end

    -- Place all your code in here. Remember that hi, bye and all that stuff is already handled by the npcsystem, so you do not have to take care of that yourself. 
    return true 
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback) 
npcHandler:addModule(FocusModule:new())