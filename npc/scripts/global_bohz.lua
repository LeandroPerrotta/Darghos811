local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)



-- OTServ event handling functions start
function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) 	npcHandler:onCreatureSay(cid, type, msg) end
function onThink() 						npcHandler:onThink() end
-- OTServ event handling functions end

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

function creatureSayCallback(cid, type, msg) 
    -- Place all your code in here. Remember that hi, bye and all that stuff is already handled by the npcsystem, so you do not have to take care of that yourself. 
    if(npcHandler.focus ~= cid) then 
        return false 
    end 

		addon_have_not_items = 'Sorry, but you do not have all necessary items.' 	
        player_gold = getPlayerItemCount(cid,2148) 
        player_plat = getPlayerItemCount(cid,2152)*100 
        player_crys = getPlayerItemCount(cid,2160)*10000 
        player_money = player_gold + player_plat + player_crys 	
         
		
		
		
		-------------NPC BY BOWAROZ---------------ITENS--------------
		if 	msgcontains(msg, 'trade') then 
			selfSay('I have various itens to trade. What you need?') 

		elseif 	msgcontains(msg, 'job') then 
			selfSay('I am a noble traveler, I exchange rare items.') 

		elseif 	msgcontains(msg, 'offer') then 
			selfSay('I exchange many valuable items.') 

		elseif msgcontains(msg, 'enchanted chicken wing') then 
			selfSay('I trade it by a boots of haste, you have this?') 
			talk_state = 1

		elseif msgcontains(msg, 'engraved crossbow') then 
			selfSay('I trade it by a first, second, third and fourth verses of hymn, you have this?') 
			talk_state = 2

		elseif msgcontains(msg, 'piece of royal steel') then 
			selfSay('I trade it by a crown armor, you have this?') 
			talk_state = 3

		elseif msgcontains(msg, 'piece of hell steel') then 
			selfSay('I trade it by a devil helmet, you have this?') 
			talk_state = 4

		elseif msgcontains(msg, 'piece of draconian steel') then 
			selfSay('I trade it by a dragon shield, you have this?') 
			talk_state = 5

		elseif msgcontains(msg, 'crude iron') then 
			selfSay('I trade it by a giant sword, you have this?') 
			talk_state = 6

		elseif msgcontains(msg, 'damaged steel helmet') then 
			selfSay('I trade it by a five iron ores, you have this?') 
			talk_state = 7

		elseif msgcontains(msg, 'warrior\'s sweet') then 
			selfSay('I trade it by a four warrior helmets, you have this?') 
			talk_state = 8

		elseif msgcontains(msg, 'spool of yarn') then 
			selfSay('I trade it by a ten giant spider skilks, you have this?') 
			talk_state = 9

		elseif msgcontains(msg, 'blooming griffinclaw') then 
			selfSay('I trade it by a seed, you have this?') 
			talk_state = 10

		elseif msgcontains(msg, 'flask of pure water') then 
			selfSay('I trade it by a hydra egg, you have this?') 
			talk_state = 11

		elseif msgcontains(msg, 'ceiron\'s wolf tooth chain') then 
			selfSay('I trade it by a broom, you have this?') 
			talk_state = 12

		elseif msgcontains(msg, 'mermaid Comb') then 
			selfSay('I trade it by a 30 fish fins, you have this?') 
			talk_state = 13

		elseif msgcontains(msg, 'mandrake') then 
			selfSay('I trade it by a 100 holy orchid, you have this?') 
			talk_state = 14

		-----------CONFIRM-------------------------------------------

		elseif msgcontains(msg, 'yes') and talk_state == 1 then 
			talk_state = 0		
			if getPlayerItemCount(cid,2195) >= 1 then 
				if doPlayerTakeItem(cid,2195,1) == 0 then
					selfSay('Here this your enchanted chicken wing!') 
					doPlayerAddItem(cid,5891,1) 
				end
			else
				selfSay(addon_have_not_items) 
			end 

		elseif msgcontains(msg, 'yes') and talk_state == 2 then 
			talk_state = 0		
			if getPlayerItemCount(cid,6087) >= 1 and getPlayerItemCount(cid,6088) >= 1 and getPlayerItemCount(cid,6089) >= 1 and getPlayerItemCount(cid,6090) >= 1 then 
				if doPlayerTakeItem(cid,6087,1) == 0 and doPlayerTakeItem(cid,6088,1) == 0 and doPlayerTakeItem(cid,6089,1) == 0 and doPlayerTakeItem(cid,6090,1) == 0 then
					selfSay('Here this your engraved crossbow!') 
					doPlayerAddItem(cid,5947,1) 
				end
			else
				selfSay(addon_have_not_items) 
			end		

		elseif msgcontains(msg, 'yes') and talk_state == 3 then 
			talk_state = 0		
			if getPlayerItemCount(cid,2487) >= 1 then 
				if doPlayerTakeItem(cid,2487,1) == 0 then
					selfSay('Here this your piece of royal steel!') 
					doPlayerAddItem(cid,5887,1) 
				end
			else
				selfSay(addon_have_not_items) 
			end 			
				
		elseif msgcontains(msg, 'yes') and talk_state == 4 then 
			talk_state = 0		
			if getPlayerItemCount(cid,2462) >= 1 then 
				if doPlayerTakeItem(cid,2462,1) == 0 then
					selfSay('Here this your piece of hell steel!') 
					doPlayerAddItem(cid,5888,1) 
				end
			else
				selfSay(addon_have_not_items) 
			end 
	
		elseif msgcontains(msg, 'yes') and talk_state == 5 then 
			talk_state = 0		
			if getPlayerItemCount(cid,2516) >= 1 then 
				if doPlayerTakeItem(cid,2516,1) == 0 then
					selfSay('Here this your piece of draconian steel!') 
					doPlayerAddItem(cid,5889,1) 
				end
			else
				selfSay(addon_have_not_items) 
			end 
	
		elseif msgcontains(msg, 'yes') and talk_state == 6 then 
			talk_state = 0		
			if getPlayerItemCount(cid,2393) >= 1 then 
				if doPlayerTakeItem(cid,2393,1) == 0 then
					selfSay('Here this your Huge Chunk of Crude Iron!') 
					doPlayerAddItem(cid,5892,1) 
				end
			else
				selfSay(addon_have_not_items) 
			end 
	
		elseif msgcontains(msg, 'yes') and talk_state == 7 then 
			talk_state = 0		
			if getPlayerItemCount(cid,5880) >= 5 then 
				if doPlayerTakeItem(cid,5880,5) == 0 then
					selfSay('Here this your Damage Steel Helmet!') 
					doPlayerAddItem(cid,5924,1) 
				end
			else
				selfSay(addon_have_not_items) 
			end 
	
		elseif msgcontains(msg, 'yes') and talk_state == 8 then 
			talk_state = 0		
			if getPlayerItemCount(cid,2475) >= 4 then 
				if doPlayerTakeItem(cid,2475,4) == 0 then
					selfSay('Here this your warrior\'s sweet!') 
					doPlayerAddItem(cid,5885,1) 
				end
			else
				selfSay(addon_have_not_items) 
			end 
	
		elseif msgcontains(msg, 'yes') and talk_state == 9 then 
			talk_state = 0		
			if getPlayerItemCount(cid,5879) >= 10 then 
				if doPlayerTakeItem(cid,5879,10) == 0 then
					selfSay('Here this your spool of yarn!') 
					doPlayerAddItem(cid,5886,1) 
				end
			else
				selfSay(addon_have_not_items) 
			end 

		elseif msgcontains(msg, 'yes') and talk_state == 10 then 
			talk_state = 0		
			if getPlayerItemCount(cid,7732) >= 1 then 
				if doPlayerTakeItem(cid,7732,1) == 0 then
					selfSay('Here this your Blooming Griffinclaw!') 
					doPlayerAddItem(cid,5937,1) 
				end
			else
				selfSay(addon_have_not_items) 
			end 
	
		elseif msgcontains(msg, 'yes') and talk_state == 11 then 
			talk_state = 0		
			if getPlayerItemCount(cid,4850) >= 1 then 
				if doPlayerTakeItem(cid,4850,1) == 0 then
					selfSay('Here this your flask of pure water!') 
					doPlayerAddItem(cid,5938,1) 
				end
			else
				selfSay(addon_have_not_items) 
			end 

		elseif msgcontains(msg, 'yes') and talk_state == 12 then 
			talk_state = 0		
			if getPlayerItemCount(cid,2551) >= 1 then 
				if doPlayerTakeItem(cid,2551,1) == 0 then
					selfSay('Here this your flask of pure water!') 
					doPlayerAddItem(cid,5940,1) 
				end
			else
				selfSay(addon_have_not_items) 
			end 

		elseif msgcontains(msg, 'yes') and talk_state == 13 then 
			talk_state = 0		
			if getPlayerItemCount(cid,5895) >= 30 then 
				if doPlayerTakeItem(cid,5895,30) == 0 then
					selfSay('Here this your Mermaid Comb!') 
					doPlayerAddItem(cid,5945,1) 
				end
			else
				selfSay(addon_have_not_items) 
			end 

		elseif msgcontains(msg, 'yes') and talk_state == 14 then 
			talk_state = 0		
			if getPlayerItemCount(cid,5922) >= 100 then 
				if doPlayerTakeItem(cid,5922,100) == 0 then
					selfSay('Here this your Mandrake!') 
					doPlayerAddItem(cid,5015,1) 
				end
			else
				selfSay(addon_have_not_items) 
			end 

        elseif msgcontains(msg, 'no') and (talk_state >= 1 and talk_state <= 34) then 
            selfSay('Skip well.') 
            talk_state = 0 
        end 
    -- Place all your code in here. Remember that hi, bye and all that stuff is already handled by the npcsystem, so you do not have to take care of that yourself. 
    return true 
end	

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback) 	
npcHandler:addModule(FocusModule:new())