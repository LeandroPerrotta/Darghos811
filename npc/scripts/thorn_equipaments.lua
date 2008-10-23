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
shopModule:addSellableItem({'chain armor'}, 2464, 60, 'chain armor')
shopModule:addSellableItem({'brass armor'}, 2465, 140, 'brass armor')
shopModule:addSellableItem({'scale armor'}, 2483, 95, 'scale armor')
shopModule:addSellableItem({'dark armor'}, 2489, 160, 'dark armor')
shopModule:addSellableItem({'noble armor'}, 2486, 600, 'noble armor')
shopModule:addSellableItem({'knight armor'}, 2476, 3500, 'knight armor')

--Shields
shopModule:addSellableItem({'wooden shield'}, 2512, 6, 'wooden shield')
shopModule:addSellableItem({'brass shield'}, 2511, 15, 'brass shield')
shopModule:addSellableItem({'plate shield'}, 2510, 30, 'plate shield')
shopModule:addSellableItem({'copper shield'}, 2530, 46, 'copper shield')
shopModule:addSellableItem({'bone shield'}, 2541, 60, 'bone shield')
shopModule:addSellableItem({'steel shield'}, 2509, 64, 'steel shield')
shopModule:addSellableItem({'viking shield'}, 2531, 160, 'viking shield')
shopModule:addSellableItem({'battle shield'}, 2513, 75, 'battle shield')
shopModule:addSellableItem({'scarab shield'}, 2540, 180, 'scarab shield')
shopModule:addSellableItem({'dwarven shield'}, 2525, 210, 'dwarven shield')
shopModule:addSellableItem({'ancient shield'}, 2532, 160, 'ancient shield')
shopModule:addSellableItem({'beholder shield'}, 2518, 450, 'beholder shield')
shopModule:addSellableItem({'dragon shield'}, 2516, 2500, 'dragon shield')
shopModule:addSellableItem({'tower shield'}, 2528, 4000, 'tower shield')

--Legs
shopModule:addSellableItem({'studded legs'}, 2468, 36, 'studded legs')
shopModule:addSellableItem({'chain legs'}, 2648, 65, 'chain legs')
shopModule:addSellableItem({'brass legs'}, 2478, 150, 'brass legs')
shopModule:addSellableItem({'plate legs'}, 2647, 900, 'plate legs')

--Helmets
shopModule:addSellableItem({'mystic turban'}, 2663, 66, 'mystic turban')
shopModule:addSellableItem({'chain helmet'}, 2458, 8, 'chain helmet')
shopModule:addSellableItem({'studded helmet'}, 2482, 8, 'studded helmet')
shopModule:addSellableItem({'brass helmet'}, 2460, 30, 'brass helmet')
shopModule:addSellableItem({'legion helmet'}, 2480, 45, 'legion helmet')
shopModule:addSellableItem({'soldier helmet'}, 2481, 72, 'soldier helmet')
shopModule:addSellableItem({'steel helmet'}, 2457, 290, 'steel helmet')
shopModule:addSellableItem({'crown helmet'}, 2491, 1600, 'crown helmet')
shopModule:addSellableItem({'warrior helmet'}, 2475, 2500, 'warrior helmet')

--Boots
shopModule:addSellableItem({'leather boots'}, 2643, 5, 'leather boots')

--NPC Sell Items
--Armors
shopModule:addBuyableItem({'brass armor'}, 2465, 265, 'brass armor')

--Shields
shopModule:addBuyableItem({'wooden shield'}, 2512, 22, 'wooden shield')


--Legs
shopModule:addBuyableItem({'chain legs'}, 2648, 200, 'chain legs')

--Helmets
shopModule:addBuyableItem({'soldier helmet'}, 2481, 200, 'soldier helmet')

--Boots
shopModule:addBuyableItem({'leather boots'}, 2643, 10, 'leather boots')

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
			selfSay('I make shoulder spike for warrior outfit!') 

		elseif msgcontains(msg, 'shoulder spike') then 
			if getPlayerPremiumDays(cid) > 0 then 
				if getPlayerStorageValue(cid,10002) == -1 then 
					if getPlayerStorageValue(cid,20002) == -1 then	
						selfSay('You want to shoulder spike? I can make one for you, collect 100 hardened bones, 100 turtle shells, 1 fighting spirit and 1 dragon claw! Me look when achieve them!') 
						setPlayerStorageValue(cid,20002,1)		
					else
						selfSay('You collected all the items?') 
						talk_state = 1
					end
                else 
                    selfSay('Sorry, you already have shoulder spike!') 
                end 					
			else	
				selfSay(addon_need_premium) 
				talk_state = 0 
			end				

		
        elseif msgcontains(msg, 'yes') and talk_state == 1 then 
            talk_state = 0 
            if getPlayerItemCount(cid,5925) >= 100 and getPlayerItemCount(cid,5899) >= 100 and getPlayerItemCount(cid,5884) >= 1 and getPlayerItemCount(cid,5919) >= 1 then 				
				if doPlayerTakeItem(cid,5925,100) == 0 and doPlayerTakeItem(cid,5899,100) == 0 and doPlayerTakeItem(cid,5884,1) and doPlayerTakeItem(cid,5919,1) then 
					selfSay('Perfect! Here is your shoulder spike!') 
					doPlayerAddOutfit(cid, 134, 1)
					doPlayerAddOutfit(cid, 142, 1)
					setPlayerStorageValue(cid,10002,1) 
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