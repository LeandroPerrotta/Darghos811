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
shopModule:addSellableItem({'rope'}, 2120, 8, 'rope')

--NPC Sell Items
shopModule:addBuyableItem({'rope'}, 2120, 50, 'rope')
shopModule:addBuyableItem({'pick'}, 2553, 50, 'pick')
shopModule:addBuyableItem({'shovel'}, 2554, 10, 'shovel')
shopModule:addBuyableItem({'fishing rod'}, 2580, 150, 'fishing rod')
shopModule:addBuyableItem({'scythe'}, 2550, 50, 'scythe')
shopModule:addBuyableItem({'torch'}, 2050, 2, 'torch')

shopModule:addBuyableItem({'green backpack'}, 1998, 20, 'green backpack')
shopModule:addBuyableItem({'yellow backpack'}, 1999, 20, 'yellow backpack')
shopModule:addBuyableItem({'red backpack'}, 2000, 20, 'red backpack')
shopModule:addBuyableItem({'pink backpack'}, 2001, 20, 'pink backpack')
shopModule:addBuyableItem({'blue backpack'}, 2002, 20, 'blue backpack')
shopModule:addBuyableItem({'silver backpack'}, 2003, 20, 'silver backpack')
shopModule:addBuyableItem({'gold backpack'}, 2004, 20, 'gold backpack')
shopModule:addBuyableItem({'brown backpack', 'backpack'}, 1988, 20, 'brown backpack')

function creatureSayCallback(cid, type, msg) 
    -- Place all your code in here. Remember that hi, bye and all that stuff is already handled by the npcsystem, so you do not have to take care of that yourself. 
    if(npcHandler.focus ~= cid) then 
        return false 
    end 
-------------------------------------------------------- addon
	if 	msgcontains(msg, 'the mages temple') and getPlayerStorageValue(cid, 1472) == -1 then 
		selfSay('The mages temple are infected with good mages, are you really for fight with Warlocks and others mages?.') 
		talk_state = 1
		
	elseif msgcontains(msg, 'yes') and talk_state == 1 then 
			talk_state = 2		
			selfSay('You really with any certainty is not afraid of the big dangers, forces of darkness, magic strong, and fears for adventure?!') 
	
		
	elseif msgcontains(msg, 'yes') and talk_state == 2 then 
			talk_state = 3
			setPlayerStorageValue(cid, 1472, 1)
			selfSay('Now you need to pass the blessing contained in the tomb of fire, and stepping on a piece of yellow ground, you will receive the powers of Alakamu.')
		
	elseif msgcontains(msg, 'access') and getPlayerStorageValue(cid, 1471) == 1 then 
		
		selfSay('You went to the piece of ground, and Alakamu came with the blessing of it?.') 
		talk_state = 4
	
	elseif msgcontains(msg, 'yes') and talk_state == 4 then 
			talk_state = 2		
			selfSay('Good work man!')
			setPlayerStorageValue(cid, 1470, 1)
			doSendMagicEffect(fromPosition, CONT_ME_MAGIC_BLUE)			
					
	elseif msgcontains(msg, 'no') and (talk_state >= 1 and talk_state <= 34) then 
	
		selfSay('Tudo bem! Obrigado.') 
		talk_state = 0 
	end 
	
    -- Place all your code in here. Remember that hi, bye and all that stuff is already handled by the npcsystem, so you do not have to take care of that yourself. 
    return true 
end 	

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback) 
npcHandler:addModule(FocusModule:new())