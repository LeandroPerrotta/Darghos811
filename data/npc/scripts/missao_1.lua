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


         
----------------  Djin Mission 1
if 	msgcontains(msg, 'mission') then 
	if getPlayerStorageValue(cid, 6001) == -1 then
		setPlayerStorageValue(cid, 6001, 1)
		selfSay('Now your mission, is kill all djins of tower, and ask with Avelas, about Mission.') 
	end
else
	selfSay('You have already completed the missions of Djin Tower.') 
end 

    -- Place all your code in here. Remember that hi, bye and all that stuff is already handled by the npcsystem, so you do not have to take care of that yourself. 
    return true 
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback) 
npcHandler:addModule(FocusModule:new())