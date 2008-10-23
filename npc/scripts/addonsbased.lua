--------------------------------------------------------------------------------------------
------------------------------------ Advanced Addon NPC ------------------------------------
-------------------------------- Script made by teh_pwnage ---------------------------------
--------------- Special thanks to: mokerhamer, Xidaozu and Jiddo, deaths'life --------------
------------------------------- Thanks also to everyone else -------------------------------
------------------------------ NPC based on TFS 0.2.4 ------------------------------
--------------------------------------------------------------------------------------------

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

		addon_need_premium = 'Sorry, you need a premium account to get addons.'
		addon_have_already = 'Sorry, you already have this addon.'
		addon_have_not_items = 'Sorry, you don\'t have these items.'
		addon_give = 'Here you are.'
		player_gold = getPlayerItemCount(cid,2148)
		player_plat = getPlayerItemCount(cid,2152)*100
		player_crys = getPlayerItemCount(cid,2160)*10000
		player_money = player_gold + player_plat + player_crys
		
		if msgcontains(msg, 'addons') then
			selfSay('I can give you Citizen, Hunter, Knight, Mage, Nobleman, Summoner, Warrior, Barbarian, Druid, Wizard, Oriental, Pirate, Assassin, Beggar, Shaman and Norseman, BrotherHood addons.')
		elseif msgcontains(msg, 'help') then
			selfSay('To buy the first addon say \'first NAME addon\', for the second addon say \'second NAME addon\'.')
------------------------------------------------ addon ------------------------------------------------
		elseif msgcontains(msg, 'first citizen addon') then
			if isPremium(cid) then
				if getPlayerItemCount(cid,5878) >= 100 then
					selfSay('Did you bring me 100 minotaur leathers?')
					talk_state = 1
				else
					selfSay('I need 100 minotaur leather, to give you the first citizen addon. Come back when you have them.')
					talk_state = 0
				end
			else
				selfSay(addon_need_premium)
				talk_state = 0
			end
------------------------------------------------ confirm yes ------------------------------------------------
		elseif msgcontains(msg, 'yes') and talk_state == 1 then
			talk_state = 0
			if getPlayerItemCount(cid,5878) >= 100 then
				addon = getPlayerStorageValue(cid,10001)
				if addon == -1 then
					if doPlayerTakeItem(cid,5878,100) == 0 then
						selfSay(addon_give)
						doPlayerAddOutfit(cid, 128, 1)
						doPlayerAddOutfit(cid, 136, 1)
						setPlayerStorageValue(cid,10001,1)
					end
				else
					selfSay(addon_have_already)
				end
			else
				selfSay(addon_have_not_items)
			end
------------------------------------------------ addon ------------------------------------------------
		elseif msgcontains(msg, 'second citizen addon') then
			if isPremium(cid) then
				if getPlayerItemCount(cid,5890) >= 100 and getPlayerItemCount(cid,5902) >= 50 and getPlayerItemCount(cid,2480) >= 1 then
					selfSay('Did you bring me 100 chicken feathers, 50 honeycombs and the legion helmet?')
					talk_state = 2
				else
					selfSay('I need 100 chicken feathers, 50 honeycombs and a legion helmet, to give you the second citizen addon. Come back when you have them.')
					talk_state = 0
				end
			else
				selfSay(addon_need_premium)
				talk_state = 0
			end
------------------------------------------------ confirm yes ------------------------------------------------
		elseif msgcontains(msg, 'yes') and talk_state == 2 then
			talk_state = 0
			if getPlayerItemCount(cid,5890) >= 100 and getPlayerItemCount(cid,5902) >= 50 and getPlayerItemCount(cid,2480) >= 1 then
				addon = getPlayerStorageValue(cid,10002)
				if addon == -1 then
					if doPlayerTakeItem(cid,5890,100) == 0 and doPlayerTakeItem(cid,5902,50) == 0 and doPlayerTakeItem(cid,2480,1) == 0 then
						selfSay(addon_give)
						doPlayerAddOutfit(cid, 128, 2)
						doPlayerAddOutfit(cid, 136, 2)
						setPlayerStorageValue(cid,10002,1)
					end
				else
					selfSay(addon_have_already)
				end
			else
				selfSay(addon_have_not_items)
			end
------------------------------------------------ addon ------------------------------------------------
		elseif msgcontains(msg, 'first hunter addon') then
			if isPremium(cid) then
				if getPlayerItemCount(cid,5947) >= 1 and getPlayerItemCount(cid,5876) >= 100 and getPlayerItemCount(cid,5948) >= 100 and getPlayerItemCount(cid,5891) >= 5 and getPlayerItemCount(cid,5887) >= 1 and getPlayerItemCount(cid,5888) >= 1 and getPlayerItemCount(cid,5889) >= 1 then
					selfSay('Did you bring me the engraved crossbow, 100 lizard leathers, 100 red dragon leather, 5 enchanted chicken wings, royal steel, hell steel and draconian steel?')
					talk_state = 3
				else
					selfSay('I need a engraved crossbow, 100 lizard leathers, 100 red dragon leather, 5 enchanted chicken wings, royal steel, hell steel and draconian steel, to give you the first hunter addon. Come back when you have them.')
					talk_state = 0
				end
			else
				selfSay(addon_need_premium)
				talk_state = 0
			end
------------------------------------------------ confirm yes ------------------------------------------------
		elseif msgcontains(msg, 'yes') and talk_state == 3 then
			talk_state = 0
			if getPlayerItemCount(cid,5947) >= 1 and getPlayerItemCount(cid,5876) >= 100 and getPlayerItemCount(cid,5948) >= 100 and getPlayerItemCount(cid,5891) >= 5 and getPlayerItemCount(cid,5887) >= 1 and getPlayerItemCount(cid,5888) >= 1 and getPlayerItemCount(cid,5889) >= 1 then
				addon = getPlayerStorageValue(cid,20002)
				if addon == -1 then
					if doPlayerTakeItem(cid,5947,1) == 0 and doPlayerTakeItem(cid,5876,100) == 0 and doPlayerTakeItem(cid,5948,100) == 0 and doPlayerTakeItem(cid,5891,5) == 0 and doPlayerTakeItem(cid,5887,1) == 0 and doPlayerTakeItem(cid,5888,1) == 0 and doPlayerTakeItem(cid,5889,1) == 0 then
						selfSay(addon_give)
						doPlayerAddOutfit(cid, 129, 1)
						doPlayerAddOutfit(cid, 137, 1)
						setPlayerStorageValue(cid,20002,1)
					end
				else
					selfSay(addon_have_already)
				end
			else
				selfSay(addon_have_not_items)
			end
------------------------------------------------ addon ------------------------------------------------
		elseif msgcontains(msg, 'second hunter addon') then
			if isPremium(cid) then
				if getPlayerItemCount(cid,5875) >= 1 then
					selfSay('Did you bring me the sniper gloves?')
					talk_state = 4
				else
					selfSay('I need sniper gloves, to give you the second hunter addon. Come back when you have them.')
					talk_state = 0
				end
			else
				selfSay(addon_need_premium)
				talk_state = 0
			end
------------------------------------------------ confirm yes ------------------------------------------------
		elseif msgcontains(msg, 'yes') and talk_state == 4 then
			talk_state = 0
			if getPlayerItemCount(cid,5875) >= 1 then
				addon = getPlayerStorageValue(cid,23351)
				if addon == -1 then
					if doPlayerTakeItem(cid,5875,1) == 0 then
						selfSay(addon_give)
						doPlayerAddOutfit(cid, 129, 2)
						doPlayerAddOutfit(cid, 137, 2)
						setPlayerStorageValue(cid,23351,1)
					end
				else
					selfSay(addon_have_already)
				end
			else
				selfSay(addon_have_not_items)
			end
------------------------------------------------ addon ------------------------------------------------
		elseif msgcontains(msg, 'first knight addon') then
			if isPremium(cid) then
				if getPlayerItemCount(cid,5892) >= 1 and getPlayerItemCount(cid,5880) >= 100 then
					selfSay('Did you bring me the chunk of crude iron and 100 iron ores?')
					talk_state = 5
				else
					selfSay('I need a chunk of crude iron and 100 iron ores, to give you the first knight addon. Come back when you have them.')
					talk_state = 0
				end
			else
				selfSay(addon_need_premium)
				talk_state = 0
			end
------------------------------------------------ confirm yes ------------------------------------------------
		elseif msgcontains(msg, 'yes') and talk_state == 5 then
			talk_state = 0
			if getPlayerItemCount(cid,5892) >= 1 and getPlayerItemCount(cid,5880) >= 100 then
				addon = getPlayerStorageValue(cid,300001)
				if addon == -1 then
					if doPlayerTakeItem(cid,5892,1) == 0 and doPlayerTakeItem(cid,5880,100) == 0 then
						selfSay(addon_give)
						doPlayerAddOutfit(cid, 131, 1)
						doPlayerAddOutfit(cid, 139, 1)
						setPlayerStorageValue(cid,300001,1)
					end
				else
					selfSay(addon_have_already)
				end
			else
				selfSay(addon_have_not_items)
			end
------------------------------------------------ addon ------------------------------------------------
		elseif msgcontains(msg, 'second knight addon') then
			if isPremium(cid) then
				if getPlayerItemCount(cid,5893) >= 100 and getPlayerItemCount(cid,5924) >= 1 and getPlayerItemCount(cid,5885) >= 1 and getPlayerItemCount(cid,5887) >= 1 then
					selfSay('Did you bring me 100 behemoth fangs, the damaged steel helmet, warrior\'s sweat, and royal steel?')
					talk_state = 6
				else
					selfSay('I need 100 behemoth fangs, a damaged steel helmet, warrior\'s sweat and royal steel, to give you the second knight addon. Come back when you have them.')
					talk_state = 0
				end
			else
				selfSay(addon_need_premium)
				talk_state = 0
			end
------------------------------------------------ confirm yes ------------------------------------------------
		elseif msgcontains(msg, 'yes') and talk_state == 6 then
			talk_state = 0
			if getPlayerItemCount(cid,5893) >= 100 and getPlayerItemCount(cid,5924) >= 1 and getPlayerItemCount(cid,5885) >= 1 and getPlayerItemCount(cid,5887) >= 1 then
				addon = getPlayerStorageValue(cid,30002)
				if addon == -1 then
					if doPlayerTakeItem(cid,5893,100) == 0 and doPlayerTakeItem(cid,5924,1) == 0 and doPlayerTakeItem(cid,5885,1) == 0 and doPlayerTakeItem(cid,5887,1) == 0 then
						selfSay(addon_give)
						doPlayerAddOutfit(cid, 131, 2)
						doPlayerAddOutfit(cid, 139, 2)
						setPlayerStorageValue(cid,30002,1)
					end
				else
					selfSay(addon_have_already)
				end
			else
				selfSay(addon_have_not_items)
			end
------------------------------------------------ addon ------------------------------------------------
		elseif msgcontains(msg, 'first mage addon') then
			if isPremium(cid) then
				if getPlayerSex(cid) == 0 then
					if getPlayerItemCount(cid,5958) >= 1 then
						selfSay('Did you bring me a winning lotery ticket?')
						talk_state = 7
					else
						selfSay('I need a winning lotery ticket, to give you the first mage addon. Come back when you have it.')
						talk_state = 0
					end
				elseif getPlayerSex(cid) == 1 then
					if getPlayerItemCount(cid,2181) >= 1 and getPlayerItemCount(cid,2182) >= 1 and getPlayerItemCount(cid,2183) >= 1 and getPlayerItemCount(cid,2185) >= 1 and getPlayerItemCount(cid,2186) >= 1 and getPlayerItemCount(cid,2187) >= 1 and getPlayerItemCount(cid,2188) >= 1 and getPlayerItemCount(cid,2189) >= 1 and getPlayerItemCount(cid,2190) >= 1 and getPlayerItemCount(cid,2191) >= 1 and getPlayerItemCount(cid,5904) >= 10 and getPlayerItemCount(cid,2193) >= 20 and getPlayerItemCount(cid,5809) >= 1 then
						selfSay('Did you bring me all the wands and rods, 10 magic sulphors, 20 ankhs and a soul stone?')
						talk_state = 7
					else
						selfSay('I need all kind of wands and rods, 10 magic sulphurs, 20 ankhs and a soul stone, to give you the first mage addon. Come back when you have it.')
						talk_state = 0
					end
				end
			else
				selfSay(addon_need_premium)
				talk_state = 0
			end
------------------------------------------------ confirm yes ------------------------------------------------
		elseif msgcontains(msg, 'yes') and talk_state == 7 then
			talk_state = 0
			if getPlayerSex(cid) == 0 then
				if getPlayerItemCount(cid,5958) >= 1 then
					addon = getPlayerStorageValue(cid,40001)
					if addon == -1 then
						if doPlayerTakeItem(cid,5958,1) == 0 then
							selfSay(addon_give)
							doPlayerAddOutfit(cid, 141, 1)
							setPlayerStorageValue(cid,40001,1)
						end
					else
						selfSay(addon_have_already)
					end
				else
					selfSay(addon_have_not_items)
				end
			elseif getPlayerSex(cid) == 1 then
				if getPlayerItemCount(cid,2181) >= 1 and getPlayerItemCount(cid,2182) >= 1 and getPlayerItemCount(cid,2183) >= 1 and getPlayerItemCount(cid,2185) >= 1 and getPlayerItemCount(cid,2186) >= 1 and getPlayerItemCount(cid,2187) >= 1 and getPlayerItemCount(cid,2188) >= 1 and getPlayerItemCount(cid,2189) >= 1 and getPlayerItemCount(cid,2190) >= 1 and getPlayerItemCount(cid,2191) >= 1 and getPlayerItemCount(cid,5904) >= 10 and getPlayerItemCount(cid,2193) >= 20 and getPlayerItemCount(cid,5809) >= 1 then
					addon = getPlayerStorageValue(cid,40001)
					if addon == -1 then
						if doPlayerTakeItem(cid,2181,1) == 0 and doPlayerTakeItem(cid,2182,1) == 0 and doPlayerTakeItem(cid,2183,1) == 0 and doPlayerTakeItem(cid,2185,1) == 0 and doPlayerTakeItem(cid,2186,1) == 0 and doPlayerTakeItem(cid,2187,1) == 0 and doPlayerTakeItem(cid,2188,1) == 0 and doPlayerTakeItem(cid,2189,1) == 0 and doPlayerTakeItem(cid,2190,1) == 0 and doPlayerTakeItem(cid,2191,1) == 0 and doPlayerTakeItem(cid,5904,10) == 0 and doPlayerTakeItem(cid,2193,20) == 0 and doPlayerTakeItem(cid,5809,1) == 0 then
							selfSay(addon_give)
							doPlayerAddOutfit(cid, 130, 1)
							setPlayerStorageValue(cid,40001,1)
						end
					else
						selfSay(addon_have_already)
					end
				else
					selfSay(addon_have_not_items)
				end
			end
------------------------------------------------ addon ------------------------------------------------
		elseif msgcontains(msg, 'second mage addon') then
			if isPremium(cid) then
				if getPlayerSex(cid) == 0 then
					if getPlayerItemCount(cid,5894) >= 70 and getPlayerItemCount(cid,5911) >= 20 and getPlayerItemCount(cid,5883) >= 40 and getPlayerItemCount(cid,5922) >= 35 and getPlayerItemCount(cid,5886) >= 10 and getPlayerItemCount(cid,5881) >= 60 and getPlayerItemCount(cid,5882) >= 40 and getPlayerItemCount(cid,5904) >= 15 and getPlayerItemCount(cid,5905) >= 30 then
						selfSay('Did you bring me 70 bat wings, 20 red pieces of cloth, 40 ape fur, 35 holy orchid, 10 spools of spider silk yarn, 60 lizard scales, 40 red dragon scales, 15 magic sulphurs and 30 vampire dusts?')
						talk_state = 8
					else
						selfSay('I need 70 bat wings, 20 red pieces of cloth, 40 ape fur, 35 holy orchid, 10 spools of spider silk yarn, 60 lizard scales, 40 red dragon scales, 15 magic sulphurs and 30 vampire dusts, to give you the second mage addon. Come back when you have it.')
						talk_state = 0
					end
				elseif getPlayerSex(cid) == 1 then
					if getPlayerItemCount(cid,5903) >= 1 then
						selfSay('Did you bring me the magician hat?')
						talk_state = 8
					else
						selfSay('I need a magician hat to give you the second mage addon. Come back when you have it.')
						talk_state = 0
					end
				end
			else
				selfSay(addon_need_premium)
				talk_state = 0
			end
------------------------------------------------ confirm yes ------------------------------------------------
		elseif msgcontains(msg, 'yes') and talk_state == 8 then
			talk_state = 0
			if getPlayerSex(cid) == 0 then
				if getPlayerItemCount(cid,5894) >= 70 and getPlayerItemCount(cid,5911) >= 20 and getPlayerItemCount(cid,5883) >= 40 and getPlayerItemCount(cid,5922) >= 35 and getPlayerItemCount(cid,5886) >= 10 and getPlayerItemCount(cid,5881) >= 60 and getPlayerItemCount(cid,5882) >= 40 and getPlayerItemCount(cid,5904) >= 15 and getPlayerItemCount(cid,5905) >= 30 then
					addon = getPlayerStorageValue(cid,40002)
					if addon == -1 then
						if doPlayerTakeItem(cid,5894,70) and doPlayerTakeItem(cid,5911,20) and doPlayerTakeItem(cid,5883,40) and doPlayerTakeItem(cid,5922,35) and doPlayerTakeItem(cid,5886,10) and doPlayerTakeItem(cid,5881,60) and doPlayerTakeItem(cid,5882,40) and doPlayerTakeItem(cid,5904,15) and doPlayerTakeItem(cid,5905,30) then
							selfSay(addon_give)
							doPlayerAddOutfit(cid, 141, 2)
							setPlayerStorageValue(cid,40002,1)
						end
					else
						selfSay(addon_have_already)
					end
				else
					selfSay(addon_have_not_items)
				end
			elseif getPlayerSex(cid) == 1 then
				if getPlayerItemCount(cid,5903) >= 1 then
					addon = getPlayerStorageValue(cid,40002)
					if addon == -1 then
						if doPlayerTakeItem(cid,5903,1) == 0 then
							selfSay(addon_give)
							doPlayerAddOutfit(cid, 130, 2)
							setPlayerStorageValue(cid,40002,1)
						end
					else
						selfSay(addon_have_already)
					end
				else
					selfSay(addon_have_not_items)
				end
			end
------------------------------------------------ addon ------------------------------------------------
		elseif msgcontains(msg, 'first summoner addon') then
			if isPremium(cid) then
				if getPlayerSex(cid) == 1 then
					if getPlayerItemCount(cid,5958) >= 1 then
						selfSay('Did you bring me a winning lotery ticket?')
						talk_state = 9
					else
						selfSay('I need a winning lotery ticket, to give you the first summoner addon. Come back when you have it.')
						talk_state = 0
					end
				elseif getPlayerSex(cid) == 0 then
					if getPlayerItemCount(cid,2181) >= 1 and getPlayerItemCount(cid,2182) >= 1 and getPlayerItemCount(cid,2183) >= 1 and getPlayerItemCount(cid,2185) >= 1 and getPlayerItemCount(cid,2186) >= 1 and getPlayerItemCount(cid,2187) >= 1 and getPlayerItemCount(cid,2188) >= 1 and getPlayerItemCount(cid,2189) >= 1 and getPlayerItemCount(cid,2190) >= 1 and getPlayerItemCount(cid,2191) >= 1 and getPlayerItemCount(cid,5904) >= 10 and getPlayerItemCount(cid,2193) >= 20 and getPlayerItemCount(cid,5809) >= 1 then
						selfSay('Did you bring me all the wands and rods, 10 magic sulphors, 20 ankhs and a soul stone?')
						talk_state = 9
					else
						selfSay('I need all kind of wands and rods, 10 magic sulphurs, 20 ankhs and a soul stone, to give you the first summoner addon. Come back when you have it.')
						talk_state = 0
					end
				end
			else
				selfSay(addon_need_premium)
				talk_state = 0
			end
------------------------------------------------ confirm yes ------------------------------------------------
		elseif msgcontains(msg, 'yes') and talk_state == 9 then
			talk_state = 0
			if getPlayerSex(cid) == 1 then
				if getPlayerItemCount(cid,5958) >= 1 then
					addon = getPlayerStorageValue(cid,50001)
					if addon == -1 then
						if doPlayerTakeItem(cid,5958,1) == 0 then
							selfSay(addon_give)
							doPlayerAddOutfit(cid, 133, 1)
							setPlayerStorageValue(cid,50001,1)
						end
					else
						selfSay(addon_have_already)
					end
				else
					selfSay(addon_have_not_items)
				end
			elseif getPlayerSex(cid) == 0 then
				if getPlayerItemCount(cid,2181) >= 1 and getPlayerItemCount(cid,2182) >= 1 and getPlayerItemCount(cid,2183) >= 1 and getPlayerItemCount(cid,2185) >= 1 and getPlayerItemCount(cid,2186) >= 1 and getPlayerItemCount(cid,2187) >= 1 and getPlayerItemCount(cid,2188) >= 1 and getPlayerItemCount(cid,2189) >= 1 and getPlayerItemCount(cid,2190) >= 1 and getPlayerItemCount(cid,2191) >= 1 and getPlayerItemCount(cid,5904) >= 10 and getPlayerItemCount(cid,2193) >= 20 and getPlayerItemCount(cid,5809) >= 1 then
					addon = getPlayerStorageValue(cid,50001)
					if addon == -1 then
						if doPlayerTakeItem(cid,2181,1) == 0 and doPlayerTakeItem(cid,2182,1) == 0 and doPlayerTakeItem(cid,2183,1) == 0 and doPlayerTakeItem(cid,2185,1) == 0 and doPlayerTakeItem(cid,2186,1) == 0 and doPlayerTakeItem(cid,2187,1) == 0 and doPlayerTakeItem(cid,2188,1) == 0 and doPlayerTakeItem(cid,2189,1) == 0 and doPlayerTakeItem(cid,2190,1) == 0 and doPlayerTakeItem(cid,2191,1) == 0 and doPlayerTakeItem(cid,5904,10) == 0 and doPlayerTakeItem(cid,2193,20) == 0 and doPlayerTakeItem(cid,5809,1) == 0 then
							selfSay(addon_give)
							doPlayerAddOutfit(cid, 133, 1)
							setPlayerStorageValue(cid,50001,1)
						end
					else
						selfSay(addon_have_already)
					end
				else
					selfSay(addon_have_not_items)
				end
			end
------------------------------------------------ addon ------------------------------------------------
		elseif msgcontains(msg, 'second summoner addon') then
			if isPremium(cid) then
				if getPlayerSex(cid) == 1 then
					if getPlayerItemCount(cid,5894) >= 70 and getPlayerItemCount(cid,5911) >= 20 and getPlayerItemCount(cid,5883) >= 40 and getPlayerItemCount(cid,5922) >= 35 and getPlayerItemCount(cid,5886) >= 10 and getPlayerItemCount(cid,5881) >= 60 and getPlayerItemCount(cid,5882) >= 40 and getPlayerItemCount(cid,5904) >= 15 and getPlayerItemCount(cid,5905) >= 30 then
						selfSay('Did you bring me 70 bat wings, 20 red pieces of cloth, 40 ape fur, 35 holy orchid, 10 spools of spider silk yarn, 60 lizard scales, 40 red dragon scales, 15 magic sulphurs and 30 vampire dusts?')
						talk_state = 10
					else
						selfSay('I need 70 bat wings, 20 red pieces of cloth, 40 ape fur, 35 holy orchid, 10 spools of spider silk yarn, 60 lizard scales, 40 red dragon scales, 15 magic sulphurs and 30 vampire dusts, to give you the second summoner addon. Come back when you have it.')
						talk_state = 0
					end
				elseif getPlayerSex(cid) == 0 then
					if getPlayerItemCount(cid,5903) >= 1 then
						selfSay('Did you bring me the Ferumbrass\' hat?')
						talk_state = 10
					else
						selfSay('I need the famous Ferumbrass\' hat, to give you the second summoner addon. Come back when you have it.')
						talk_state = 0
					end
				end
			else
				selfSay(addon_need_premium)
				talk_state = 0
			end
------------------------------------------------ confirm yes ------------------------------------------------
		elseif msgcontains(msg, 'yes') and talk_state == 10 then
			talk_state = 0
			if getPlayerSex(cid) == 1 then
				if getPlayerItemCount(cid,5894) >= 70 and getPlayerItemCount(cid,5911) >= 20 and getPlayerItemCount(cid,5883) >= 40 and getPlayerItemCount(cid,5922) >= 35 and getPlayerItemCount(cid,5886) >= 10 and getPlayerItemCount(cid,5881) >= 60 and getPlayerItemCount(cid,5882) >= 40 and getPlayerItemCount(cid,5904) >= 15 and getPlayerItemCount(cid,5905) >= 30 then
					addon = getPlayerStorageValue(cid,50002)
					if addon == -1 then
						if doPlayerTakeItem(cid,5894,70) and doPlayerTakeItem(cid,5911,20) and doPlayerTakeItem(cid,5883,40) and doPlayerTakeItem(cid,5922,35) and doPlayerTakeItem(cid,5886,10) and doPlayerTakeItem(cid,5881,60) and doPlayerTakeItem(cid,5882,40) and doPlayerTakeItem(cid,5904,15) and doPlayerTakeItem(cid,5905,30) then
							selfSay(addon_give)
							doPlayerAddOutfit(cid, 133, 2)
							setPlayerStorageValue(cid,50002,1)
						end
					else
						selfSay(addon_have_already)
					end
				else
					selfSay(addon_have_not_items)
				end
			elseif getPlayerSex(cid) == 0 then
				if getPlayerItemCount(cid,5903) >= 1 then
					addon = getPlayerStorageValue(cid,50002)
					if addon == -1 then
						if doPlayerTakeItem(cid,5903,1) == 0 then
							selfSay(addon_give)
							doPlayerAddOutfit(cid, 138, 2)
							setPlayerStorageValue(cid,50002,1)
						end
					else
						selfSay(addon_have_already)
					end
				else
					selfSay(addon_have_not_items)
				end
			end
------------------------------------------------ addon ------------------------------------------------
		elseif msgcontains(msg, 'first barbarian addon') then
			if isPremium(cid) then
				if getPlayerItemCount(cid,5884) >= 1 and getPlayerItemCount(cid,5885) >= 1 and getPlayerItemCount(cid,5911) >= 50 and getPlayerItemCount(cid,5910) >= 50 and getPlayerItemCount(cid,5886) >= 10 then
					selfSay('Did you bring me the fighting spirit, the warrior\'s sweat, 50 red pieces of cloth, 50 green pieces of cloth and 10 spider silk yarns?')
					talk_state = 11
				else
					selfSay('I need fighting spirit, warrior\'s sweat, 50 red pieces of cloth, 50 green pieces of cloth and 10 spider silk yarns, to give you the first barbarian addon. Come back when you have them.')
					talk_state = 0
				end
			else
				selfSay(addon_need_premium)
				talk_state = 0
			end
------------------------------------------------ confirm yes ------------------------------------------------
		elseif msgcontains(msg, 'yes') and talk_state == 11 then
			talk_state = 0
			if getPlayerItemCount(cid,5884) >= 1 and getPlayerItemCount(cid,5885) >= 1 and getPlayerItemCount(cid,5911) >= 50 and getPlayerItemCount(cid,5910) >= 50 and getPlayerItemCount(cid,5886) >= 10 then
				addon = getPlayerStorageValue(cid,60003)
				if addon == -1 then
					if doPlayerTakeItem(cid,5884,1) == 0 and doPlayerTakeItem(cid,5885,1) == 0 and doPlayerTakeItem(cid,5911,50) == 0 and doPlayerTakeItem(cid,5910,50) == 0 and doPlayerTakeItem(cid,5886,10) == 0 then
						selfSay(addon_give)
						doPlayerAddOutfit(cid, 143, 2)
						doPlayerAddOutfit(cid, 147, 2)
						setPlayerStorageValue(cid,60003,1)
					end
				else
					selfSay(addon_have_already)
				end
			else
				selfSay(addon_have_not_items)
			end
------------------------------------------------ addon ------------------------------------------------
		elseif msgcontains(msg, 'second barbarian addon') then
			if isPremium(cid) then
				if getPlayerItemCount(cid,5880) >= 100 and getPlayerItemCount(cid,5892) >= 1 and getPlayerItemCount(cid,5893) >= 50 and getPlayerItemCount(cid,5876) >= 50 then
					selfSay('Did you bring me 100 iron ore, 1 chunk of crude iron, 50 behemoth fangs and 50 lizard leathers?')
					talk_state = 12
				else
					selfSay('I need 100 iron ore, 1 chunk of crude iron, 50 behemoth fangs and 50 lizard leathers, to give you the second barbarian addon. Come back when you have them.')
					talk_state = 0
				end
			else
				selfSay(addon_need_premium)
				talk_state = 0
			end
------------------------------------------------ confirm yes ------------------------------------------------
		elseif msgcontains(msg, 'yes') and talk_state == 12 then
			talk_state = 0
			if getPlayerItemCount(cid,5880) >= 100 and getPlayerItemCount(cid,5892) >= 1 and getPlayerItemCount(cid,5893) >= 50 and getPlayerItemCount(cid,5876) >= 50 then
				addon = getPlayerStorageValue(cid,60004)
				if addon == -1 then
					if doPlayerTakeItem(cid,5880,100) == 0 and doPlayerTakeItem(cid,5892,1) == 0 and doPlayerTakeItem(cid,5893,50) == 0 and doPlayerTakeItem(cid,5876,50) == 0 then
						selfSay(addon_give)
						doPlayerAddOutfit(cid, 143, 1)
						doPlayerAddOutfit(cid, 147, 1)
						setPlayerStorageValue(cid,60004,1)
					end
				else
					selfSay(addon_have_already)
				end
			else
				selfSay(addon_have_not_items)
			end
------------------------------------------------ addon ------------------------------------------------
		elseif msgcontains(msg, 'first druid addon') then
			if isPremium(cid) then
				if getPlayerItemCount(cid,5897) >= 50 and getPlayerItemCount(cid,5896) >= 50 then
					selfSay('Did you bring me 50 wolf paws and 50 bear paws?')
					talk_state = 13
				else
					selfSay('I need 50 wolf paws and 50 bear paws, to give you the first druid addon. Come back when you have them.')
					talk_state = 0
				end
			else
				selfSay(addon_need_premium)
				talk_state = 0
			end
------------------------------------------------ confirm yes ------------------------------------------------
		elseif msgcontains(msg, 'yes') and talk_state == 13 then
			talk_state = 0
			if getPlayerItemCount(cid,5897) >= 50 and getPlayerItemCount(cid,5896) >= 50 then
				addon = getPlayerStorageValue(cid,70001)
				if addon == -1 then
					if doPlayerTakeItem(cid,5897,50) == 0 and doPlayerTakeItem(cid,5896,50) == 0 then
						selfSay(addon_give)
						doPlayerAddOutfit(cid, 144, 1)
						doPlayerAddOutfit(cid, 148, 1)
						setPlayerStorageValue(cid,70001,1)
					end
				else
					selfSay(addon_have_already)
				end
			else
				selfSay(addon_have_not_items)
			end
------------------------------------------------ addon ------------------------------------------------
		elseif msgcontains(msg, 'second druid addon') then
			if isPremium(cid) then
				if getPlayerItemCount(cid,5906) >= 100 then
					selfSay('Did you bring me 100 demon dusts?')
					talk_state = 14
				else
					selfSay('I need 100 demon dusts to give you the second druid addon. Come back when you have them.')
					talk_state = 0
				end
			else
				selfSay(addon_need_premium)
				talk_state = 0
			end
------------------------------------------------ confirm yes ------------------------------------------------
		elseif msgcontains(msg, 'yes') and talk_state == 14 then
			talk_state = 0
			if getPlayerItemCount(cid,5906) >= 100 then
				addon = getPlayerStorageValue(cid,70002)
				if addon == -1 then
					if doPlayerTakeItem(cid,5906,100) == 0 then
						selfSay(addon_give)
						doPlayerAddOutfit(cid, 144, 2)
						doPlayerAddOutfit(cid, 148, 2)
						setPlayerStorageValue(cid,70002,1)
					end
				else
					selfSay(addon_have_already)
				end
			else
				selfSay(addon_have_not_items)
			end
------------------------------------------------ addon ------------------------------------------------
		elseif msgcontains(msg, 'first nobleman addon') then
			if isPremium(cid) then
				if player_money >= 150000 then
					selfSay('Did you bring me 150000 gold coins?')
					talk_state = 15
				else
					selfSay('I need 150000 gold coins, to give you the first nobleman addon. Come back when you have them.')
					talk_state = 0
				end
			else
				selfSay(addon_need_premium)
				talk_state = 0
			end
------------------------------------------------ confirm yes ------------------------------------------------
		elseif msgcontains(msg, 'yes') and talk_state == 15 then
			talk_state = 0
			if player_money >= 150000 then
				addon = getPlayerStorageValue(cid,80001)
				if addon == -1 then
					if pay(cid,150000) then
						selfSay(addon_give)
						doPlayerAddOutfit(cid, 132, 1)
						doPlayerAddOutfit(cid, 140, 1)
						setPlayerStorageValue(cid,80001,1)
					end
				else
					selfSay(addon_have_already)
				end
			else
				selfSay(addon_have_not_items)
			end
------------------------------------------------ addon ------------------------------------------------
		elseif msgcontains(msg, 'second nobleman addon') then
			if isPremium(cid) then
				if player_money >= 150000 then
					selfSay('Did you bring me 150000 gold coins?')
					talk_state = 16
				else
					selfSay('I need 150000 gold coins, to give you the second nobleman addon. Come back when you have them.')
					talk_state = 0
				end
			else
				selfSay(addon_need_premium)
				talk_state = 0
			end
------------------------------------------------ confirm yes ------------------------------------------------
		elseif msgcontains(msg, 'yes') and talk_state == 16 then
			talk_state = 0
			if player_money >= 150000 then
				addon = getPlayerStorageValue(cid,80002)
				if addon == -1 then
					if pay(cid,150000) then
						selfSay(addon_give)
						doPlayerAddOutfit(cid, 132, 2)
						doPlayerAddOutfit(cid, 140, 2)
						setPlayerStorageValue(cid,80002,1)
					end
				else
					selfSay(addon_have_already)
				end
			else
				selfSay(addon_have_not_items)
			end
------------------------------------------------ addon ------------------------------------------------
		elseif msgcontains(msg, 'first oriental addon') then
			if isPremium(cid) then
				if getPlayerItemCount(cid,5945) >= 1 then
					selfSay('Did you bring me the mermaid comb?')
					talk_state = 17
				else
					selfSay('I need a mermaid comb, to give you the first oriental addon. Come back when you have it.')
					talk_state = 0
				end
			else
				selfSay(addon_need_premium)
				talk_state = 0
			end
------------------------------------------------ confirm yes ------------------------------------------------
		elseif msgcontains(msg, 'yes') and talk_state == 17 then
			talk_state = 0
			if getPlayerItemCount(cid,5945) >= 1 then
				addon = getPlayerStorageValue(cid,90001)
				if addon == -1 then
					if doPlayerTakeItem(cid,5945,1) == 0 then
						selfSay(addon_give)
						doPlayerAddOutfit(cid, 146, 1)
						doPlayerAddOutfit(cid, 150, 1)
						setPlayerStorageValue(cid,90001,1)
					end
				else
					selfSay(addon_have_already)
				end
			else
				selfSay(addon_have_not_items)
			end
------------------------------------------------ addon ------------------------------------------------
		elseif msgcontains(msg, 'second oriental addon') then
			if isPremium(cid) then
				if getPlayerItemCount(cid,5883) >= 100 and getPlayerItemCount(cid,5895) >= 100 and getPlayerItemCount(cid,5891) >= 2 and getPlayerItemCount(cid,5912) >= 100 then
					selfSay('Did you bring me 100 ape furs, 100 fish fins, 2 enchanted chicken wings and 100 blue pieces of cloth?')
					talk_state = 18
				else
					selfSay('I need 100 ape furs, 100 fish fins, 2 enchanted chicken wings and 100 blue pieces of cloth, to give you the second oriental addon. Come back when you have them.')
					talk_state = 0
				end
			else
				selfSay(addon_need_premium)
				talk_state = 0
			end
------------------------------------------------ confirm yes ------------------------------------------------
		elseif msgcontains(msg, 'yes') and talk_state == 18 then
			talk_state = 0
			if getPlayerItemCount(cid,5883) >= 100 and getPlayerItemCount(cid,5895) >= 100 and getPlayerItemCount(cid,5891) >= 2 and getPlayerItemCount(cid,5912) >= 100 then
				addon = getPlayerStorageValue(cid,90002)
				if addon == -1 then
					if doPlayerTakeItem(cid,5883,100) == 0 and doPlayerTakeItem(cid,5895,100) == 0 and doPlayerTakeItem(cid,5891,2) == 0 and doPlayerTakeItem(cid,5912,100) == 0 then
						selfSay(addon_give)
						doPlayerAddOutfit(cid, 146, 2)
						doPlayerAddOutfit(cid, 150, 2)
						setPlayerStorageValue(cid,90002,1)
					end
				else
					selfSay(addon_have_already)
				end
			else
				selfSay(addon_have_not_items)
			end
------------------------------------------------ addon ------------------------------------------------
		elseif msgcontains(msg, 'first warrior addon') then
			if isPremium(cid) then
				if getPlayerItemCount(cid,5925) >= 100 and getPlayerItemCount(cid,5899) >= 100 and getPlayerItemCount(cid,5884) >= 1 and getPlayerItemCount(cid,5919) >= 1 then
					selfSay('Did you bring me 100 hardened bones, 100 turtle shells, fighting spirit and a dragon claw?')
					talk_state = 19
				else
					selfSay('I need 100 hardened bones, 100 turtle shells, fighting spirit and a dragon claw, to give you the first warrior addon. Come back when you have it.')
					talk_state = 0
				end
			else
				selfSay(addon_need_premium)
				talk_state = 0
			end
------------------------------------------------ confirm yes ------------------------------------------------
		elseif msgcontains(msg, 'yes') and talk_state == 19 then
			talk_state = 0
			if getPlayerItemCount(cid,5925) >= 100 and getPlayerItemCount(cid,5899) >= 100 and getPlayerItemCount(cid,5884) >= 1 and getPlayerItemCount(cid,5919) >= 1 then
				addon = getPlayerStorageValue(cid,100001)
				if addon == -1 then
					if doPlayerTakeItem(cid,5925,100) == 0 and doPlayerTakeItem(cid,5899,100) == 0 and doPlayerTakeItem(cid,5884,1) == 0 and doPlayerTakeItem(cid,5919,1) == 0 then
						selfSay(addon_give)
						doPlayerAddOutfit(cid, 134, 1)
						doPlayerAddOutfit(cid, 142, 1)
						setPlayerStorageValue(cid,100001,1)
					end
				else
					selfSay(addon_have_already)
				end
			else
				selfSay(addon_have_not_items)
			end
------------------------------------------------ addon ------------------------------------------------
		elseif msgcontains(msg, 'second warrior addon') then
			if isPremium(cid) then
				if getPlayerItemCount(cid,5887) >= 1 and getPlayerItemCount(cid,5880) >= 100 then
					selfSay('Did you bring me 100 iron ores and royal steel?')
					talk_state = 20
				else
					selfSay('I need 100 iron ores and royal steel, to give you the second warrior addon. Come back when you have them.')
					talk_state = 0
				end
			else
				selfSay(addon_need_premium)
				talk_state = 0
			end
------------------------------------------------ confirm yes ------------------------------------------------
		elseif msgcontains(msg, 'yes') and talk_state == 20 then
			talk_state = 0
			if getPlayerItemCount(cid,5887) >= 1 and getPlayerItemCount(cid,5880) >= 100 then
				addon = getPlayerStorageValue(cid,100002)
				if addon == -1 then
					if doPlayerTakeItem(cid,5887,1) == 0 and doPlayerTakeItem(cid,5880,100) == 0 then
						selfSay(addon_give)
						doPlayerAddOutfit(cid, 134, 2)
						doPlayerAddOutfit(cid, 142, 2)
						setPlayerStorageValue(cid,100002,1)
					end
				else
					selfSay(addon_have_already)
				end
			else
				selfSay(addon_have_not_items)
			end
------------------------------------------------ addon ------------------------------------------------
		elseif msgcontains(msg, 'first wizard addon') then
			if isPremium(cid) then
				if getPlayerItemCount(cid,2488) >= 1 and getPlayerItemCount(cid,2123) >= 1 and getPlayerItemCount(cid,2492) >= 1 and getPlayerItemCount(cid,2536) >= 1 then
					selfSay('Did you bring me a medusa shield, a dragon scale mail, a ring of the sky and crown legs?')
					talk_state = 21
				else
					selfSay('I need a medusa shield, a dragon scale mail, a ring od the sky and crown legs, to give you the first wizard addon. Come back when you have it.')
					talk_state = 0
				end
			else
				selfSay(addon_need_premium)
				talk_state = 0
			end
------------------------------------------------ confirm yes ------------------------------------------------
		elseif msgcontains(msg, 'yes') and talk_state == 21 then
			talk_state = 0
			if getPlayerItemCount(cid,2488) >= 1 and getPlayerItemCount(cid,2123) >= 1 and getPlayerItemCount(cid,2492) >= 1 and getPlayerItemCount(cid,2536) >= 1 then
				addon = getPlayerStorageValue(cid,110001)
				if addon == -1 then
					if doPlayerTakeItem(cid,2488,1) == 0 and doPlayerTakeItem(cid,2123,1) == 0 and doPlayerTakeItem(cid,2492,1) == 0 and doPlayerTakeItem(cid,2536,1) == 0 then
						selfSay(addon_give)
						doPlayerAddOutfit(cid, 145, 2)
						doPlayerAddOutfit(cid, 149, 2)
						setPlayerStorageValue(cid,110001,1)
					end
				else
					selfSay(addon_have_already)
				end
			else
				selfSay(addon_have_not_items)
			end
------------------------------------------------ addon ------------------------------------------------
		elseif msgcontains(msg, 'second wizard addon') then
			if isPremium(cid) then
				if getPlayerItemCount(cid,5922) >= 50 and getPlayerStorageValue(cid,110001) then
					selfSay('Did you bring me 50 holy orchids?')
					talk_state = 22
				else
					selfSay('I need 50 holy orchids and you must have a skull mask or a snake tiara, to give you the second wizard addon. Come back when you have them.')
					talk_state = 0
				end
			else
				selfSay(addon_need_premium)
				talk_state = 0
			end
------------------------------------------------ confirm yes ------------------------------------------------
		elseif msgcontains(msg, 'yes') and talk_state == 22 then
			talk_state = 0
			if getPlayerItemCount(cid,5922) >= 50 then
				addon = getPlayerStorageValue(cid,110002)
				if addon == -1 then
					if doPlayerTakeItem(cid,5922,50) == 0 then
						selfSay(addon_give)
						doPlayerAddOutfit(cid, 145, 1)
						doPlayerAddOutfit(cid, 149, 1)
						setPlayerStorageValue(cid,110002,1)
					end
				else
					selfSay(addon_have_already)
				end
			else
				selfSay(addon_have_not_items)
			end
------------------------------------------------ addon ------------------------------------------------
		elseif msgcontains(msg, 'first assassin addon') then
			if isPremium(cid) then
				if getPlayerItemCount(cid,5898) >= 30 and getPlayerItemCount(cid,5882) >= 10 and getPlayerItemCount(cid,5881) >= 30 and getPlayerItemCount(cid,5895) >= 20 and getPlayerItemCount(cid,5905) >= 20 and getPlayerItemCount(cid,5906) >= 10 and getPlayerItemCount(cid,5885) >= 1 then
					selfSay('Did you bring me 30 beholder eyes, 10 red dragon scales, 30 lizard scales, 20 fish fins, 20 vampire dusts, 10 demon dusts and Warrior\'s sweat?')
					talk_state = 23
				else
					selfSay('I need 30 beholder eyes, 10 red dragon scales, 30 lizard scales, 20 fish fins, 20 vampire dusts, 10 demon dusts and Warrior\'s sweat, to give you the first assassin addon. Come back when you have it.')
					talk_state = 0
				end
			else
				selfSay(addon_need_premium)
				talk_state = 0
			end
------------------------------------------------ confirm yes ------------------------------------------------
		elseif msgcontains(msg, 'yes') and talk_state == 23 then
			talk_state = 0
			if getPlayerItemCount(cid,5898) >= 30 and getPlayerItemCount(cid,5882) >= 10 and getPlayerItemCount(cid,5881) >= 30 and getPlayerItemCount(cid,5895) >= 20 and getPlayerItemCount(cid,5905) >= 20 and getPlayerItemCount(cid,5906) >= 10 and getPlayerItemCount(cid,5885) >= 1 then
				addon = getPlayerStorageValue(cid,120001)
				if addon == -1 then
					if doPlayerTakeItem(cid,5898,30) == 0 and doPlayerTakeItem(cid,5882,10) == 0 and doPlayerTakeItem(cid,5881,30) == 0 and doPlayerTakeItem(cid,5895,20) == 0 and doPlayerTakeItem(cid,5905,20) == 0 and doPlayerTakeItem(cid,5906,10) == 0 and doPlayerTakeItem(cid,5885,1) then
						selfSay(addon_give)
						doPlayerAddOutfit(cid, 152, 1)
						doPlayerAddOutfit(cid, 156, 1)
						setPlayerStorageValue(cid,120001,1)
					end
				else
					selfSay(addon_have_already)
				end
			else
				selfSay(addon_have_not_items)
			end
------------------------------------------------ addon ------------------------------------------------
		elseif msgcontains(msg, 'second assassin addon') then
			if isPremium(cid) then
				if getPlayerItemCount(cid,5909) >= 50 and getPlayerItemCount(cid,5910) >= 50 and getPlayerItemCount(cid,5911) >= 50 and getPlayerItemCount(cid,5912) >= 50 and getPlayerItemCount(cid,5913) >= 50 and getPlayerItemCount(cid,5914) >= 50 and getPlayerItemCount(cid,5886) >= 10 then
					selfSay('Did you bring me 50 blue piece of cloth, 50 green piece of cloth, 50 red piece of cloth, 50 brown piece of cloth, 50 yellow piece of cloth, 50 white piece of cloth and 10 spider silk yarns?')
					talk_state = 24
				else
					selfSay('I need 50 blue piece of cloth, 50 green piece of cloth, 50 red piece of cloth, 50 brown piece of cloth, 50 yellow piece of cloth, 50 white piece of cloth and 10 spider silk yarns, to give you the second assassin addon. Come back when you have them.')
					talk_state = 0
				end
			else
				selfSay(addon_need_premium)
				talk_state = 0
			end
------------------------------------------------ confirm yes ------------------------------------------------
		elseif msgcontains(msg, 'yes') and talk_state == 24 then
			talk_state = 0
			if getPlayerItemCount(cid,5909) >= 50 and getPlayerItemCount(cid,5910) >= 50 and getPlayerItemCount(cid,5911) >= 50 and getPlayerItemCount(cid,5912) >= 50 and getPlayerItemCount(cid,5913) >= 50 and getPlayerItemCount(cid,5914) >= 50 and getPlayerItemCount(cid,5886) >= 10 then
				addon = getPlayerStorageValue(cid,120002)
				if addon == -1 then
					if doPlayerTakeItem(cid,5909,50) == 0 and doPlayerTakeItem(cid,5910,50) == 0 and doPlayerTakeItem(cid,5911,50) == 0 and doPlayerTakeItem(cid,5912,50) == 0 and doPlayerTakeItem(cid,5913,50) == 0 and doPlayerTakeItem(cid,5914,50) == 0 and doPlayerTakeItem(cid,5886,10) == 0 then
						selfSay(addon_give)
						doPlayerAddOutfit(cid, 152, 2)
						doPlayerAddOutfit(cid, 156, 2)
						setPlayerStorageValue(cid,120002,1)
					end
				else
					selfSay(addon_have_already)
				end
			else
				selfSay(addon_have_not_items)
			end
------------------------------------------------ addon ------------------------------------------------
		elseif msgcontains(msg, 'first beggar addon') then
			if isPremium(cid) then
				if getPlayerItemCount(cid,5883) >= 100 and player_money >= 20000 then
					selfSay('Did you bring me 100 ape furs and 20000 gold coins?')
					talk_state = 25
				else
					selfSay('I need 100 ape furs and 20000 gold coins, to give you the first beggar addon. Come back when you have it.')
					talk_state = 0
				end
			else
				selfSay(addon_need_premium)
				talk_state = 0
			end
------------------------------------------------ confirm yes ------------------------------------------------
		elseif msgcontains(msg, 'yes') and talk_state == 25 then
			talk_state = 0
			if getPlayerItemCount(cid,5883) >= 100 and player_money >= 20000 then
				addon = getPlayerStorageValue(cid,130001)
				if addon == -1 then
					if doPlayerTakeItem(cid,5883,100) and doPlayerTakeItem(cid,2160,2) == 0 then
						selfSay(addon_give)
						doPlayerAddOutfit(cid, 153, 1)
						doPlayerAddOutfit(cid, 157, 1)
						setPlayerStorageValue(cid,130001,1)
					end
				else
					selfSay(addon_have_already)
				end
			else
				selfSay(addon_have_not_items)
			end
------------------------------------------------ addon ------------------------------------------------
		elseif msgcontains(msg, 'second beggar addon') then
			if isPremium(cid) then
				if getPlayerItemCount(cid,6107) >= 1 then
					selfSay('Did you bring me Simon\'s favourite staff?')
					talk_state = 26
				else
					selfSay('I need Simon\'s favourite staff, to give you the second beggar addon. Come back when you have them.')
					talk_state = 0
				end
			else
				selfSay(addon_need_premium)
				talk_state = 0
			end
------------------------------------------------ confirm yes ------------------------------------------------
		elseif msgcontains(msg, 'yes') and talk_state == 26 then
			talk_state = 0
			if getPlayerItemCount(cid,6107) >= 1 then
				addon = getPlayerStorageValue(cid,130002)
				if addon == -1 then
					if doPlayerTakeItem(cid,6107,1) == 0 then
						selfSay(addon_give)
						doPlayerAddOutfit(cid, 153, 2)
						doPlayerAddOutfit(cid, 157, 2)
						setPlayerStorageValue(cid,130002,1)
					end
				else
					selfSay(addon_have_already)
				end
			else
				selfSay(addon_have_not_items)
			end
------------------------------------------------ addon ------------------------------------------------
		elseif msgcontains(msg, 'first pirate addon') then
			if isPremium(cid) then
				if getPlayerItemCount(cid,6126) >= 100 and getPlayerItemCount(cid,6097) >= 100 and getPlayerItemCount(cid,6098) >= 100 then
					selfSay('Did you bring me 100 eye patches, 100 peg legs and 100 hooks?')
					talk_state = 27
				else
					selfSay('I need 100 eye patches, 100 peg legs and 100 hooks, to give you the first pirate addon. Come back when you have it.')
					talk_state = 0
				end
			else
				selfSay(addon_need_premium)
				talk_state = 0
			end
------------------------------------------------ confirm yes ------------------------------------------------
		elseif msgcontains(msg, 'yes') and talk_state == 27 then
			talk_state = 0
			if getPlayerItemCount(cid,6126) >= 100 and getPlayerItemCount(cid,6097) >= 100 and getPlayerItemCount(cid,6098) >= 100 then
				addon = getPlayerStorageValue(cid,140001)
				if addon == -1 then
					if doPlayerTakeItem(cid,6126,100) == 0 and doPlayerTakeItem(cid,6097,100) == 0 and doPlayerTakeItem(cid,6098,100) == 0 then
						selfSay(addon_give)
						doPlayerAddOutfit(cid, 151, 1)
						doPlayerAddOutfit(cid, 155, 1)
						setPlayerStorageValue(cid,140001,1)
					end
				else
					selfSay(addon_have_already)
				end
			else
				selfSay(addon_have_not_items)
			end
------------------------------------------------ addon ------------------------------------------------
		elseif msgcontains(msg, 'second pirate addon') then
			if isPremium(cid) then
				if getPlayerItemCount(cid,2385) >= 1 and getPlayerItemCount(cid,6098) >= 1 and getPlayerItemCount(cid,6095) >= 1 and getPlayerItemCount(cid,6096) >= 1 then
					selfSay('Did you bring me a sabre, an eye patch, a pirate shirt, and a pirate hat??')
					talk_state = 28
				else
					selfSay('I need a sabre, an eye patch, a pirate shirt, a pirate hat, to give you the second pirate addon. Come back when you have them.')
					talk_state = 0
				end
			else
				selfSay(addon_need_premium)
				talk_state = 0
			end
------------------------------------------------ confirm yes ------------------------------------------------
		elseif msgcontains(msg, 'yes') and talk_state == 28 then
			talk_state = 0
			if getPlayerItemCount(cid,2385) >= 1 and getPlayerItemCount(cid,6098) >= 1 and getPlayerItemCount(cid,6095) >= 1 and getPlayerItemCount(cid,6096) >= 1 then
				addon = getPlayerStorageValue(cid,140002)
				if addon == -1 then
					if doPlayerTakeItem(cid,2385,1) == 0 and doPlayerTakeItem(cid,6098,1) == 0 and doPlayerTakeItem(cid,6095,1) == 0 and doPlayerTakeItem(cid,6096,1) == 0 then
						selfSay(addon_give)
						doPlayerAddOutfit(cid, 151, 2)
						doPlayerAddOutfit(cid, 155, 2)
						setPlayerStorageValue(cid,140002,1)
					end
				else
					selfSay(addon_have_already)
				end
			else
				selfSay(addon_have_not_items)
			end
------------------------------------------------ addon ------------------------------------------------
		elseif msgcontains(msg, 'first shaman addon') then
			if isPremium(cid) then
				if getPlayerItemCount(cid,3955) >= 5 and getPlayerItemCount(cid,5015) >= 1 then
					selfSay('Did you bring me 5 dworc vodoo dolls and a mandrake?')
					talk_state = 29
				else
					selfSay('I need 5 dworc vodoo dolls and a mandrake, to give you the first shaman addon. Come back when you have it.')
					talk_state = 0
				end
			else
				selfSay(addon_need_premium)
				talk_state = 0
			end
------------------------------------------------ confirm yes ------------------------------------------------
		elseif msgcontains(msg, 'yes') and talk_state == 29 then
			talk_state = 0
			if getPlayerItemCount(cid,3955) >= 5 and getPlayerItemCount(cid,5015) >= 1 then
				addon = getPlayerStorageValue(cid,150001)
				if addon == -1 then
					if doPlayerTakeItem(cid,3955,5) == 0 and doPlayerTakeItem(cid,5015,1) == 0 then
						selfSay(addon_give)
						doPlayerAddOutfit(cid, 154, 1)
						doPlayerAddOutfit(cid, 158, 1)
						setPlayerStorageValue(cid,150001,1)
					end
				else
					selfSay(addon_have_already)
				end
			else
				selfSay(addon_have_not_items)
			end
------------------------------------------------ addon ------------------------------------------------
		elseif msgcontains(msg, 'second shaman addon') then
			if isPremium(cid) then
				if getPlayerItemCount(cid,3966) >= 5 and getPlayerItemCount(cid,3967) >= 5 then
					selfSay('Did you bring me 5 banana staffs and 5 tribal masks?')
					talk_state = 30
				else
					selfSay('I need 5 banana staffs and 5 tribal masks, to give you the second shaman addon. Come back when you have them.')
					talk_state = 0
				end
			else
				selfSay(addon_need_premium)
				talk_state = 0
			end
------------------------------------------------ confirm yes ------------------------------------------------
		elseif msgcontains(msg, 'yes') and talk_state == 30 then
			talk_state = 0
			if getPlayerItemCount(cid,3966) >= 5 and getPlayerItemCount(cid,3967) >= 5 then
				addon = getPlayerStorageValue(cid,150002)
				if addon == -1 then
					if doPlayerTakeItem(cid,3966,5) == 0 and doPlayerTakeItem(cid,3967,5) == 0 then
						selfSay(addon_give)
						doPlayerAddOutfit(cid, 154, 2)
						doPlayerAddOutfit(cid, 158, 2)
						setPlayerStorageValue(cid,150002,1)
					end
				else
					selfSay(addon_have_already)
				end
			else
				selfSay(addon_have_not_items)
			end
------------------------------------------------ addon ------------------------------------------------
		elseif msgcontains(msg, 'first norseman addon') then
			if isPremium(cid) then
				if getPlayerItemCount(cid,7290) >= 5 then
					selfSay('Excellent, Did you bring me 5 shard?')
					talk_state = 31
				else
					selfSay('I need 5 shard, to give you the first norseman addon. Come back when you have them.')
					talk_state = 0
				end
			else
				selfSay(addon_need_premium)
				talk_state = 0
			end
------------------------------------------------ confirm yes ------------------------------------------------
		elseif msgcontains(msg, 'yes') and talk_state == 31 then
			talk_state = 0
			if getPlayerItemCount(cid,7290) >= 5 then
				addon = getPlayerStorageValue(cid,150003)
				if addon == -1 then
					if doPlayerTakeItem(cid,7290,5) == 0 then
						selfSay(addon_give)
						doPlayerAddOutfit(cid, 251, 1)
						doPlayerAddOutfit(cid, 252, 1)
						setPlayerStorageValue(cid,150003,1)
					end
				else
					selfSay(addon_have_already)
				end
			else
				selfSay(addon_have_not_items)
			end
------------------------------------------------ addon ------------------------------------------------
		elseif msgcontains(msg, 'second norseman addon') then
			if isPremium(cid) then
				if getPlayerItemCount(cid,7290) >= 10 then
					selfSay('Did you bring me 10 shard?')
					talk_state = 32
				else
					selfSay('I need 10 shard, to give you the second norseman addon. Come back when you have them.')
					talk_state = 0
				end
			else
				selfSay(addon_need_premium)
				talk_state = 0
			end
------------------------------------------------ confirm yes ------------------------------------------------
		elseif msgcontains(msg, 'yes') and talk_state == 32 then
			talk_state = 0
			if getPlayerItemCount(cid,7290) >= 10 then
				addon = getPlayerStorageValue(cid,150004)
				if addon == -1 then
					if doPlayerTakeItem(cid,7290,10) == 0 then
						selfSay(addon_give)
						doPlayerAddOutfit(cid, 251, 2)
						doPlayerAddOutfit(cid, 252, 2)
						setPlayerStorageValue(cid,150004,1)
					end
				else
					selfSay(addon_have_already)
				end
			else
				selfSay(addon_have_not_items)
			end
------------------------------------------------ addon ------------------------------------------------
		elseif msgcontains(msg, 'first brotherhood addon') then
			if isPremium(cid) then
				if getPlayerItemCount(cid,6500) >= 350 then
					selfSay('Did you bring me 350 demonic essences?')
					talk_state = 33
				else
					selfSay('I need 350 demonic essence, to give you the first brotherhood addon. Come back when you have them.')
					talk_state = 0
				end
			else
				selfSay(addon_need_premium)
				talk_state = 0
			end
------------------------------------------------ confirm yes ------------------------------------------------
		elseif msgcontains(msg, 'yes') and talk_state == 33 then
			talk_state = 0
			if getPlayerItemCount(cid,6500) >= 350 then
				addon = getPlayerStorageValue(cid,150008)
				if addon == -1 then
					if doPlayerTakeItem(cid,6500,350) == 0 then
						selfSay(addon_give)
						doPlayerAddOutfit(cid, 279, 1)
						doPlayerAddOutfit(cid, 278, 1)
						setPlayerStorageValue(cid,150008,1)
					end
				else
					selfSay(addon_have_already)
				end
			else
				selfSay(addon_have_not_items)
			end			
------------------------------------------------ addon ------------------------------------------------
		elseif msgcontains(msg, 'second brotherhood addon') then
			if isPremium(cid) then
				if getPlayerItemCount(cid,6500) >= 100 and getPlayerItemCount(cid,5880) >= 100 and getPlayerItemCount(cid,5944) >= 100 then
					selfSay('Did you bring me 100 demonic essences, 100 soul orb and 100 iron ore?')
					talk_state = 35
				else
					selfSay('I need 100 demonic essence, 100 soul orb and 100 iron ore, to give you the first brotherhood addon. Come back when you have them.')
					talk_state = 0
				end
			else
				selfSay(addon_need_premium)
				talk_state = 0
			end
------------------------------------------------ confirm yes ------------------------------------------------
		elseif msgcontains(msg, 'yes') and talk_state == 35 then
			talk_state = 0
			if getPlayerItemCount(cid,6500) >= 100 and getPlayerItemCount(cid,5880) >= 100 and getPlayerItemCount(cid,5944) >= 100 then
				addon = getPlayerStorageValue(cid,150009)
				if addon == -1 then
					if doPlayerTakeItem(cid,6500,100) and doPlayerTakeItem(cid,5880,100) == 0 and doPlayerTakeItem(cid,5944,100) == 0 then
						selfSay(addon_give)
						doPlayerAddOutfit(cid, 279, 2)
						doPlayerAddOutfit(cid, 278, 2)
						setPlayerStorageValue(cid,150009,1)
					end
				else
					selfSay(addon_have_already)
				end
			else
				selfSay(addon_have_not_items)
			end	


------------------------------------------------ confirm no ------------------------------------------------
		elseif msgcontains(msg, 'no') and (talk_state >= 1 and talk_state <= 34) then
			selfSay('Ok than.')
			talk_state = 0
		end
	-- Place all your code in here. Remember that hi, bye and all that stuff is already handled by the npcsystem, so you do not have to take care of that yourself.
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())