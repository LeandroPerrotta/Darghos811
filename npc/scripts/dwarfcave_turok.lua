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
shopModule:addSellableItem({'sabre'}, 2385, 16, 'sabre')
shopModule:addSellableItem({'machete'}, 2420, 22, 'machete')
shopModule:addSellableItem({'two handed sword', 'two-handed sword'}, 2377, 190)
shopModule:addSellableItem({'sword'}, 2376, 25, 'sword')
--Clubs
shopModule:addSellableItem({'war hammer'}, 2391, 450, 'war hammer')
shopModule:addSellableItem({'mace'}, 2398, 15, 'mace')
--Axes
shopModule:addSellableItem({'battle axe'}, 2378, 60, 'battle axe')
shopModule:addSellableItem({'double axe'}, 2387, 260, 'double axe')
shopModule:addSellableItem({'halberd'}, 2381, 400, 'halberd')
shopModule:addSellableItem({'axe'}, 2386, 15, 'axe')

--NPC Sell Items
--Others
shopModule:addBuyableItem({'spear'}, 2389, 10, 'spear')
shopModule:addBuyableItem({'throwing knife'}, 2410, 25, 'throwing knife')

function creatureSayCallback(cid, type, msg) 
    -- Place all your code in here. Remember that hi, bye and all that stuff is already handled by the npcsystem, so you do not have to take care of that yourself. 
    if(npcHandler.focus ~= cid) then 
        return false 
    end 

       player_gold = getPlayerItemCount(cid,2148) 
        player_plat = getPlayerItemCount(cid,2152)*100 
        player_crys = getPlayerItemCount(cid,2160)*10000 
        player_money = player_gold + player_plat + player_crys 

        if msgcontains(msg, 'items') or msgcontains(msg, 'item') then 
            selfSay('I sell blessed wooden stakes. I can also exchange your green tunics, red robes and mystic turbans for green, red or blue pieces of cloth also I can give you an obsidian knife if you bring me some items.') 
        elseif msgcontains(msg, 'obsidian knife') or msgcontains(msg, 'obsidian') or msgcontains(msg, 'knife') then 
            if getPlayerItemCount(cid,5889) >= 1 and getPlayerItemCount(cid,2425) >= 1 then 
                selfSay('Do you want to trade draconian steel and an onsidian lance for an obsidian knife?') 
                talk_state = 1 
            else 
                selfSay('Comeback when you have an obsidian lance and draconian steel.') 
            end 
        elseif msgcontains(msg, 'blessed stake') or msgcontains(msg, 'blessed wooden stake') then 
            selfSay('Do you want to bless your wooden stake? I need 10 vampire dust, 40 skulls, 10 grave flowers to make it.') 
            talk_state = 2 
        elseif msgcontains(msg, 'green') or msgcontains(msg, 'tunic') or msgcontains(msg, 'green tunic') or msgcontains(msg, 'green piece of cloth') then 
            selfSay('Do you want trade 40 green tunics for a green piece of cloth?') 
            talk_state = 3 
        elseif msgcontains(msg, 'red') or msgcontains(msg, 'robe') or msgcontains(msg, 'red robe') or msgcontains(msg, 'red piece of cloth') then 
            selfSay('Do you want trade a red robe for a red piece of cloth?') 
            talk_state = 4 
        elseif msgcontains(msg, 'blue') or msgcontains(msg, 'turban') or msgcontains(msg, 'mystic turban') or msgcontains(msg, 'blue piece of cloth') then 
            selfSay('Do you want trade a mystic turban for a blue piece of cloth?') 
            talk_state = 5 
		elseif msgcontains(msg, 'piece of royal steel') then 
			selfSay('I trade it by 3 bast skirts and crown armor, you have this?') 
			talk_state = 6
				elseif msgcontains(msg, 'damaged steel helmet') then 
			selfSay('I trade it by 3 steel helmets and magic sulphur, you have this?') 
			talk_state = 7
			elseif msgcontains(msg, 'enchanted chicken wing') then 
			selfSay('I trade it by 2 boots of haste, you have this?') 
			talk_state = 8
			elseif msgcontains(msg, 'Warriors Sweat') or msgcontains(msg, 'warriors sweat') or msgcontains(msg, 'warriors sweet') or msgcontains(msg, 'warriors Sweet') or msgcontains(msg, 'Warriors sweet') or msgcontains(msg, 'Warriors Sweet') or msgcontains(msg, 'warrior sweat')then
			selfSay('I trade it by 4 warriors helmet, you have this?') 
			talk_state = 9
			elseif msgcontains(msg, 'Huge Chunk of Crude Iron') then 
			selfSay('I trade it by a giant sword, you have this?') 
			talk_state = 10
------------------------------------------------ confirm yes ------------------------------------------------ 
        elseif msgcontains(msg, 'yes') and talk_state == 1 then 
            if getPlayerItemCount(cid,5889) >= 1 and getPlayerItemCount(cid,2425) >= 1 then 
                if doPlayerTakeItem(cid,5889,1) == 0 and doPlayerTakeItem(cid,2425,1) == 0 then 
                    selfSay('Here you are.') 
                    doPlayerAddItem(cid,5908,1) 
                end 
            else 
                selfSay('Sorry, you don\'t have the items.') 
            end 
            talk_state = 0 
        elseif msgcontains(msg, 'yes') and talk_state == 2 then 
            if getPlayerItemCount(cid,5941) >= 1 and getPlayerItemCount(cid,5905) >= 10 and getPlayerItemCount(cid,2229) >= 40 and getPlayerItemCount(cid,2747) >= 10 then
                if doPlayerTakeItem(cid,5941,1) == 0 and doPlayerTakeItem(cid,5905,10) == 0 and doPlayerTakeItem(cid,2229,40) and doPlayerTakeItem(cid,2747,10) then
					selfSay('In the name of the light, I bless this stake!') 
                    doPlayerAddItem(cid,5942,1) 
                end 
            else 
                selfSay('Sorry, you don\'t have the items.') 
            end 
            talk_state = 0 
        elseif msgcontains(msg, 'yes') and talk_state == 3 then 
            if getPlayerItemCount(cid,2652) >= 40 then 
                if doPlayerTakeItem(cid,2652,40) == 0 then 
                    selfSay('Here you are.') 
                    doPlayerAddItem(cid,5910,1) 
                end 
            else 
                selfSay('Sorry, you don\'t have the items.') 
            end 
            talk_state = 0 
        elseif msgcontains(msg, 'yes') and talk_state == 4 then 
            if getPlayerItemCount(cid,2655) >= 1 then 
                if doPlayerTakeItem(cid,2655,1) == 0 then 
                    selfSay('Here you are.') 
                    doPlayerAddItem(cid,5911,1) 
                end 
            else 
                selfSay('Sorry, you don\'t have the item.') 
            end 
            talk_state = 0 
        elseif msgcontains(msg, 'yes') and talk_state == 5 then 
            if getPlayerItemCount(cid,2663) >= 1 then 
                if doPlayerTakeItem(cid,2663,1) == 0 then 
                    selfSay('Here you are.') 
                    doPlayerAddItem(cid,5912,1) 
                end 
            else 
                selfSay('Sorry, you don\'t have the item.') 
            end 
            talk_state = 0 
		elseif msgcontains(msg, 'yes') and talk_state == 6 then 
			talk_state = 0		
			if getPlayerItemCount(cid,3983) >= 3 and getPlayerItemCount(cid,2487) >= 1 then 
				if doPlayerTakeItem(cid,3983,3) == 0 and doPlayerTakeItem(cid,2487,1) == 0 then 
					selfSay('Here this your piece of royal steel!') 
					doPlayerAddItem(cid,5887,1) 
				end
			else
				selfSay('Voce nao tem os itens nescessarios') 
			end 

						elseif msgcontains(msg, 'yes') and talk_state == 7 then 
			talk_state = 0		
			if getPlayerItemCount(cid,2457) >= 3 and getPlayerItemCount(cid,5904) >= 1 then 
				if doPlayerTakeItem(cid,2457,3) == 0 and doPlayerTakeItem(cid,5904,1) == 0 then 
					selfSay('Here this your damaged steel helmet!') 
					doPlayerAddItem(cid,5924,1) 
				end
			else
				selfSay('Voce nao tem os itens nescessarios') 
			end 
	 
		elseif msgcontains(msg, 'yes') and talk_state == 8 then 
			talk_state = 0		
					if getPlayerItemCount(cid,2195) >= 2 then 
				if doPlayerTakeItem(cid,2195,2) == 0 then 
					selfSay('Here this your enchanted chicken wings!') 
					doPlayerAddItem(cid,5891,1) 
				end
			else
				selfSay('Voce nao tem os itens nescessarios') 
			end 
		
			elseif msgcontains(msg, 'yes') and talk_state == 9 then 
			talk_state = 0		
		if getPlayerItemCount(cid,2475) >= 4 then 
				if doPlayerTakeItem(cid,2475,4) == 0 then 
					selfSay('Here this your  Warriors Sweat!') 
					doPlayerAddItem(cid,5885,1)
				end
			else
				selfSay('Voce nao tem os itens nescessarios') 
			end 
			
			elseif msgcontains(msg, 'yes') and talk_state == 10 then 
			talk_state = 0		
		if getPlayerItemCount(cid,2393) >= 1 then 
				if doPlayerTakeItem(cid,2393,1) == 0 then 
					selfSay('Here this your Huge Chunk of Crude Iron') 
					doPlayerAddItem(cid,5892,1)
				end
			else
				selfSay('Voce nao tem os itens nescessarios') 
			end 
------------------------------------------------ confirm no ------------------------------------------------ 
        elseif msgcontains(msg, 'no') and (talk_state >= 1 and talk_state <= 9) then 
            selfSay('Ok than.') 
            talk_state = 0 
        end 
    -- Place all your code in here. Remember that hi, bye and all that stuff is already handled by the npcsystem, so you do not have to take care of that yourself. 
    return true 
end 

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback) 
npcHandler:addModule(FocusModule:new()) 