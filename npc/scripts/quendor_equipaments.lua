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
--Armors
shopModule:addSellableItem({'studded armor'}, 2484, 8, 'studded armor')
shopModule:addSellableItem({'chain armor'}, 2464, 60, 'chain armor')
shopModule:addSellableItem({'brass armor'}, 2465, 140, 'brass armor')
shopModule:addSellableItem({'scale armor'}, 2483, 75, 'scale armor')
shopModule:addSellableItem({'plate armor'}, 2463, 300, 'plate armor')
shopModule:addSellableItem({'dark armor'}, 2489, 160, 'dark armor')
shopModule:addSellableItem({'noble armor'}, 2486, 600, 'noble armor')
shopModule:addSellableItem({'knight armor'}, 2476, 3500, 'knight armor')

--Shields
shopModule:addSellableItem({'wooden shield'}, 2512, 6, 'wooden shield')
shopModule:addSellableItem({'studded shield'}, 2526, 8, 'studded shield')
shopModule:addSellableItem({'brass shield'}, 2511, 15, 'brass shield')
shopModule:addSellableItem({'bone shield'}, 2541, 60, 'bone shield')
shopModule:addSellableItem({'steel shield'}, 2509, 64, 'steel shield')
shopModule:addSellableItem({'dwarven shield'}, 2525, 210, 'dwarven shield')
shopModule:addSellableItem({'guardian shield'}, 2515, 800, 'guardian shield')
shopModule:addSellableItem({'dragon shield'}, 2516, 2500, 'dragon shield')
shopModule:addSellableItem({'tower shield'}, 2528, 4000, 'tower shield')

--Legs
shopModule:addSellableItem({'chain legs'}, 2648, 65, 'chain legs')
shopModule:addSellableItem({'brass legs'}, 2478, 150, 'brass legs')

--Helmets
shopModule:addSellableItem({'mystic turban'}, 2663, 50, 'mystic turban')
shopModule:addSellableItem({'chain helmet'}, 2458, 8, 'chain helmet')
shopModule:addSellableItem({'studded helmet'}, 2482, 8, 'studded helmet')
shopModule:addSellableItem({'viking helmet'}, 2473, 66, 'viking helmet')
shopModule:addSellableItem({'iron helmet'}, 2459, 90, 'iron helmet')
shopModule:addSellableItem({'steel helmet'}, 2457, 290, 'steel helmet')
shopModule:addSellableItem({'dark helmet'}, 2490, 200, 'dark helmet')
shopModule:addSellableItem({'strange helmet'}, 2479, 250, 'strange helmet')
shopModule:addSellableItem({'crown helmet'}, 2491, 1600, 'crown helmet')
shopModule:addSellableItem({'warrior helmet'}, 2475, 2500, 'warrior helmet')

--NPC Sell Items

--Shields
shopModule:addBuyableItem({'brass shield'}, 2511, 35, 'brass shield')
shopModule:addBuyableItem({'plate shield'}, 2510, 45, 'plate shield')

--Legs
shopModule:addBuyableItem({'studded legs'}, 2468, 40, 'studded legs')

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
        if msgcontains(msg, 'addon') then 
			selfSay('I make backpack and feather hat for citizen outfit!') 

		elseif 	msgcontains(msg, 'backpack') then 
			if getPlayerPremiumDays(cid) > 0 then 
				if getPlayerStorageValue(cid,10000) == -1 then 
					if getPlayerStorageValue(cid,20000) == -1 then	
						selfSay('You want a backpack? Bring me 100 minotaur leather I make one for you!') 
						setPlayerStorageValue(cid,20000,1)		
					else
						selfSay('Already have items to give me?') 
						talk_state = 1
					end
                else 
                    selfSay('Sorry, you already have a backpack!') 
                end 					
			else	
				selfSay(addon_need_premium) 
				talk_state = 0 
			end				

		
		elseif 	msgcontains(msg, 'feather hat') then 
			if getPlayerPremiumDays(cid) > 0 then 
				if getPlayerStorageValue(cid,10001) == -1 then 
					if getPlayerStorageValue(cid,20001) == -1 then	
						selfSay('To make that I need 100 chicken feathers, 50 honeycombs and a legion helmet!') 
						setPlayerStorageValue(cid,20001,1)		
					else
						selfSay('Already have items to give me?') 
						talk_state = 2
					end
                else 
                    selfSay('Sorry, you already have a feather hat!') 
                end 					
			else	
				selfSay(addon_need_premium) 
				talk_state = 0 
			end			
		
        elseif msgcontains(msg, 'yes') and talk_state == 1 then 
            talk_state = 0 
            if getPlayerItemCount(cid,5878) >= 100 then 		
				if doPlayerTakeItem(cid,5878,100) == 0 then 
					selfSay('Here this your backpack!') 
					doPlayerAddOutfit(cid, 128, 1) 
					doPlayerAddOutfit(cid, 136, 1) 
					setPlayerStorageValue(cid,10000,1) 
				end 
            else 
                selfSay(addon_have_not_items) 
            end 			

		
        elseif msgcontains(msg, 'yes') and talk_state == 2 then 
            talk_state = 0 
            if getPlayerItemCount(cid,5890) >= 100 and getPlayerItemCount(cid,5902) >= 50 and getPlayerItemCount(cid,2480) >= 1 then 	
				if doPlayerTakeItem(cid,5890,100) == 0 and doPlayerTakeItem(cid,5902,50) == 0 and doPlayerTakeItem(cid,2480,1) == 0 then 
					selfSay('Here this your feather hat!') 
					doPlayerAddOutfit(cid, 128, 2) 
					doPlayerAddOutfit(cid, 136, 2) 
					setPlayerStorageValue(cid,10001,1) 
				end 
            else 
                selfSay(addon_have_not_items) 
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