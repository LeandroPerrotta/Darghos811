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
	
if 	msgcontains(msg, 'repair') or msgcontains(msg, "magic sulphur") then 
	if getPlayerItemCount(cid, 6547)  > 15 then
		selfSay('Ohh! You are trading with me! 15 falses Magic Sulphurs for 15 trues sulphur yes?') 
		talk_state = 3
	end	
elseif msgcontains(msg, 'yes') and talk_state == 3 then
	doPlayerAddItem(cid, 5904,15)
	doPlayerTakeItem(cid, 6547, 15)
	selfSay('Here! Take yours true Magic Sulphurs!')
	talk_state = 0

	else
	selfSay('You need 15 Magic Sulphur for repair this!')
end
    -- Place all your code in here. Remember that hi, bye and all that stuff is already handled by the npcsystem, so you do not have to take care of that yourself. 
    return true 
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback) 
npcHandler:addModule(FocusModule:new())