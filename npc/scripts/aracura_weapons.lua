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
--Swords
shopModule:addSellableItem({'machete'}, 2420, 18, 'machete')
shopModule:addSellableItem({'bone sword'}, 2450, 22, 'bone sword')
shopModule:addSellableItem({'carlin sword'}, 2395, 200, 'carlin sword')
shopModule:addSellableItem({'heavy machete'}, 2442, 35, 'heavy machete')
shopModule:addSellableItem({'katana'}, 2412, 35, 'katana')
shopModule:addSellableItem({'longsword'}, 2397, 45, 'longsword')
shopModule:addSellableItem({'poison dagger'}, 2411, 50)
shopModule:addSellableItem({'scimitar'}, 2419, 30, 'scimitar')
shopModule:addSellableItem({'templar scytheblade'}, 3963, 58)
shopModule:addSellableItem({'spike sword'}, 2383, 600, 'spike sword')
shopModule:addSellableItem({'broad sword'}, 2413, 55, 'broad sword')
shopModule:addSellableItem({'serpent sword'}, 2409, 700, 'serpent sword')
shopModule:addSellableItem({'two handed sword', 'two-handed sword'}, 2377, 245)
shopModule:addSellableItem({'fire sword'}, 2392, 700)
shopModule:addSellableItem({'giant sword'}, 2393, 3400)
shopModule:addSellableItem({'ice rapier'}, 2396, 200)
shopModule:addSellableItem({'sword'}, 2376, 25, 'sword')
--Clubs
shopModule:addSellableItem({'bone club'}, 2449, 15, 'bone club')
shopModule:addSellableItem({'daramanian mace'}, 2439, 44, 'daramanian mace')
shopModule:addSellableItem({'battle hammer'}, 2417, 120, 'battle hammer')
shopModule:addSellableItem({'morning star'}, 2394, 75, 'morning star')
shopModule:addSellableItem({'clerical mace'}, 2423, 245, 'clerical mace')
shopModule:addSellableItem({'dragon hammer'}, 2434, 500, 'dragon hammer')
shopModule:addSellableItem({'skull staff'}, 2436, 1200, 'skull staff')
shopModule:addSellableItem({'war hammer'}, 2391, 300, 'war hammer')
shopModule:addSellableItem({'mace'}, 2398, 30, 'mace')
--Axes
shopModule:addSellableItem({'hand axe'}, 2380, 15, 'hand axe')
shopModule:addSellableItem({'golden sickle'}, 2418, 400, 'golden sickle')
shopModule:addSellableItem({'hatchet'}, 2388, 24, 'hatchet')
shopModule:addSellableItem({'orcish axe'}, 2428, 75, 'orcish axe')
shopModule:addSellableItem({'battle axe'}, 2378, 80, 'battle axe')
shopModule:addSellableItem({'barbarian axe'}, 2429, 245, 'barbarian axe')
shopModule:addSellableItem({'knight axe'}, 2430, 1200, 'knight axe')
shopModule:addSellableItem({'obsidian lance'}, 2425, 110, 'obsidian lance')
shopModule:addSellableItem({'double axe'}, 2387, 260, 'double axe')
shopModule:addSellableItem({'halberd'}, 2381, 300, 'halberd')
shopModule:addSellableItem({'fire axe'}, 2432, 1400, 'fire axe')
shopModule:addSellableItem({'dragon lance'}, 2414, 2000, 'dragon lance')
shopModule:addSellableItem({'axe'}, 2386, 15, 'axe')

--NPC Sell Items
--Swords
shopModule:addBuyableItem({'machete'}, 2420, 25, 'machete')
shopModule:addBuyableItem({'longsword'}, 2397, 75, 'longsword')
shopModule:addBuyableItem({'two handed sword', 'two-handed sword'}, 2377, 700)
shopModule:addBuyableItem({'sword'}, 2376, 35, 'sword')
--Clubs
shopModule:addBuyableItem({'clerical mace'}, 2423, 700, 'clerical mace')
shopModule:addBuyableItem({'mace'}, 2398, 45, 'mace')
--Axes
shopModule:addBuyableItem({'hatchet'}, 2388, 30, 'hatchet')
shopModule:addBuyableItem({'orcish axe'}, 2428, 165, 'orcish axe')
shopModule:addBuyableItem({'barbarian axe'}, 2429, 500, 'barbarian axe')

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
			selfSay('I make warrior\'s weapon for warrior outfit!') 

		elseif msgcontains(msg, 'warrior\'s weapon') then 
			if getPlayerPremiumDays(cid) > 0 then 
				if getPlayerStorageValue(cid,11777) == -1 then 
					if getPlayerStorageValue(cid,20003) == -1 then	
						selfSay('Great! Give me 100 iron ore and one piece of royal steel and I make it for you!') 
						setPlayerStorageValue(cid,20003,1)		
					else
						selfSay('Already have items to give me?') 
						talk_state = 1
					end
                else 
                    selfSay('Sorry, you already have warrior\'s weapon!') 
                end 					
			else	
				selfSay(addon_need_premium) 
				talk_state = 0 
			end				
	
        elseif msgcontains(msg, 'yes') and talk_state == 1 then 
            talk_state = 0 
            if getPlayerItemCount(cid,5880) >= 100 and getPlayerItemCount(cid,5887) >= 1 then 				
				if doPlayerTakeItem(cid,5880,100) == 0 and doPlayerTakeItem(cid,5887,1) == 0 then 
					selfSay('Here this your sword! Follow a good day boy!') 
					doPlayerAddOutfit(cid, 134, 2)
					doPlayerAddOutfit(cid, 142, 2)
					setPlayerStorageValue(cid,11777,1) 
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