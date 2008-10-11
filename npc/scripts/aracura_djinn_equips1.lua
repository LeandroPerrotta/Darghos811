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

--NPC Buy Items
shopModule:addSellableItem({'magma coat'}, 7899, 21000, 'magma coat')
shopModule:addSellableItem({'magma legs'}, 7894, 18000, 'magma legs')
shopModule:addSellableItem({'magma boots'}, 7891, 6000, 'magma boots')
shopModule:addSellableItem({'beholder shield'}, 2518, 1500, 'beholder shield')
shopModule:addSellableItem({'blue robe'}, 2656, 4000, 'blue robe')
shopModule:addSellableItem({'boots of haste'}, 2195, 11000, 'boots of haste')
shopModule:addSellableItem({'broad sword'}, 2413, 500, 'broad sword')
shopModule:addSellableItem({'crown armor'}, 2487, 4500, 'crown armor')
shopModule:addSellableItem({'crown helmet'}, 2491, 1500, 'crown helmet')
shopModule:addSellableItem({'crown legs'}, 2488, 6000, 'crown legs')
shopModule:addSellableItem({'crown shield'}, 2519, 2700, 'crown shield')
shopModule:addSellableItem({'crusader helmet'}, 2497, 2500, 'crusader helmet')
shopModule:addSellableItem({'dragon lance'}, 2414, 7000, 'dragon lance')
shopModule:addSellableItem({'dragon shield'}, 2516, 2500, 'dragon shield')
shopModule:addSellableItem({'fire axe'}, 2432, 5000, 'fire axe')
shopModule:addSellableItem({'fire sword'}, 2392, 2500, 'fire sword')
shopModule:addSellableItem({'guardian shield'}, 2515, 1200, 'guardian shield')
shopModule:addSellableItem({'ice rapier'}, 2396, 1500, 'ice rapier')
shopModule:addSellableItem({'noble armor'}, 2486, 1500, 'noble armor')
shopModule:addSellableItem({'obsidian lance'}, 2425, 500, 'obsidian lance')
shopModule:addSellableItem({'phoenix shield'}, 2539, 16500, 'phoenix shield')
shopModule:addSellableItem({'royal helmet'}, 2498, 9500, 'royal helmet')
shopModule:addSellableItem({'spike sword'}, 2383, 1000, 'spike sword')
shopModule:addSellableItem({'war hammer'}, 2391, 1800, 'war hammer')
shopModule:addSellableItem({'golden armor'}, 2466, 18000, 'golden armor')
shopModule:addSellableItem({'dragon scale mail'}, 2492, 20000, 'dragon scale mail')
shopModule:addSellableItem({'demon shield'}, 2520, 15000, 'demon shield')
shopModule:addSellableItem({'medusa shield'}, 2536, 4800, 'medusa shield')
shopModule:addSellableItem({'mastermind shield'}, 2514, 22500, 'mastermind shield')
shopModule:addSellableItem({'golden legs'}, 2470, 18900, 'golden legs')
shopModule:addSellableItem({'magic plate armor'}, 2472, 29000, 'magic plate armor')
shopModule:addSellableItem({'demonrage sword'}, 7382, 14600, 'demonrage sword')
shopModule:addSellableItem({'skull helmet'}, 5741, 18250, 'skull helmet')
shopModule:addSellableItem({'cranical basher'}, 7415, 10000, 'cranical basher')

--NPC Sell Items
shopModule:addBuyableItem({'beholder shield'}, 2518, 7000, 'beholder shield')
shopModule:addBuyableItem({'noble armor'}, 2486, 8000, 'noble armor')
shopModule:addBuyableItem({'spike sword'}, 2383, 8000, 'spike sword')
shopModule:addBuyableItem({'war hammer'}, 2391, 10000, 'war hammer')

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
         
		
		
		
		-------------------------------------------------------- addon
		if 	msgcontains(msg, 'trade') then 
			selfSay('I have a fighting spirit to trade.') 

		elseif msgcontains(msg, 'fighting spirit') then 
			selfSay('I trade it by two royal helmets, you have this?') 
			talk_state = 1
			
		elseif msgcontains(msg, 'yes') and talk_state == 1 then 
			talk_state = 0		
			if getPlayerItemCount(cid,2498) >= 2 then 
				if doPlayerTakeItem(cid,2498,2) == 0 then
					selfSay('Here this your fighting spirit!') 
					doPlayerAddItem(cid,5884,1) 
				end
			else
				selfSay(addon_have_already) 
			end 	
					
        elseif msgcontains(msg, 'no') and (talk_state >= 1 and talk_state <= 34) then 
            selfSay('Tudo bem! Obrigado.') 
            talk_state = 0 
        end 
    -- Place all your code in here. Remember that hi, bye and all that stuff is already handled by the npcsystem, so you do not have to take care of that yourself. 
    return true 
end	

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback) 	
npcHandler:addModule(FocusModule:new())