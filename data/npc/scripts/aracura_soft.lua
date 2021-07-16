local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
 
-- OTServ event handling functions start
function onCreatureAppear(cid)                npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid)             npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg)     npcHandler:onCreatureSay(cid, type, msg) end
function onThink()                         npcHandler:onThink() end
-- OTServ event handling functions end
 
function creatureSayCallback(cid, type, msg)
    -- Place all your code in here. Remember that hi, bye and all that stuff is already handled by the npcsystem, so you do not have to take care of that yourself.
    if(npcHandler.focus ~= cid) then
        return false
    end
 
        
        if msgcontains(msg, 'repair') or msgcontains(msg, 'worn soft boot') then
            selfSay('Did you like that i fix ur worn soft boots? it will cost 15 crystal coins')
            talk_state = 1
 
 
        elseif msgcontains(msg, 'yes') and talk_state == 1 then
            if getPlayerItemCount(cid,6530) >= 1 and getPlayerItemCount(cid,2160)  >= 15 then
                if doPlayerTakeItem(cid,6530,1) and doPlayerRemoveMoney(cid, 150000) == 1 then
	                    doPlayerAddItem(cid,6132,1)
							selfSay('Now you have a new soft boots.')

                end
            else
                selfSay('Sorry, you don\'t have the item.')
            end
 
 
        elseif msgcontains(msg, 'no') and (talk_state >= 1 and talk_state <= 5) then
            selfSay('Ok then.')
            talk_state = 0
        end
    -- Place all your code in here. Remember that hi, bye and all that stuff is already handled by the npcsystem, so you do not have to take care of that yourself.
    return true
end
 
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())