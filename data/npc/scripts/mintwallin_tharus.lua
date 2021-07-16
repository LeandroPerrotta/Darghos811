local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)		npcHandler:onCreatureAppear(cid)		end
function onCreatureDisappear(cid)	npcHandler:onCreatureDisappear(cid)		end
function onCreatureSay(cid, type, msg)	npcHandler:onCreatureSay(cid, type, msg)	end
function onThink()			npcHandler:onThink()				end

function creatureSayCallback(cid, type, msg) 
    -- Place all your code in here. Remember that hi, bye and all that stuff is already handled by the npcsystem, so you do not have to take care of that yourself. 
    if(npcHandler.focus ~= cid) then 
        return false 
    end 

        player_gold = getPlayerItemCount(cid,2148) 
        player_plat = getPlayerItemCount(cid,2152)*100 
        player_crys = getPlayerItemCount(cid,2160)*10000 
        player_money = player_gold + player_plat + player_crys 	
         
------------------------------------------------ addon  

------------------------------------------------ 	
 		if 	msgcontains(msg, 'protected cell') then 
			selfSay('This cell of the prison can only be opened with the key of the prison.') 

		elseif msgcontains(msg, 'key of the prision') then 
			selfSay('I have this key and i can sell it for 5000 gps for you! You do want?') 
			talk_state = 1
			
		elseif msgcontains(msg, 'yes') and talk_state == 1 then 
			talk_state = 0		
			if doPlayerRemoveMoney(cid, 5000) == TRUE then
				selfSay('Here is the key!') 
				itemId = doPlayerAddItem(cid,2092,1) 
				doSetItemActionId(itemId, 2000)
			else
				selfSay("You don't have enough money.")
			end		
	
        elseif msgcontains(msg, 'no') and (talk_state >= 1 and talk_state <= 34) then 
            selfSay('Ok! Goodbye.') 
            talk_state = 0 
        end 
    -- Place all your code in here. Remember that hi, bye and all that stuff is already handled by the npcsystem, so you do not have to take care of that yourself. 
    return true 
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())