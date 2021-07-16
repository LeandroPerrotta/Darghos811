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
shopModule:addSellableItem({'rapier'}, 2384, 12, 'rapier')
shopModule:addSellableItem({'short sword'}, 2406, 12, 'short sword')
shopModule:addSellableItem({'sabre'}, 2385, 16, 'sabre')
shopModule:addSellableItem({'machete'}, 2420, 16, 'machete')
shopModule:addSellableItem({'bone sword'}, 2450, 22, 'bone sword')
shopModule:addSellableItem({'heavy machete'}, 2442, 35, 'heavy machete')
shopModule:addSellableItem({'longsword'}, 2397, 22, 'longsword')
shopModule:addSellableItem({'scimitar'}, 2419, 30, 'scimitar')
shopModule:addSellableItem({'spike sword'}, 2383, 600, 'spike sword')
shopModule:addSellableItem({'broad sword'}, 2413, 55, 'broad sword')
shopModule:addSellableItem({'two handed sword', 'two-handed sword'}, 2377, 190)
shopModule:addSellableItem({'fire sword'}, 2392, 2000)
shopModule:addSellableItem({'ice rapier'}, 2396, 200)
shopModule:addSellableItem({'sword'}, 2376, 25, 'sword')
--Clubs
shopModule:addSellableItem({'bone club'}, 2449, 15, 'bone club')
shopModule:addSellableItem({'daramanian mace'}, 2439, 44, 'daramanian mace')
shopModule:addSellableItem({'battle hammer'}, 2417, 120, 'battle hammer')
shopModule:addSellableItem({'morning star'}, 2394, 60, 'morning star')
shopModule:addSellableItem({'clerical mace'}, 2423, 160, 'clerical mace')
shopModule:addSellableItem({'dragon hammer'}, 2434, 800, 'dragon hammer')
shopModule:addSellableItem({'skull staff'}, 2436, 2000, 'skull staff')
shopModule:addSellableItem({'war hammer'}, 2391, 500, 'war hammer')
shopModule:addSellableItem({'mace'}, 2398, 30, 'mace')
--Axes
shopModule:addSellableItem({'hand axe'}, 2380, 12, 'hand axe')
shopModule:addSellableItem({'hatchet'}, 2388, 24, 'hatchet')
shopModule:addSellableItem({'orcish axe'}, 2428, 60, 'orcish axe')
shopModule:addSellableItem({'battle axe'}, 2378, 60, 'battle axe')
shopModule:addSellableItem({'barbarian axe'}, 2429, 160, 'barbarian axe')
shopModule:addSellableItem({'knight axe'}, 2430, 1000, 'knight axe')
shopModule:addSellableItem({'obsidian lance'}, 2425, 110, 'obsidian lance')
shopModule:addSellableItem({'double axe'}, 2387, 260, 'double axe')
shopModule:addSellableItem({'halberd'}, 2381, 400, 'halberd')
shopModule:addSellableItem({'axe'}, 2386, 15, 'axe')

--NPC Sell Items
--Swords
shopModule:addBuyableItem({'machete'}, 2420, 25, 'machete')
shopModule:addBuyableItem({'two handed sword', 'two-handed sword'}, 2377, 700)
--Clubs
shopModule:addBuyableItem({'clerical mace'}, 2423, 700, 'clerical mace')
shopModule:addBuyableItem({'mace'}, 2398, 45, 'mace')
--Axes
shopModule:addBuyableItem({'hatchet'}, 2388, 30, 'hatchet')
shopModule:addBuyableItem({'barbarian axe'}, 2429, 700, 'barbarian axe')

function creatureSayCallback(cid, type, msg) 
    -- Place all your code in here. Remember that hi, bye and all that stuff is already handled by the npcsystem, so you do not have to take care of that yourself. 
    if(npcHandler.focus ~= cid) then 
        return false 
    end 

        addon_need_premium = 'Descupe, mas so posso fazer addons a jogadores com Premium Account.' 
        addon_have_already = 'Descupe, mas voce ja possui este addon.' 
        addon_have_not_items = 'Descupe, mas voce nao possui todos itens necessarios.' 
        player_gold = getPlayerItemCount(cid,2148) 
        player_plat = getPlayerItemCount(cid,2152)*100 
        player_crys = getPlayerItemCount(cid,2160)*10000 
        player_money = player_gold + player_plat + player_crys 	
         
------------------------------------------------ addon  

------------------------------------------------ 		
		if 	msgcontains(msg, 'small iron') then 
			if getPlayerPremiumDays(cid) > 0 then 
				selfSay('Eu posso fazer um pequeno e raro metal muito usado por anoes para voce! Para isso preciso apenas do escudo dos dragoes! Você possui-o?') 
				talk_state = 1
			else	
				selfSay(addon_need_premium) 
				talk_state = 0 
			end	
		
        elseif msgcontains(msg, 'yes') and talk_state == 1 then 
            talk_state = 0 
            if getPlayerItemCount(cid,2516) == 1 then 
                addon = getPlayerStorageValue(cid,10003) 
                if addon == -1 then 
                    if doPlayerTakeItem(cid,2516,1) == 0 then 
                        selfSay('Um momentinho... Aqui esta seu pequeno metal!') 
						doPlayerAddItem(cid,5889,1) 
						setPlayerStorageValue(cid,10003,1) 
                    end 
                else 
                    selfSay(addon_have_already) 
                end 
            else 
                selfSay(addon_have_not_items) 
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