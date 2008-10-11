local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

-- OTServ event handling functions start
function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) 	npcHandler:onCreatureSay(cid, type, msg) end
function onThink() 						npcHandler:onThink() end
-- OTServ event handling functions end



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
			selfSay('I make hat (female) for summoner outfit!') 
			
        elseif msgcontains(msg, 'trade') then 
			selfSay('I have a spool of yarn to trade.') 			
			
		elseif msgcontains(msg, 'spool of yarn') then
			selfSay('If you have 10 giant spider silks i trade it by 1 spool of yarn, you have this?') 
			talk_state = 2			

		elseif msgcontains(msg, 'hat') then 
			if getPlayerPremiumDays(cid) > 0 then 
				if getPlayerSex(cid) == 0 then
					if getPlayerStorageValue(cid,10010) == -1 then 
						if getPlayerStorageValue(cid,20010) == -1 then	
							selfSay('I make it for your! But you need have a Ferumbras Hat, and to have it you need winner a terrible Ferumbras! Come back here when this!') 
							setPlayerStorageValue(cid,20010,1)		
						else
							selfSay('Already have items to give me?') 
							talk_state = 1
						end
	                else 
	                    selfSay('Sorry, you already have hat!') 
	                end 
				else
					selfSay('Sorry, this addon only available for female.') 
				end	
			else	
				selfSay(addon_need_premium) 
				talk_state = 0 
			end				

		elseif msgcontains(msg, 'yes') and talk_state == 2 then 
			talk_state = 0		
			if getPlayerItemCount(cid,5879) >= 10 then 
				if doPlayerTakeItem(cid,5879,10) == 0 then
					selfSay('Here this your spool of yarn!') 
					doPlayerAddItem(cid,5886,1) 
				end
			else
				selfSay(addon_have_already) 
			end 	
			
        elseif msgcontains(msg, 'yes') and talk_state == 1 then 
            talk_state = 0 
            if getPlayerItemCount(cid,5903) >= 1 then 				
				if doPlayerTakeItem(cid,5903,1) then 
					selfSay('Great! Here this your hat!') 
					doPlayerAddOutfit(cid, 141, 2)
					setPlayerStorageValue(cid,10010,1) 
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