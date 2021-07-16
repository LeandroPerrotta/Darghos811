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

        addon_need_premium = 'Sorry, but only premium account may purchase a Addons.' 
        addon_have_already = 'Sorry, but you already have this addon.' 
        addon_have_not_items = 'Sorry, but you do not have all necessary items.' 
        player_gold = getPlayerItemCount(cid,2148) 
        player_plat = getPlayerItemCount(cid,2152)*100 
        player_crys = getPlayerItemCount(cid,2160)*10000 
        player_money = player_gold + player_plat + player_crys 	
         
------------------------------------------------ addon  

------------------------------------------------ 	
 		if 	msgcontains(msg, 'trade') then 
			selfSay('I have a obsidian knife and piece of royal steel to trade.') 

		elseif msgcontains(msg, 'obsidian knife') then 
			selfSay('I trade it by piece of draconian steel and obsidian lance, you have this?') 
			talk_state = 1
			
		elseif msgcontains(msg, 'piece of royal steel') then 
			selfSay('I trade it by 3 bast skirts and crown armor, you have this?') 
			talk_state = 2		
			
		elseif msgcontains(msg, 'yes') and talk_state == 1 then 
			talk_state = 0		
			if getPlayerItemCount(cid,5889) >= 1 and getPlayerItemCount(cid,2425) >= 1 then 
				if doPlayerTakeItem(cid,5889,1) == 0 and doPlayerTakeItem(cid,2425,1) == 0 then 
					selfSay('Here this your obsidian knife!') 
					doPlayerAddItem(cid,5908,1) 
				end
			else
				selfSay(addon_have_already) 
			end 
			
		elseif msgcontains(msg, 'yes') and talk_state == 2 then 
			talk_state = 0		
			if getPlayerItemCount(cid,3983) >= 3 and getPlayerItemCount(cid,2487) >= 1 then 
				if doPlayerTakeItem(cid,3983,3) == 0 and doPlayerTakeItem(cid,2487,1) == 0 then 
					selfSay('Here this your piece of royal steel!') 
					doPlayerAddItem(cid,5887,1) 
				end
			else
				selfSay(addon_have_already) 
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