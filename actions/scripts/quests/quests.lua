function onUse(cid, item, frompos, item2, topos)

	playerAccess = getPlayerGroupId(cid)
	if playerAccess < 3 or playerAccess >= 5 then

		--Serpent Sword
		if item.uid == 6005 then
			queststatus = getPlayerStorageValue(cid,6039)
			if queststatus == -1 or queststatus == 0 or playerAccess >= 5 then
				doPlayerSendTextMessage(cid,22,"You have found a Serpent Sword.")
				doSendMagicEffect(topos, CONST_ME_MAGIC_BLUE)
				doPlayerAddItem(cid,2409,1)
				setPlayerStorageValue(cid,6039,1)

			else
			doPlayerSendTextMessage(cid,22,"This chest is empty.")
			end

		--BK Quest -- C-Armor / C-Shield
		elseif item.uid == 6006 then
			queststatus = getPlayerStorageValue(cid,6040)
			if queststatus == -1 or queststatus == 0 or playerAccess >= 5 then
				doPlayerSendTextMessage(cid,22,"You have found a Crown Armor.")
				doSendMagicEffect(topos, CONST_ME_MAGIC_BLUE)
				doPlayerAddItem(cid,2487,1)
				setPlayerStorageValue(cid,6040,1)

			else
			doPlayerSendTextMessage(cid,22,"This chest is empty.")
			end

		elseif item.uid == 6007 then
			queststatus = getPlayerStorageValue(cid,6041)
			if queststatus == -1 or queststatus == 0 or playerAccess >= 5 then
				doPlayerSendTextMessage(cid,22,"You have found a Crown Shield.")
				doSendMagicEffect(topos, CONST_ME_MAGIC_BLUE)
				doPlayerAddItem(cid,2519,1)
				setPlayerStorageValue(cid,6041,1)

			else
			doPlayerSendTextMessage(cid,22,"This chest is empty.")
			end

		--Banshee Quest -- Boh / GS / Steath Ring / 10k / Tower Shield / SSA
		elseif item.uid == 6008 then
			queststatus = getPlayerStorageValue(cid,6042)
			if queststatus == -1 or queststatus == 0 or playerAccess >= 5 then
				doPlayerSendTextMessage(cid,22,"You have found a Boots of Haste.")
				doSendMagicEffect(topos, CONST_ME_MAGIC_BLUE)
				doPlayerAddItem(cid,2195,1)
				setPlayerStorageValue(cid,6042,1)

			else
			doPlayerSendTextMessage(cid,22,"This chest is empty.")
			end

		elseif item.uid == 6009 then
			queststatus = getPlayerStorageValue(cid,6043)
			if queststatus == -1 or queststatus == 0 or playerAccess >= 5 then
				doPlayerSendTextMessage(cid,22,"You have found a Crystal Coin.")
				doSendMagicEffect(topos, CONST_ME_MAGIC_BLUE)
				doPlayerAddItem(cid,2160,1)
				setPlayerStorageValue(cid,6043,1)

			else
			doPlayerSendTextMessage(cid,22,"This chest is empty.")
			end

		elseif item.uid == 6010 then
			queststatus = getPlayerStorageValue(cid,6044)
			if queststatus == -1 or queststatus == 0 or playerAccess >= 5 then
				doPlayerSendTextMessage(cid,22,"You have found a Tower Shield.")
				doSendMagicEffect(topos, CONST_ME_MAGIC_BLUE)
				doPlayerAddItem(cid,2528,1)
				setPlayerStorageValue(cid,6044,1)

			else
			doPlayerSendTextMessage(cid,22,"This chest is empty.")
			end

		elseif item.uid == 6011 then
			queststatus = getPlayerStorageValue(cid,6045)
			if queststatus == -1 or queststatus == 0 or playerAccess >= 5 then
				doPlayerSendTextMessage(cid,22,"You have found a Giant Sword.")
				doSendMagicEffect(topos, CONST_ME_MAGIC_BLUE)
				doPlayerAddItem(cid,2393,1)
				setPlayerStorageValue(cid,6045,1)

			else
			doPlayerSendTextMessage(cid,22,"This chest is empty.")
			end

		elseif item.uid == 6012 then
			queststatus = getPlayerStorageValue(cid,6046)
			if queststatus == -1 or queststatus == 0 or playerAccess >= 5 then
				doPlayerSendTextMessage(cid,22,"You have found a Stone Skin Amulet.")
				doSendMagicEffect(topos, CONST_ME_MAGIC_BLUE)
				doPlayerAddItem(cid,2197,1)
				setPlayerStorageValue(cid,6046,1)

			else
			doPlayerSendTextMessage(cid,22,"This chest is empty.")
			end

		elseif item.uid == 6013 then
			queststatus = getPlayerStorageValue(cid,6047)
			if queststatus == -1 or queststatus == 0 or playerAccess >= 5 then
				doPlayerSendTextMessage(cid,22,"You have found a Stealth Ring.")
				doSendMagicEffect(topos, CONST_ME_MAGIC_BLUE)
				doPlayerAddItem(cid,2165,1)
				setPlayerStorageValue(cid,6047,1)

			else
			doPlayerSendTextMessage(cid,22,"This chest is empty.")
			end

		--Orc Fortress Quest -- Fire Sword / K-Armor / K-Axe
		elseif item.uid == 6014 then
			queststatus = getPlayerStorageValue(cid,6048)
			if queststatus == -1 or queststatus == 0 or playerAccess >= 5 then
				doPlayerSendTextMessage(cid,22,"You have found a Fire Sword.")
				doSendMagicEffect(topos, CONST_ME_MAGIC_BLUE)
				doPlayerAddItem(cid,2392,1)
				setPlayerStorageValue(cid,6048,1)

			else
			doPlayerSendTextMessage(cid,22,"This chest is empty.")
			end

		elseif item.uid == 6015 then
			queststatus = getPlayerStorageValue(cid,6049)
			if queststatus == -1 or queststatus == 0 or playerAccess >= 5 then
				doPlayerSendTextMessage(cid,22,"You have found a Knight Armor.")
				doSendMagicEffect(topos, CONST_ME_MAGIC_BLUE)
				doPlayerAddItem(cid,2476,1)
				setPlayerStorageValue(cid,6049,1)

			else
			doPlayerSendTextMessage(cid,22,"This chest is empty.")
			end

		elseif item.uid == 6016 then
			queststatus = getPlayerStorageValue(cid,6050)
			if queststatus == -1 or queststatus == 0 or playerAccess >= 5 then
				doPlayerSendTextMessage(cid,22,"You have found a Knight Axe.")
				doSendMagicEffect(topos, CONST_ME_MAGIC_BLUE)
				doPlayerAddItem(cid,2430,1)
				setPlayerStorageValue(cid,6050,1)

			else
			doPlayerSendTextMessage(cid,22,"This chest is empty.")
			end

		--Crusader Helmet
		elseif item.uid == 6017 then
			queststatus = getPlayerStorageValue(cid,6051)
			if queststatus == -1 or queststatus == 0 or playerAccess >= 5 then
				doPlayerSendTextMessage(cid,22,"You have found a Crusader Helmet.")
				doSendMagicEffect(topos, CONST_ME_MAGIC_BLUE)
				doPlayerAddItem(cid,2497,1)
				setPlayerStorageValue(cid,6051,1)

			else
			doPlayerSendTextMessage(cid,22,"This chest is empty.")
			end

		--Shield of Honour
		elseif item.uid == 6019 then
			queststatus = getPlayerStorageValue(cid,6053)
			if queststatus == -1 or queststatus == 0 or playerAccess >= 5 then
				doPlayerSendTextMessage(cid,22,"You have found a Shield of Honour.")
				doSendMagicEffect(topos, CONST_ME_MAGIC_BLUE)
				doPlayerAddItem(cid,2517,1)
				setPlayerStorageValue(cid,6053,1)

			else
			doPlayerSendTextMessage(cid,22,"This chest is empty.")
			end

		--Behemoth Quest -- Golden Armor / Guardian Halberd / Demon Shield / Platinum Amulet / Life Ring / Crystal Ring / 3 Small Diamonds / 4 Small Sapphires
		elseif item.uid == 6020 then
			queststatus = getPlayerStorageValue(cid,6054)
			if queststatus == -1 or queststatus == 0 or playerAccess >= 5 then
				doPlayerSendTextMessage(cid,22,"You have found a Golden Armor.")
				doSendMagicEffect(topos, CONST_ME_MAGIC_BLUE)
				doPlayerAddItem(cid,2466,1)
				setPlayerStorageValue(cid,6054,1)

			else
			doPlayerSendTextMessage(cid,22,"This chest is empty.")
			end

		elseif item.uid == 6021 then
			queststatus = getPlayerStorageValue(cid,6055)
			if queststatus == -1 or queststatus == 0 or playerAccess >= 5 then
				doPlayerSendTextMessage(cid,22,"You have found a Guardian Halberd.")
				doSendMagicEffect(topos, CONST_ME_MAGIC_BLUE)
				doPlayerAddItem(cid,2427,1)
				setPlayerStorageValue(cid,6055,1)

			else
			doPlayerSendTextMessage(cid,22,"This chest is empty.")
			end

		elseif item.uid == 6022 then
			queststatus = getPlayerStorageValue(cid,6056)
			if queststatus == -1 or queststatus == 0 or playerAccess >= 5 then
				doPlayerSendTextMessage(cid,22,"You have found a Demon Shield.")
				doSendMagicEffect(topos, CONST_ME_MAGIC_BLUE)
				doPlayerAddItem(cid,2520,1)
				setPlayerStorageValue(cid,6056,1)

			else
			doPlayerSendTextMessage(cid,22,"This chest is empty.")
			end

		elseif item.uid == 6023 then
			queststatus = getPlayerStorageValue(cid,6057)
			if queststatus == -1 or queststatus == 0 or playerAccess >= 5 then
				doPlayerSendTextMessage(cid,22,"You have found a backpack.")
				doSendMagicEffect(topos, CONST_ME_MAGIC_BLUE)
				box = doPlayerAddItem(cid,1988,1)
				doAddContainerItem(box,2171,1)
				doAddContainerItem(box,2168,1)
				doAddContainerItem(box,2124,1)
				doAddContainerItem(box,2145,3)
				doAddContainerItem(box,2146,4)
				setPlayerStorageValue(cid,6057,1)

			else
			doPlayerSendTextMessage(cid,22,"This chest is empty.")
			end

		-- Fire Axe Quest (Fire Axe - Ring of Healing - Dragon Necklace, 7 Small Diamond)
		elseif item.uid == 6024 then
			queststatus = getPlayerStorageValue(cid,6058)
			if queststatus == -1 or queststatus == 0 or playerAccess >= 5 then
				doPlayerSendTextMessage(cid,22,"You have found a Fire Axe.")
				doSendMagicEffect(topos, CONST_ME_MAGIC_BLUE)
				doPlayerAddItem(cid,2432,1)
				setPlayerStorageValue(cid,6058,1)

			else
			doPlayerSendTextMessage(cid,22,"This chest is empty.")
			end
			
		elseif item.uid == 6062 then
			queststatus = getPlayerStorageValue(cid,6087)
			if queststatus == -1 or queststatus == 0 or playerAccess >= 5 then
				doPlayerSendTextMessage(cid,22,"You have found a Ring of Healing.")
				doSendMagicEffect(topos, CONST_ME_MAGIC_BLUE)
				doPlayerAddItem(cid,2214,1)
				setPlayerStorageValue(cid,6087,1)

			else
			doPlayerSendTextMessage(cid,22,"This chest is empty.")
			end

		elseif item.uid == 6063 then
			queststatus = getPlayerStorageValue(cid,6088)
			if queststatus == -1 or queststatus == 0 or playerAccess >= 5 then
				doPlayerSendTextMessage(cid,22,"You have found a Dragon Necklace.")
				doSendMagicEffect(topos, CONST_ME_MAGIC_BLUE)
				doPlayerAddItem(cid,2201,200)
				setPlayerStorageValue(cid,6088,1)

			else
			doPlayerSendTextMessage(cid,22,"This chest is empty.")
			end

		elseif item.uid == 6064 then
			queststatus = getPlayerStorageValue(cid,6089)
			if queststatus == -1 or queststatus == 0 or playerAccess >= 5 then
				doPlayerSendTextMessage(cid,22,"You have found a Small Diamonds.")
				doSendMagicEffect(topos, CONST_ME_MAGIC_BLUE)
				doPlayerAddItem(cid,2145,7)
				setPlayerStorageValue(cid,6089,1)

			else
			doPlayerSendTextMessage(cid,22,"This chest is empty.")
			end			

		--Pick Quest
		elseif item.uid == 6025 then
			queststatus = getPlayerStorageValue(cid,6059)
			if queststatus == -1 or queststatus == 0 or playerAccess >= 5 then
				doPlayerSendTextMessage(cid,22,"You have found a Pick.")
				doSendMagicEffect(topos, CONST_ME_MAGIC_BLUE)
				doPlayerAddItem(cid,2553,1)
				setPlayerStorageValue(cid,6059,1)

			else
			doPlayerSendTextMessage(cid,22,"This chest is empty.")
			end

		--Brass Armor and Legs
		elseif item.uid == 6026 then
			queststatus = getPlayerStorageValue(cid,6060)
			if queststatus == -1 or queststatus == 0 or playerAccess >= 5 then
				doPlayerSendTextMessage(cid,22,"You have found a Brass Armor.")
				doSendMagicEffect(topos, CONST_ME_MAGIC_BLUE)
				doPlayerAddItem(cid,2465,1)
				setPlayerStorageValue(cid,6060,1)

			else
			doPlayerSendTextMessage(cid,22,"This chest is empty.")
			end

		elseif item.uid == 6027 then
			queststatus = getPlayerStorageValue(cid,6061)
			if queststatus == -1 or queststatus == 0 or playerAccess >= 5 then
				doPlayerSendTextMessage(cid,22,"You have found a Brass Legs.")
				doSendMagicEffect(topos, CONST_ME_MAGIC_BLUE)
				doPlayerAddItem(cid,2478,1)
				setPlayerStorageValue(cid,6061,1)

			else
			doPlayerSendTextMessage(cid,22,"This chest is empty.")
			end
		
		--Pharao Quest (Dragon Lance or War Hammer or Giant Sword)		
	   	elseif item.uid == 6028 then
	   		queststatus = getPlayerStorageValue(cid,6062)
	   		if queststatus == -1 or playerAccess >= 5 then
				doPlayerSendTextMessage(cid,22,"You have found a Dragon Lance.")
				doSendMagicEffect(topos, CONST_ME_MAGIC_BLUE)
				doPlayerAddItem(cid,2414,1)
				setPlayerStorageValue(cid,6062,1)
	   		else
	   			doPlayerSendTextMessage(cid,22,"It is empty.")
	   		end
	   	elseif item.uid == 6029 then
	   		queststatus = getPlayerStorageValue(cid,6062)
	   		if queststatus == -1 or playerAccess >= 5 then
				doPlayerSendTextMessage(cid,22,"You have found a War Hammer.")
				doSendMagicEffect(topos, CONST_ME_MAGIC_BLUE)
				doPlayerAddItem(cid,2391,1)
				setPlayerStorageValue(cid,6062,1)
	   		else
	   			doPlayerSendTextMessage(cid,22,"It is empty.")
	   		end	elseif item.uid == 6030 then
	   		queststatus = getPlayerStorageValue(cid,6062)
	   		if queststatus == -1 or playerAccess >= 5 then
				doPlayerSendTextMessage(cid,22,"You have found a Giant Sword.")
				doSendMagicEffect(topos, CONST_ME_MAGIC_BLUE)
				doPlayerAddItem(cid,2393,1)
				setPlayerStorageValue(cid,6062,1)
	   		else
	   			doPlayerSendTextMessage(cid,22,"It is empty.")
	   		end		
			
		--Annihilator Quest (Demon Armor - Magic Sword - Stonnecutter's Axe - Thunder Hammer)
		elseif item.uid == 6031 then
	   		queststatus = getPlayerStorageValue(cid,6063)
	   		if queststatus == -1 or playerAccess >= 5 then
				setPlayerStorageValue(cid, 100, 1)		
				doPlayerSendTextMessage(cid,22,"You have found a Demon Armor.")
				doSendMagicEffect(topos, CONST_ME_MAGIC_BLUE)
				doPlayerAddItem(cid,2494,1)
				setPlayerStorageValue(cid,6063,1)
	   		else
	   			doPlayerSendTextMessage(cid,22,"It is empty.")
	   		end	
			
		elseif item.uid == 6032 then
	   		queststatus = getPlayerStorageValue(cid,6063)
	   		if queststatus == -1 or playerAccess >= 5 then
				setPlayerStorageValue(cid, 100, 1)		
				doPlayerSendTextMessage(cid,22,"You have found a Magic Sword.")
				doSendMagicEffect(topos, CONST_ME_MAGIC_BLUE)
				doPlayerAddItem(cid,2400,1)
				setPlayerStorageValue(cid,6063,1)
	   		else
	   			doPlayerSendTextMessage(cid,22,"It is empty.")
	   		end	
			
		elseif item.uid == 6033 then
	   		queststatus = getPlayerStorageValue(cid,6063)
	   		if queststatus == -1 or playerAccess >= 5 then
				setPlayerStorageValue(cid, 100, 1)		
				doPlayerSendTextMessage(cid,22,"You have found a Stonnecutter's Axe.")
				doSendMagicEffect(topos, CONST_ME_MAGIC_BLUE)
				doPlayerAddItem(cid,2431,1)
				setPlayerStorageValue(cid,6063,1)
	   		else
	   			doPlayerSendTextMessage(cid,22,"It is empty.")
	   		end	
			
		elseif item.uid == 6034 then
	   		queststatus = getPlayerStorageValue(cid,6063)
	   		if queststatus == -1 or playerAccess >= 5 then
				setPlayerStorageValue(cid, 100, 1)			
				doPlayerSendTextMessage(cid,22,"You have found a Present Box.")
				doSendMagicEffect(topos, CONST_ME_MAGIC_BLUE)
				box = doPlayerAddItem(cid,1990,1)
				doAddContainerItem(box, 2326, 1)
				setPlayerStorageValue(cid,6063,1)
	   		else
	   			doPlayerSendTextMessage(cid,22,"It is empty.")
	   		end	
		
		--PoH Tower Mountain Quest (Noble Armor - 10k - Wand of Cosmic Energy - Mysterius Fetich)	
	   	elseif item.uid == 6035 then
	   		queststatus = getPlayerStorageValue(cid,6064)
	   		if queststatus == -1 or playerAccess >= 5 then
				doPlayerSendTextMessage(cid,22,"You have found a Noble Armor.")
				doSendMagicEffect(topos, CONST_ME_MAGIC_BLUE)
				doPlayerAddItem(cid,2486,1)
				setPlayerStorageValue(cid,6064,1)
	   		else
	   			doPlayerSendTextMessage(cid,22,"It is empty.")
	   		end
			
	   	elseif item.uid == 6036 then
	   		queststatus = getPlayerStorageValue(cid,6065)
	   		if queststatus == -1 or playerAccess >= 5 then
				doPlayerSendTextMessage(cid,22,"You have found a 100 platinum coin.")
				doSendMagicEffect(topos, CONST_ME_MAGIC_BLUE)
				doPlayerAddItem(cid,2152,100)
				setPlayerStorageValue(cid,6065,1)
	   		else
	   			doPlayerSendTextMessage(cid,22,"It is empty.")
			end
			
		elseif item.uid == 6037 then
	   		queststatus = getPlayerStorageValue(cid,6066)
	   		if queststatus == -1 or playerAccess >= 5 then
				doPlayerSendTextMessage(cid,22,"You have found a Wand of Cosmic Energy.")
				doSendMagicEffect(topos, CONST_ME_MAGIC_BLUE)
				doPlayerAddItem(cid,2189,1)
				setPlayerStorageValue(cid,6066,1)
	   		else
	   			doPlayerSendTextMessage(cid,22,"It is empty.")
	   		end			
			
		elseif item.uid == 6038 then
	   		queststatus = getPlayerStorageValue(cid,6067)
	   		if queststatus == -1 or playerAccess >= 5 then
				doPlayerSendTextMessage(cid,22,"You have found a Mysterius Fetich.")
				doSendMagicEffect(topos, CONST_ME_MAGIC_BLUE)
				doPlayerAddItem(cid,2194,1)
				setPlayerStorageValue(cid,6067,1)
	   		else
	   			doPlayerSendTextMessage(cid,22,"It is empty.")
	   		end	
			
		--Thiefs Dungeons (Dwarven Axe - Griffin Shield)	
		elseif item.uid == 6039 then
	   		queststatus = getPlayerStorageValue(cid,6068)
	   		if queststatus == -1 or queststatus == 0 or playerAccess >= 5 then
				doPlayerSendTextMessage(cid,22,"You have found a Dwarven Axe.")
				doSendMagicEffect(topos, CONST_ME_MAGIC_BLUE)
				doPlayerAddItem(cid,2435,1)
				setPlayerStorageValue(cid,6068,1)
	   		else
	   			doPlayerSendTextMessage(cid,22,"It is empty.")
	   		end		

		elseif item.uid == 6040 then
			queststatus = getPlayerStorageValue(cid,6069)
			if queststatus == -1 or queststatus == 0 or playerAccess >= 5 then
				doPlayerSendTextMessage(cid,22,"You have found a Griffin Shield.")
				doSendMagicEffect(topos, CONST_ME_MAGIC_BLUE)
				doPlayerAddItem(cid,2533,1)
				setPlayerStorageValue(cid,6069,1)
			else
				doPlayerSendTextMessage(cid,22,"It is empty.")
			end	
			
		--Mini Orc Fortress (Steel Shield - Scale Armor)
		elseif item.uid == 6042 then
			queststatus = getPlayerStorageValue(cid,6070)
			if queststatus == -1 or queststatus == 0 or playerAccess >= 5 then
				doPlayerSendTextMessage(cid,22,"You have found a Steel Shield.")
				doSendMagicEffect(topos, CONST_ME_MAGIC_BLUE)
				doPlayerAddItem(cid,2509,1)
				setPlayerStorageValue(cid,6070,1)
			else
				doPlayerSendTextMessage(cid,22,"It is empty.")
			end		

		elseif item.uid == 6043 then
			queststatus = getPlayerStorageValue(cid,6071)
			if queststatus == -1 or queststatus == 0 or playerAccess >= 5 then
				doPlayerSendTextMessage(cid,22,"You have found a Scale Armor.")
				doSendMagicEffect(topos, CONST_ME_MAGIC_BLUE)
				doPlayerAddItem(cid,2483,1)
				setPlayerStorageValue(cid,6071,1)
			else
				doPlayerSendTextMessage(cid,22,"It is empty.")
			end	
					
		--Minotaur Fortess Tower (Might Ring - 2 White Pearl - 2 Black Pearl)
		elseif item.uid == 6044 then
			queststatus = getPlayerStorageValue(cid,6072)
			if queststatus == -1 or queststatus == 0 or playerAccess >= 5 then
				doPlayerSendTextMessage(cid,22,"You have found a Might Ring.")
				doSendMagicEffect(topos, CONST_ME_MAGIC_BLUE)
				doPlayerAddItem(cid,2164,1)
				setPlayerStorageValue(cid,6072,1)
			else
				doPlayerSendTextMessage(cid,22,"It is empty.")
			end		
					
		elseif item.uid == 6057 then
			queststatus = getPlayerStorageValue(cid,6073)
			if queststatus == -1 or queststatus == 0 or playerAccess >= 5 then
				doPlayerSendTextMessage(cid,22,"You have found a backpack.")
				doSendMagicEffect(topos, CONST_ME_MAGIC_BLUE)
				box = doPlayerAddItem(cid,1988,1)
				doAddContainerItem(box, 2143, 2)
				doAddContainerItem(box, 2144, 2)							
				setPlayerStorageValue(cid,6073,1)
			else
				doPlayerSendTextMessage(cid,22,"It is empty.")
			end						
					
		--Ancient Room Quest (Purple Bag - Small Saphire - Quagmire Rod - Devil Helmet)
		elseif item.uid == 6045 then
			queststatus = getPlayerStorageValue(cid,6074)
			if queststatus == -1 or queststatus == 0 or playerAccess >= 5 then
				doPlayerSendTextMessage(cid,22,"You have found a bag.")
				doSendMagicEffect(topos, CONST_ME_MAGIC_BLUE)
				box = doPlayerAddItem(cid,1994,1)
				doAddContainerItem(box, 2313, 12)							
				setPlayerStorageValue(cid,6074,1)
			else
				doPlayerSendTextMessage(cid,22,"It is empty.")
			end		

		elseif item.uid == 6046 then
			queststatus = getPlayerStorageValue(cid,6075)
			if queststatus == -1 or queststatus == 0 or playerAccess >= 5 then
				doPlayerSendTextMessage(cid,22,"You have found a Small Saphire.")
				doSendMagicEffect(topos, CONST_ME_MAGIC_BLUE)
				doPlayerAddItem(cid,2146,1)
				setPlayerStorageValue(cid,6075,1)
			else
				doPlayerSendTextMessage(cid,22,"It is empty.")
			end		

		elseif item.uid == 6047 then
			queststatus = getPlayerStorageValue(cid,6076)
			if queststatus == -1 or queststatus == 0 or playerAccess >= 5 then
				doPlayerSendTextMessage(cid,22,"You have found a Quagmire Rod.")
				doSendMagicEffect(topos, CONST_ME_MAGIC_BLUE)
				doPlayerAddItem(cid,2181,1)
				setPlayerStorageValue(cid,6076,1)
			else
				doPlayerSendTextMessage(cid,22,"It is empty.")
			end		

		elseif item.uid == 6048 then
			queststatus = getPlayerStorageValue(cid,6077)
			if queststatus == -1 or queststatus == 0 or playerAccess >= 5 then
				doPlayerSendTextMessage(cid,22,"You have found a Devil Helmet.")
				doSendMagicEffect(topos, CONST_ME_MAGIC_BLUE)
				doPlayerAddItem(cid,2462,1)
				setPlayerStorageValue(cid,6077,1)
			else
				doPlayerSendTextMessage(cid,22,"It is empty.")
			end	
					
		--White Mansion Last Room (Sudden Death Rune 6x)
		elseif item.uid == 6049 then
			queststatus = getPlayerStorageValue(cid,6078)
			if queststatus == -1 or queststatus == 0 or playerAccess >= 5 then
				doPlayerSendTextMessage(cid,22,"You have found a bag.")
				doSendMagicEffect(topos, CONST_ME_MAGIC_BLUE)
				box = doPlayerAddItem(cid,1996,1)
				doAddContainerItem(box, 2268, 6)								
				setPlayerStorageValue(cid,6078,1)
			else
				doPlayerSendTextMessage(cid,22,"It is empty.")
			end		
					
		-- Alone Copse Quest (100 gps)
		elseif item.uid == 6050 then
			queststatus = getPlayerStorageValue(cid,6079)
			if queststatus == -1 or queststatus == 0 or playerAccess >= 5 then
				doPlayerSendTextMessage(cid,22,"You have found a 100 Gold Coins.")
				doSendMagicEffect(topos, CONST_ME_MAGIC_BLUE)
				doPlayerAddItem(cid,2148,100)
				setPlayerStorageValue(cid,6079,1)
			else
				doPlayerSendTextMessage(cid,22,"It is empty.")
			end
					
		--Mountain of dead tree Quest (100 bolts)
		elseif item.uid == 6051 then
			queststatus = getPlayerStorageValue(cid,6080)
			if queststatus == -1 or queststatus == 0 or playerAccess >= 5 then
				doPlayerSendTextMessage(cid,22,"You have found a 100 Bolts.")
				doSendMagicEffect(topos, CONST_ME_MAGIC_BLUE)
				doPlayerAddItem(cid,2543,100)
				setPlayerStorageValue(cid,6080,1)
			else
				doPlayerSendTextMessage(cid,22,"It is empty.")
			end
					
		--Supersonic Quest (Ring of Healing - Protection Amulet - 75 Burst Arrows)
		elseif item.uid == 6052 then
			queststatus = getPlayerStorageValue(cid,6081)
			if queststatus == -1 or queststatus == 0 or playerAccess >= 5 then
				doPlayerSendTextMessage(cid,22,"You have found a backpack.")
				doSendMagicEffect(topos, CONST_ME_MAGIC_BLUE)
				box = doPlayerAddItem(cid,1988,1)
				doAddContainerItem(box, 2214, 1)	
				doAddContainerItem(box, 2200, 1)		
				doAddContainerItem(box, 2546, 75)		
				setPlayerStorageValue(cid,6081,1)
			else
				doPlayerSendTextMessage(cid,22,"It is empty.")
			end			

		--Silk Quest (4 giant spider silk)
		elseif item.uid == 6053 then
			queststatus = getPlayerStorageValue(cid,6082)
			if queststatus == -1 or queststatus == 0 or playerAccess >= 5 then
				doPlayerSendTextMessage(cid,22,"You have found a Giant Spider Silk.")
				doSendMagicEffect(topos, CONST_ME_MAGIC_BLUE)
				doPlayerAddItem(cid,5879,4)	
				setPlayerStorageValue(cid,6082,1)
			else
				doPlayerSendTextMessage(cid,22,"It is empty.")
			end			

		--Elven Quest (Plate Legs - Bow - 2 Mana Fluid - 4 Life Fluid - 4 Small Diamond - 250 Gps)
		elseif item.uid == 6054 then
			queststatus = getPlayerStorageValue(cid,6083)
			if queststatus == -1 or queststatus == 0 or playerAccess >= 5 then
				doPlayerSendTextMessage(cid,22,"You have found a backpack.")
				doSendMagicEffect(topos, CONST_ME_MAGIC_BLUE)
				box = doPlayerAddItem(cid,1988,1)
				doAddContainerItem(box,2647,1)
				doAddContainerItem(box,2456,1)
				setPlayerStorageValue(cid,6083,1)
			else
				doPlayerSendTextMessage(cid,22,"It is empty.")
			end		

		elseif item.uid == 6055 then
			queststatus = getPlayerStorageValue(cid,6084)
			if queststatus == -1 or queststatus == 0 or playerAccess >= 5 then
				doPlayerSendTextMessage(cid,22,"You have found a bag.")
				doSendMagicEffect(topos, CONST_ME_MAGIC_BLUE)
				box = doPlayerAddItem(cid,1987,1)
				doAddContainerItem(box,2006,7)
				doAddContainerItem(box,2006,7)
				doAddContainerItem(box,2006,10)
				doAddContainerItem(box,2006,10)
				doAddContainerItem(box,2006,10)
				doAddContainerItem(box,2006,10)
				setPlayerStorageValue(cid,6084,1)
			else
				doPlayerSendTextMessage(cid,22,"It is empty.")
			end		

		elseif item.uid == 6056 then
			queststatus = getPlayerStorageValue(cid,6085)
			if queststatus == -1 or queststatus == 0 or playerAccess >= 5 then
				doPlayerSendTextMessage(cid,22,"You have found a bag.")
				doSendMagicEffect(topos, CONST_ME_MAGIC_BLUE)
				box = doPlayerAddItem(cid,1987,1)
				doAddContainerItem(box,2148,100)
				doAddContainerItem(box,2148,100)
				doAddContainerItem(box,2148,50)
				doAddContainerItem(box,2145,4)
				setPlayerStorageValue(cid,6085,1)
			else
				doPlayerSendTextMessage(cid,22,"It is empty.")
			end						

		-- Demon Helmet Quest (Demon Helmet - Demon Shield - Steel Boots)	
		elseif item.uid == 6058 then
			queststatus = getPlayerStorageValue(cid,7085)
			if queststatus == -1 or queststatus == 0 or playerAccess >= 5 then
				doPlayerSendTextMessage(cid,22,"You have found a Demon Helmet.")
				doSendMagicEffect(topos, CONST_ME_MAGIC_BLUE)
				doPlayerAddItem(cid,2493,1)
				setPlayerStorageValue(cid,7085,1)
			else
				doPlayerSendTextMessage(cid,22,"It is empty.")
			end
		elseif item.uid == 6059 then
			queststatus = getPlayerStorageValue(cid,7086)
			if queststatus == -1 or queststatus == 0 or playerAccess >= 5 then
				doPlayerSendTextMessage(cid,22,"You have found a Demon Shield.")
				doSendMagicEffect(topos, CONST_ME_MAGIC_BLUE)
				doPlayerAddItem(cid,2520,1)
				setPlayerStorageValue(cid,7086,1)
			else
				doPlayerSendTextMessage(cid,22,"It is empty.")
			end
		elseif item.uid == 6060 then
			queststatus = getPlayerStorageValue(cid,7087)
			if queststatus == -1 or queststatus == 0 or playerAccess >= 5 then
				doPlayerSendTextMessage(cid,22,"You have found a Steel Boots.")
				doSendMagicEffect(topos, CONST_ME_MAGIC_BLUE)
				doPlayerAddItem(cid,2645,1)
				setPlayerStorageValue(cid,7087,1)
			else
				doPlayerSendTextMessage(cid,22,"It is empty.")
			end	
			
		-- Wooden Stake Quest - by fawkes
		elseif item.uid == 6065 then
			queststatus = getPlayerStorageValue(cid,55501)
			if queststatus == -1 or queststatus == 0 then
				doPlayerSendTextMessage(cid,22,"You have found a Wooden Stake.")
				doSendMagicEffect(topos, CONST_ME_MAGIC_BLUE)
				doPlayerAddItem(cid,5941,1)
				setPlayerStorageValue(cid,55501,1)
			else
				doPlayerSendTextMessage(cid,22,"It is empty.")
			end
	
		-- Pirate Quest - by Bowaroz
		elseif item.uid == 6066 then
			queststatus = getPlayerStorageValue(cid,6090)
			if queststatus == -1 or queststatus == 0 then
				doPlayerSendTextMessage(cid,22,"You won 1.800.000 experience points.")
				doPlayerSendTextMessage(cid,20,"Baga! Ya got us, naw ya'r one'f us!")
				doSendMagicEffect(topos, CONST_ME_MAGIC_BLUE)
				doPlayerAddExp(cid, 1800000)
				setPlayerStorageValue(cid,6090,1)
			else
				doPlayerSendTextMessage(cid,22,"You have already won their reward.")
			end

		-- Blood Herb - by Bowaroz
		elseif item.uid == 6090 then
			queststatus = getPlayerStorageValue(cid,6091)
			if queststatus == -1 or queststatus == 0 then
				doPlayerSendTextMessage(cid,22,"You have found a 5 Blood Herb.")
				doSendMagicEffect(topos, CONST_ME_MAGIC_BLUE)
				doPlayerAddItem(cid,2798,5)
				setPlayerStorageValue(cid,6091,1)
			else
				doPlayerSendTextMessage(cid,22,"It is empty.")
			end

		-- Bast Skirt - by Bowaroz
		elseif item.uid == 6091 then
			queststatus = getPlayerStorageValue(cid,6092)
			if queststatus == -1 or queststatus == 0 then
				doPlayerSendTextMessage(cid,22,"You have found a Bast Skirt.")
				doSendMagicEffect(topos, CONST_ME_MAGIC_BLUE)
				doPlayerAddItem(cid,3983,1)
				setPlayerStorageValue(cid,6092,1)
			else
				doPlayerSendTextMessage(cid,22,"It is empty.")
			end

		-- Dark Quest - by Bowaroz
		elseif item.uid == 6092 then
			queststatus = getPlayerStorageValue(cid,6093)
			if queststatus == -1 or queststatus == 0 then
				doPlayerSendTextMessage(cid,22,"You won 1.000.000 experience points.")
				doSendMagicEffect(topos, CONST_ME_MAGIC_BLUE)
				doPlayerAddExp(cid, 1000000)
				setPlayerStorageValue(cid,6093,1)
			else
				doPlayerSendTextMessage(cid,22,"You have already won their reward.")
			end

		-- Devil Quest - by Bowaroz
		elseif item.uid == 6093 then
			queststatus = getPlayerStorageValue(cid,6094)
			if queststatus == -1 or queststatus == 0 then
				doPlayerSendTextMessage(cid,22,"You won 4.000.000 experience points.")
				doSendMagicEffect(topos, CONST_ME_MAGIC_BLUE)
				doPlayerAddExp(cid, 4000000)
				setPlayerStorageValue(cid,6094,1)
			else
				doPlayerSendTextMessage(cid,22,"You have already won their reward.")
			end
		
		-- Mintwallin Prision Quest (Bright Sword - Red Gem)	
		elseif item.uid == 6061 then
			queststatus = getPlayerStorageValue(cid,6086)
			if queststatus == -1 or queststatus == 0 or playerAccess >= 5 then
				doPlayerSendTextMessage(cid,22,"You have found a bag.")
				doSendMagicEffect(topos, CONST_ME_MAGIC_BLUE)
				box = doPlayerAddItem(cid,1987,1)
				doAddContainerItem(box,2407,1)
				doAddContainerItem(box,2156,1)
				setPlayerStorageValue(cid,6086,1)
				if os.time() > timer_actions.time1 or timer_actions.time1 == 0 then		
					timer_actions.time1 = os.time() + 60*5
					monster = {name = "Minotaur Guard", countMin = 12, countMax = 20}
					monster2 = {name = "Minotaur Archer", countMin = 8, countMax = 14}
					monster3 = {name = "Minotaur Mage", countMin = 4, countMax = 8}
					radius = 7	
					centerPos = {x=1900, y=1876, z=12}

					doMakeRespawn(monster, centerPos, radius)
					doMakeRespawn(monster2, centerPos, radius)	
					doMakeRespawn(monster3, centerPos, radius)		
					
					doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "The proteced cell has been open! Guards remove the intruders!")
				end
			else
				doPlayerSendTextMessage(cid,22,"It is empty.")
			end					
		end		
	
	else
		return 0
   	end		
		
   	return 1
end