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
shopModule:addSellableItem({'dragon necklace'}, 2201, 100, 'dragon necklace')
shopModule:addSellableItem({'energy ring'}, 2167, 100, 'energy ring')
shopModule:addSellableItem({'life ring'}, 2168, 50, 'life ring')
shopModule:addSellableItem({'might ring'}, 2164, 250, 'might ring')
shopModule:addSellableItem({'protection amulet'}, 2200, 100, 'protection amulet')
shopModule:addSellableItem({'ring of healing'}, 2214, 100, 'ring of healing')
shopModule:addSellableItem({'silver amulet'}, 2170, 50, 'silver amulet')
shopModule:addSellableItem({'strange talisman'}, 2161, 30, 'strange talisman')
shopModule:addSellableItem({'time ring'}, 2169, 100, 'time ring')
shopModule:addSellableItem({'moonlight rod'}, 2186, 200, 'moonlight rod')
shopModule:addSellableItem({'volcanic rod'}, 2185, 1000, 'volcanic rod')
shopModule:addSellableItem({'quagmire rod'}, 2181, 2000, 'quagmire rod')
shopModule:addSellableItem({'tempest rod'}, 2183, 3000, 'tempest rod')

--NPC Sell Items
shopModule:addBuyableItem({'dragon necklace'}, 2201, 1000, 'dragon necklace')
shopModule:addBuyableItem({'energy ring'}, 2167, 2000, 'energy ring')
shopModule:addBuyableItem({'life ring'}, 2168, 900, 'life ring')
shopModule:addBuyableItem({'might ring'}, 2164, 5000, 'might ring')
shopModule:addBuyableItem({'protection amulet'}, 2200, 700, 'protection amulet')
shopModule:addBuyableItem({'ring of healing'}, 2214, 3500, 'ring of healing')
shopModule:addBuyableItem({'silver amulet'}, 2170, 100, 'silver amulet')
shopModule:addBuyableItem({'strange talisman'}, 2161, 100, 'strange talisman')
shopModule:addBuyableItem({'time ring'}, 2169, 2000, 'time ring')

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
         
------------------------------------------------ addon  

------------------------------------------------ 		

		if 	msgcontains(msg, 'trade') then 
			selfSay('Give Me three swords of fire and I give you a reward!') 
			talk_state = 1			
						
		elseif msgcontains(msg, 'yes') and talk_state == 1 then 
			talk_state = 0		
			if getPlayerItemCount(cid,2392) >= 3 then 
				if doPlayerTakeItem(cid,2392,3) == 0 then 
					selfSay('Here this your magic sulphur!') 
					doPlayerAddItem(cid,5904,1) 
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