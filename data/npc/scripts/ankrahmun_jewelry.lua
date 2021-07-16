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
--Pearls
shopModule:addSellableItem({'white pearl'}, 2143, 160, 'white pearl')
shopModule:addSellableItem({'black pearl'}, 2144, 280, 'black pearl')

--Gems
shopModule:addSellableItem({'small diamond'}, 2145, 300, 'small diamond')
shopModule:addSellableItem({'small sapphire'}, 2146, 250, 'small sapphire')
shopModule:addSellableItem({'small ruby'}, 2147, 250, 'small ruby')
shopModule:addSellableItem({'small emerald'}, 2149, 250, 'small emerald')
shopModule:addSellableItem({'small amethyst'}, 2150, 200, 'small amethyst')

--NPC Sell Items
--Pearls
shopModule:addBuyableItem({'white pearl'}, 2143, 320, 'white pearl')
shopModule:addBuyableItem({'black pearl'}, 2144, 560, 'black pearl')

--Gems
shopModule:addBuyableItem({'small diamond'}, 2145, 600, 'small diamond')
shopModule:addBuyableItem({'small sapphire'}, 2146, 500, 'small sapphire')
shopModule:addBuyableItem({'small ruby'}, 2147, 500, 'small ruby')
shopModule:addBuyableItem({'small emerald'}, 2149, 500, 'small emerald')
shopModule:addBuyableItem({'small amethyst'}, 2150, 400, 'small amethyst')

--Jóias
shopModule:addBuyableItem({'wedding ring'}, 2121, 990, 'wedding ring')
shopModule:addBuyableItem({'golden amulet'}, 2130, 6600, 'golden amulet')
shopModule:addBuyableItem({'ruby necklace'}, 2133, 3560, 'ruby necklace')

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
			selfSay('I offer top hat and coat (males) or hat and dress (females) for nobleman outfit!') 

		elseif msgcontains(msg, 'top hat') then 
			if getPlayerPremiumDays(cid) > 0 then 
				if getPlayerSex(cid) == 1 then
					if getPlayerStorageValue(cid,10004) == -1 then 
						if getPlayerStorageValue(cid,20004) == -1 then	
							selfSay('I sell a top hat from you for 150000 gps, back when this amount!') 
							setPlayerStorageValue(cid,20004,1)		
						else
							selfSay('Already have the 1500000 gps to buy a top hat?') 
							talk_state = 1
						end
	                else 
	                    selfSay('Sorry, you already have top hat!') 
	                end 		
				else
					selfSay('Sorry, this addon only available for male.') 
				end					
			else	
				selfSay(addon_need_premium) 
				talk_state = 0 
			end			

		elseif msgcontains(msg, 'coat') then 
			if getPlayerPremiumDays(cid) > 0 then 
				if getPlayerSex(cid) == 1 then
					if getPlayerStorageValue(cid,10005) == -1 then 
						if getPlayerStorageValue(cid,20005) == -1 then	
							selfSay('I sell a coat from you for 150000 gps, back when this amount!') 
							setPlayerStorageValue(cid,20005,1)	
						else
							selfSay('Already have the 1500000 gps to buy a coat?') 
							talk_state = 2
						end
					else 
						selfSay('Sorry, you already have coat!') 
					end
				else
					selfSay('Sorry, this addon only available for male.') 
				end		 					
			else	
				selfSay(addon_need_premium) 
				talk_state = 0 
			end				

		elseif msgcontains(msg, 'hat') then 
			if getPlayerPremiumDays(cid) > 0 then 
				if getPlayerSex(cid) == 0 then
					if getPlayerStorageValue(cid,10006) == -1 then 
						if getPlayerStorageValue(cid,20006) == -1 then	
							selfSay('I sell a hat from you for 150000 gps, back when this amount!') 
							setPlayerStorageValue(cid,20006,1)	
						else
							selfSay('Already have the 1500000 gps to buy a hat?') 
							talk_state = 3
						end
	                else 
	                    selfSay('Sorry, you already have a hat!') 
	                end 
				else
					selfSay('Sorry, this addon only available for female.') 
				end						
			else	
				selfSay(addon_need_premium) 
				talk_state = 0 
			end				

		elseif msgcontains(msg, 'dress') then 
			if getPlayerPremiumDays(cid) > 0 then 
				if getPlayerSex(cid) == 0 then
					if getPlayerStorageValue(cid,10007) == -1 then 
						if getPlayerStorageValue(cid,20007) == -1 then	
							selfSay('I sell a dress from you for 150000 gps, back when this amount!') 
							setPlayerStorageValue(cid,20007,1)		
						else
							selfSay('Already have the 1500000 gps to buy a dress?') 
							talk_state = 4
						end
	                else 
	                    selfSay('Sorry, you already have a dress!') 
	                end 					
				else
					selfSay('Sorry, this addon only available for female.') 
				end		
			else	
				selfSay(addon_need_premium) 
				talk_state = 0 
			end							

        elseif msgcontains(msg, 'yes') and talk_state > 0 and talk_state < 5 then 				
			if player_money >= 150000 then
				if doPlayerRemoveMoney(cid, 150000) == TRUE then
					if talk_state == 1 then
						selfSay('Here this your top hat!') 						
						doPlayerAddOutfit(cid, 132, 2)
						setPlayerStorageValue(cid,10004,1) 	
						talk_state = 0 	
					elseif talk_state == 2 then
						selfSay('Here this your coat!') 
						doPlayerAddOutfit(cid, 132, 1)					
						setPlayerStorageValue(cid,10005,1)
						talk_state = 0 	
					elseif talk_state == 3 then
						selfSay('Here this your dress!') 
						doPlayerAddOutfit(cid, 140, 2)							
						setPlayerStorageValue(cid,10006,1)
						talk_state = 0 	
					elseif talk_state == 4 then
						selfSay('Here this your hat!') 
						doPlayerAddOutfit(cid, 140, 1)	
						setPlayerStorageValue(cid,10007,1)
						talk_state = 0 	
					end	
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