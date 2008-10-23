local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)		npcHandler:onCreatureAppear(cid)		end
function onCreatureDisappear(cid)	npcHandler:onCreatureDisappear(cid)		end
function onCreatureSay(cid, type, msg)	npcHandler:onCreatureSay(cid, type, msg)	end
function onThink()			npcHandler:onThink()				end

function creatureSayCallback(cid, type, msg)
	if(npcHandler.focus ~= cid) then
		return FALSE
	end
	
	addon_need_premium = 'Sorry, but only premium account may purchase a Addons.' 
	addon_have_already = 'Sorry, but you already have this addon.' 
	addon_have_not_items = 'Sorry, but you do not have all necessary items.' 
	player_gold = getPlayerItemCount(cid,2148) 
	player_plat = getPlayerItemCount(cid,2152)*100 
	player_crys = getPlayerItemCount(cid,2160)*10000 
	player_money = player_gold + player_plat + player_crys 		
	
	if msgcontains(msg, 'addon') then 
		selfSay('I make a wand (female) for summoner outfit!') 	
	
	elseif msgcontains(msg, 'wand') then 
		if getPlayerPremiumDays(cid) > 0 then 
			if getPlayerSex(cid) == 0 then
				if getPlayerStorageValue(cid,10009) == -1 then 
					if getPlayerStorageValue(cid,20009) == -1 then	
						selfSay('You want a magic wand? I can do this for you! Bring Me all wands and rods, 10 magic sulphur, 20 ankhs and 1 soul stone! Talk to me when you have this!') 
						setPlayerStorageValue(cid,20009,1)		
					else
						selfSay('Already have items to give me?') 
						talk_state = 6
					end
				else 
					selfSay('Sorry, you already have wand!') 
				end 
			else
				selfSay('Sorry, this addon only available for female.') 
			end	
		else	
			selfSay(addon_need_premium) 
			talk_state = 0 
		end				

	
	elseif msgcontains(msg, 'yes') and talk_state == 6 then 
		talk_state = 0 
		if getPlayerItemCount(cid,2181) >= 1 and getPlayerItemCount(cid,2182) >= 1 and getPlayerItemCount(cid,2183) >= 1 and getPlayerItemCount(cid,2185) >= 1 and getPlayerItemCount(cid,2186) >= 1 and getPlayerItemCount(cid,2187) >= 1 and getPlayerItemCount(cid,2188) >= 1 and getPlayerItemCount(cid,2189) >= 1 and getPlayerItemCount(cid,2190) >= 1 and getPlayerItemCount(cid,2191) >= 1 and getPlayerItemCount(cid,5904) >= 10 and getPlayerItemCount(cid,2193) >= 20 and getPlayerItemCount(cid,5809) >= 1 then 				
			if doPlayerTakeItem(cid,2181,1) == 0 and doPlayerTakeItem(cid,2182,1) == 0 and doPlayerTakeItem(cid,2183,1) == 0 and doPlayerTakeItem(cid,2185,1) == 0 and doPlayerTakeItem(cid,2186,1) == 0 and doPlayerTakeItem(cid,2187,1) == 0 and doPlayerTakeItem(cid,2188,1) == 0 and doPlayerTakeItem(cid,2189,1) == 0 and doPlayerTakeItem(cid,2190,1) == 0 and doPlayerTakeItem(cid,2191,1) == 0 and doPlayerTakeItem(cid,5904,10) == 0 and doPlayerTakeItem(cid,2193,20) == 0 and doPlayerTakeItem(cid,5809,1) == 0 then 
				selfSay('Here this you wand!') 
				doPlayerAddOutfit(cid, 141, 1)
				setPlayerStorageValue(cid,10009,1) 
			end 
		else 
			selfSay(addon_have_not_items) 
		end 	
	
	elseif msgcontains(msg, 'blessing') or msgcontains(msg, 'blessings') or msgcontains(msg, 'help') or msgcontains(msg, 'offer') then
		selfSay("I can provide you with third blessings... the 'first bless', 'second bless', 'third bless' or 'all bless'. They cost 50000 gold coins each or all by 150000 gold coins.")
		talkState = 0
	elseif msgcontains(msg, 'first bless') then
		selfSay("Do you want to buy the first blessing for 50000 gold?")
		talkState = 1
	elseif msgcontains(msg, 'second bless') then
		selfSay("Do you want to buy the second blessing for 50000 gold?")
		talkState = 2
	elseif msgcontains(msg, 'third bless') then
		selfSay("Do you want to buy the third blessing for 50000 gold?")
		talkState = 3
	elseif msgcontains(msg, 'all bless') then
		selfSay("Do you want to buy the all blessings for 150000 gold?")
		talkState = 4		
	elseif talkState > 0  and talkState < 4 then
		if msgcontains(msg, 'yes') then
			if getPlayerBlessing(cid, talkState) then
				selfSay("A god has already blessed you with this blessing.")
			else
				if isPremium(cid) == TRUE then
					if doPlayerRemoveMoney(cid, 50000) == TRUE then
						doPlayerAddBlessing(cid, talkState)
						selfSay("You have been blessed by one of the five gods!")
					else
						selfSay("You don't have enough money.")
					end
				else
					selfSay("You need a premium account to buy blessings.")
				end
			end
		elseif msgcontains(msg, 'no') then
			selfSay("Then not.")
		end
		talk_state = 0		
	elseif talkState == 4 then
		if msgcontains(msg, 'yes') then
			if getPlayerBlessing(cid, 1) or getPlayerBlessing(cid, 2) or getPlayerBlessing(cid, 3) then
				selfSay("A god has already blessed you with this one of blessings.")
			else
				if isPremium(cid) == TRUE then
					if doPlayerRemoveMoney(cid, 150000) == TRUE then
						doPlayerAddBlessing(cid, 1)
						doPlayerAddBlessing(cid, 2)
						doPlayerAddBlessing(cid, 3)
						selfSay("You have been blessed by all of the third gods!")
					else
						selfSay("You don't have enough money.")
					end
				else
					selfSay("You need a premium account to buy blessings.")
				end
			end
		elseif msgcontains(msg, 'no') then
			selfSay("Then not.")
		end
		talk_state = 0			
	end
	return TRUE
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())