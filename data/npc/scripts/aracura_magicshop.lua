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

shopModule:addBuyableItem({'backpack of avalanche', 'bp of avalanche'}, {1988, 2274, 9, 20},	20*270,	'backpack of avalanche runes')
shopModule:addBuyableItem({'backpack of ultimate healing', 'bp of ultimate healing'}, {1988, 2273, 3, 20},	20*270,	'backpack of ultimate healing runes')
shopModule:addBuyableItem({'backpack of heavy magic missile', 'bp of heavy magic missile'},	{1988, 2311, 30, 20},	20*150,	'backpack of heavy magic missile runes')
shopModule:addBuyableItem({'backpack of great fireball', 'bp of great fireball'},	{1988, 2304, 12, 20},	20*270,	'backpack of great fireball runes')
shopModule:addBuyableItem({'backpack of explosion', 'bp of explosion'},	{1988, 2313, 18, 20},	20*360,	'backpack of explosion runes')
shopModule:addBuyableItem({'backpack of sudden death', 'bp of sudden death'},	{1988, 2268, 9, 20},	20*450,	'backpack of sudden death runes')
shopModule:addBuyableItem({'backpack of magic wall', 'bp of magic wall'},	{1988, 2293, 9, 20},	20*330,	'backpack of magic wall runes')
shopModule:addBuyableItem({'backpack of paralize', 'bp of paralize'},	{1988, 2278, 3, 20},	20*600,	'backpack of paralize runes')
shopModule:addBuyableItem({'backpack of blank rune', 'bp of blank rune'},	{1988, 2260, 1, 20},	20*10,	'backpack of blank rune runes')
shopModule:addBuyableItem({'backpack of manafluid', 'backpack of mana fluid'},	{1988, 2006, 7, 20},	20*55,	'backpack of manafluid')

--potions
shopModule:addBuyableItem({'backpack of strong mana potion'},	{1988, 7589, 1, 20},	20*80,	'bp of strong mana potion')
shopModule:addBuyableItem({'backpack of great mana potion'},	{1988, 7590, 1, 20},	20*120,	'bp of great mana potion')
shopModule:addBuyableItem({'backpack of mana potion'},	{1988, 7620, 1, 20},	20*50,	'bp of mana potion')

shopModule:addBuyableItem({'backpack of strong health potion'},	{1988, 7588, 1, 20},	20*100,	'bp of strong health potion')
shopModule:addBuyableItem({'backpack of great health potion'},	{1988, 7591, 1, 20},	20*190,	'bp of great health potion')
shopModule:addBuyableItem({'backpack of ultimate health potion'},	{1988, 8377, 1, 20},	20*310,	'bp of ultimate health potion')
shopModule:addBuyableItem({'backpack of health potion'},	{1988, 7618, 1, 20},	20*45,	'bp of health potion')

shopModule:addBuyableItem({'backpack of great spirit potion'},	{1988, 8376, 1, 20},	20*190,	'bp of great spirit potion')

shopModule:addBuyableItem({'strong mana potion'}, 7589, 80, 'strong mana potion')
shopModule:addBuyableItem({'great mana potion'}, 7590, 120, 'great mana potion')
shopModule:addBuyableItem({'mana potion'}, 7620, 50, 'mana potion')

shopModule:addBuyableItem({'great spirit potion'}, 8376, 190, 'great spirit potion')

shopModule:addBuyableItem({'strong health potion'}, 7588, 100, 'strong health potion')
shopModule:addBuyableItem({'great health potion'}, 7591, 190, 'great health potion')
shopModule:addBuyableItem({'ultimate health potion'}, 8377, 310, 'ultimate health potion')
shopModule:addBuyableItem({'health potion'}, 7618, 45, 'health potion')

-- Magic Items
shopModule:addBuyableItem({'light wand', 'lightwand'}, 2163, 100, 'magic light wand')
shopModule:addBuyableItem({'mana fluid', 'manafluid'}, 2006, 55, 7, 'mana fluid')
shopModule:addBuyableItem({'life fluid', 'lifefluid'}, 2006, 60, 10, 'life fluid')

-- Wands
shopModule:addBuyableItem({'wand of vortex', 'vortex'}, 2190, 100, 'wand of vortex')
shopModule:addBuyableItem({'wand of dragonbreath', 'dragonbreath'}, 2191, 1000, 'wand of dragonbreath')
shopModule:addBuyableItem({'wand of plague', 'plague'}, 2188, 5000, 'wand of plague')
shopModule:addBuyableItem({'wand of cosmic energy', 'cosmic energy'}, 2189, 10000, 'wand of cosmic energy')
shopModule:addBuyableItem({'wand of inferno', 'inferno'}, 2187, 15000, 'wand of inferno')

-- Rods
shopModule:addBuyableItem({'snakebite rod', 'snakebite'}, 2182, 500, 'snakebite rod')
shopModule:addBuyableItem({'moonlight rod', 'moonlight'}, 2186, 1000, 'moonlight rod')
shopModule:addBuyableItem({'volcanic rod', 'volcanic'}, 2185, 5000, 'volcanic rod')
shopModule:addBuyableItem({'quagmire rod', 'quagmire'}, 2181, 10000, 'quagmire rod')
shopModule:addBuyableItem({'tempest rod', 'tempest'}, 2183, 15000, 'tempest rod')

-- Runes
shopModule:addBuyableItem({'ultimate healing'}, 2273, 270, 3, 'ultimate healing rune')
shopModule:addBuyableItem({'heavy magic missile'}, 2311, 150, 15, 'heavy magic missile rune')
shopModule:addBuyableItem({'great fireball'}, 2304, 270, 6, 'great fireball rune')
shopModule:addBuyableItem({'explosion'}, 2313, 360, 9, 'explosion rune')
shopModule:addBuyableItem({'sudden death'}, 2268, 450, 3, 'sudden death rune')
shopModule:addBuyableItem({'magic wall'}, 2293, 330, 9, 'magic wall rune')
shopModule:addBuyableItem({'paralize'}, 2278, 600, 3, 'paralize rune')
shopModule:addBuyableItem({'blank rune'}, 2260, 10, 'blank rune')

shopModule:addSellableItem({'empty strong potion flask'}, 7634, 7, 'empty strong potion flask')
shopModule:addSellableItem({'empty great potion flask'}, 7635, 10, 'empty great potion flask')
shopModule:addSellableItem({'empty potion flask'}, 7636, 5, 'empty potion flask')

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
			selfSay('I make cloak (male) for summoner outfit!') 

		elseif msgcontains(msg, 'cloak') then 
			if getPlayerPremiumDays(cid) > 0 then 
				if getPlayerSex(cid) == 1 then
					if getPlayerStorageValue(cid,10009) == -1 then 
						if getPlayerStorageValue(cid,20009) == -1 then	
							selfSay('A make it for you! Take 70 bat wings, 20 red piece of cloth, 40 ape fur, 35 holy orchids, 10 spider silk yarn, 60 lizard scales, 40 red dragon scales, 15 magic sulphur and 30 vampire dust, come back here when this!') 
							setPlayerStorageValue(cid,20009,1)		
						else
							selfSay('Already have items to give me?') 
							talk_state = 1
						end
	                else 
	                    selfSay('Sorry, you already have cloak!') 
	                end 
				else
					selfSay('Sorry, this addon only available for male.') 
				end	
			else	
				selfSay(addon_need_premium) 
				talk_state = 0 
			end				

		
        elseif msgcontains(msg, 'yes') and talk_state == 1 then 
            talk_state = 0 
            if getPlayerItemCount(cid,5894) >= 70 and getPlayerItemCount(cid,5911) >= 20 and getPlayerItemCount(cid,5922) >= 35 and getPlayerItemCount(cid,5886) >= 10 and getPlayerItemCount(cid,5881) >= 60 and getPlayerItemCount(cid,5882) >= 40 and getPlayerItemCount(cid,5904) >= 15 and getPlayerItemCount(cid,5905) >= 30 then 				
				if doPlayerTakeItem(cid,5894,70) and doPlayerTakeItem(cid,5911,20) and doPlayerTakeItem(cid,5922,35) and doPlayerTakeItem(cid,5886,10) and doPlayerTakeItem(cid,5881,60) and doPlayerTakeItem(cid,5882,40) and doPlayerTakeItem(cid,5904,15) and doPlayerTakeItem(cid,5905,30) then 
					selfSay('Here this cloak!') 
					doPlayerAddOutfit(cid, 133, 2)
					setPlayerStorageValue(cid,10009,1) 
				end 
            else 
                selfSay(addon_have_not_items) 
            end 

        elseif msgcontains(msg, 'vial') then 
			selfSay('I have a promotion for you! If you have 100 vials you can trade it for one lottery ticket! If you have prize you can trade this for bonus! You have the vials?') 
			talk_state = 2

		elseif msgcontains(msg, 'yes') and talk_state == 2 then 
            talk_state = 0 
            if getPlayerItemCount(cid,2006) >= 100 or getPlayerItemCount(cid,7636) >= 100 then 				
				if doPlayerTakeItem(cid,2006,100) or doPlayerTakeItem(cid,7636,100) then 
					selfSay('Great! Here this your lottery ticket!') 
					doPlayerAddItem(cid,5957,1) 
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