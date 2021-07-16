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

shopModule:addBuyableItem({'assassin star'}, 7368, 100, 'assassin star')


function creatureSayCallback(cid, type, msg) 
    -- Place all your code in here. Remember that hi, bye and all that stuff is already handled by the npcsystem, so you do not have to take care of that yourself. 
    if(npcHandler.focus ~= cid) then 
        return false 
    end 


--------------- Missão para entrar em tortoise
	if msgcontains(msg, 'tortoise') then
		if getPlayerStorageValue(cid,2022) == -1 then
			selfSay(msg, 'I need 100 tortoise eggs, you brought them?')
			talk_state = 1
		else
			selfSay(msg, 'You have already done that mission.')
		end
		
	elseif msgcontains(msg, 'yes') and talk_state == 1 then	
		if getPlayerItemCount(cid,5678) >= 100 then 
			if doPlayerTakeItem(cid,5678,100) == 0 then 
				selfSay('Very good, you got access the tortoise island.')
				setPlayerStorageValue(cid, 2022, 1) 
			end
		else 
			selfSay('Sorry, you need a 100 tortoise eggs for complet this mission!') 
		end 
		talk_state = 0

--------------- NPC que da missão pra fazer a quest de acesso aos quaras
	elseif 	msgcontains(msg, 'mission') then 
		if getPlayerStorageValue(cid, 6555) == -1 then
			selfSay('Your are prepared for this mission?')
			talk_state =  2
		else
		selfSay('Voce ja tem essa quest.')
		end	
		
		elseif msgcontains(msg, 'yes') and talk_state == 2 then
			selfSay('Now you must go to a high of Lizards in stone sacred sacrifice the head of the giant chicken.') 
			doPlayerAddItem(cid,3970,1)
			setPlayerStorageValue(cid, 6555, 1)
			
			
		
		
-------- Ajuda sobre como entrar em Quara Hell
		elseif msgcontains(msg, 'access')then

				selfSay('Oooh you have a lightning robe and a lightning legs for me?')
				talk_state = 3
	
		elseif msgcontains(msg, 'yes') and talk_state == 3 then
			if getPlayerItemCount(cid,7898) >= 1 and getPlayerItemCount(cid,7895) >= 1 then
				if doPlayerTakeItem(cid, 7898,1) == 0 and doPlayerTakeItem(cid,7895,1) == 0 then
					setPlayerStorageValue(cid, 4567, 1)
					selfSay('Okay, thank you, Now you have acess in secret Heroes Caves.')
				end
			else
			selfSay('You need a lightning set for complet this mission!')
			end	
		talk_state = 0

		--------
		elseif msgcontains(msg, 'help') then
		selfSay('You need help?')
		talk_state = 4
			elseif msgcontains(msg, 'yes') and talk_state == 4 then
		selfSay('To get access to quaras you should talk to mission with me, then go to the lizards and click on the stone of life, and to have access to secret cave of warlocks talk about "access".')
		talk_state = 0	

	-------- trocando fish fins por um Mermaid Comb

		elseif msgcontains(msg, 'mermaid comb')then
		if getPlayerItemCount(cid,5895) >= 100 and getPlayerStorageValue(cid, 8777) == -1 then
			setPlayerStorageValue(cid, 8777, 1)
			doPlayerTakeItem(cid, 5895, 100)
			doPlayerAddItem(cid,5945,1)
			selfSay('Congratulations, you have conquisted my heart, now you is a friend of Herams Squad!')
		else 
			selfSay('Sorry, for trade with me for a mermaid comb, you need more fish fins........')
		end
			
		
			
	




    -- Place all your code in here. Remember that hi, bye and all that stuff is already handled by the npcsystem, so you do not have to take care of that yourself. 
 end 
  return true 
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback) 
npcHandler:addModule(FocusModule:new())