	--[[
The Artificial Life: npc system library
Version: 0.1

	Features
		ratePrice multiplier
		Buy/Sell/Teleport/Spell modules
		Dynamic error threatment
		
	Roadmap
		Debugger Strackback (configurable tables and advanced error reporting)
		Optmization of all the functions
		Rewrite doPlayerAddMoney 
		onThink and onQueue events
		onTalk event with dynamic uses of talkstates and so on
			sub-talkstates will be sub-arrays of the main talkstate refered to it
			messages will be handled into arrays with the input and output of the NPC (message and answer subarrays)
		Function to list buying/selling items, teleport places and spells
		Study the possibility of the usage of a new "msgContains" function with tolerance (if a player write the "key" wrong, it will return the correct input)
		Promote and quest module
		Extra module to get the statitics (how much items were sold, bought, etc)
		Optmize Buy/Sell functions to accept containers with items
		Study the possibility to divide the class "NPC" into modules or events
		End the usage using a garbage collector
		Messages with delay if the lenght is too big
		Implement an interactive way for doing plugins
		Make an item list (sellable/buyable) withi filters (type of the item -> new element in array (optional): type)
		ratePrice should be later a global const for anything who uses money transaction
		
		- Extras
			Item Stock
			Promote Module
			Premium Module
			Blessing Module
			Addon Module
			
		
	Notes
		Since this script uses object orientation with a default class, there isn't reasons to make conditions considering if there is or not a value, since it will 
		always be called when executing this script. The array "NPC" is a global array that will handle with all NPC scripts and with all the functions of that class.
		
	Strucuture
		Modules (travel, shop, spell, ...)
		Auxiliar functions (functions used by all the script)
		Core (handler of all the system)
		
		
--]]

if (NPC == nil) then
	dofile('data/npc/lib/npcsystem/Shop.lua')
	dofile('data/npc/lib/npcsystem/Travel.lua')
	dofile('data/npc/lib/npcsystem/Queue.lua')
	
	NPC = 
	{
				
		-- In the future, it will be used as a debugger strackback
		-- TODO: Multilanguage system
		ERRORS =
		{
			maxCount = "Item count should be less then 100.",
			noCount = "Item count should be especified.",
			noMoney = "The player does not have enought money.",
			noItem = "Desired item not found in the buying list.",
			noPlayerItem = "The player does not have the item to sell it.",
			noPlace = "Desired place does not exists."
		}
			
	}
	
	

	-- NPC Class Instance
	function NPC:new(obj)
		obj = obj or {}
	    setmetatable(obj, self)
		self.__index = self
		return obj
	end
	
		-- Maybe 'return true, x' can be replaced by 'return x' only
		function NPC.isInArrayStr(arr, msg)
			local x, y
			for x, y in pairs(arr) do
				if (y == msg) then
					return true, x
				end
			end
			return false
		end

		-- TODO: optmize this function
		function NPC.doPlayerAddMoney(cid, amount)
			local crystals = math.floor(amount / 10000)
				amount = amount - crystals * 10000
			local platinum = math.floor(amount / 100)
				amount = amount - platinum * 100
				
			local gold, ret = amount, 0
			
			if (crystals > 0) then
				ret = doPlayerAddItem(cid, ITEM_CRYSTAL_COIN, crystals)
				if (ret ~= LUA_NO_ERROR) then
					return LUA_ERROR
				end
			end
			
			if (platinum > 0) then
				ret = doPlayerAddItem(cid, ITEM_PLATINUM_COIN, platinum)
				if (ret ~= LUA_NO_ERROR) then
					return LUA_ERROR
				end
			end
			if (gold > 0) then
				ret = doPlayerAddItem(cid, ITEM_GOLD_COIN, gold)
				if (ret ~= LUA_NO_ERROR) then
					return LUA_ERROR
				end
			end
			return LUA_NO_ERROR
		end			
		
		function NPC:Buy(cid, itemName, count, array)
			-- Maybe should be moved into the main scope in the future
			if (array ~= nil) then
				item = self.BUY_LIST[itemName]
			else	
				item = array[itemName]
			end
			local totalCount, totalPrice = item.count + count, (item.price * count) * self.ratePrice 
			if (item ~= nil) then
				if (doPlayerRemoveMoney(cid, totalPrice) == TRUE) then
					if (item.count ~= nil) then
						if (totalCount <= 100) then
							-- TODO: Support to charges and counts separately
							doPlayerAddItem(cid, item.id, totalCount)
							doPlayerRemoveMoney(cid, totalPrice)
							return TRUE
						else
							return self.ERRORS.maxCount
						end
					else
						return self.ERRORS.noCount
					end
				else
					return self.ERRORS.noMoney
				end
			else
				return self.ERRORS.noItem
				--[[ for i = array[1], #array do
					return i.name .. i.price .. i.count
				end --]]
			end
		end
		
		-- TODO: NPC:getItemList(table) -> SELL_LIST / BUY_LIST
		function NPC:getBuyable()
			buyList = {}
			for a, b in pairs(self.BUY_LIST) do
				buyList:append(b)
			end
			return buyList
		end
						
		function NPC:Sell(cid, itemName, count, array)
			-- Maybe should be moved into the main scope in the future
			if (array ~= nil) then
				item = self.SELL_LIST[itemName]
			else	
				item = array[itemName]
			end
			local totalCount, totalPrice = item.count + count, (item.price * count) * self.ratePrice 
			if (item ~= nil) then
				if (getPlayerItemCount(cid) >= count) then
					if (item.count ~= nil) then
						if (totalCount <= 100) then
							doPlayerRemoveItem(cid, item.id, totalCount)
							self.doPlayerAddMoney(cid, totalPrice)
							return TRUE
						else
							return self.ERRORS.maxCount
						end
					else
						return self.ERRORS.noCount
					end
				else
					return self.ERRORS.noPlayerItem
				end
			else
				return self.ERRORS.noItem
				--[[ for i = array[1], #array do
					return i.name .. i.price .. i.count
				end --]]
			end
		end
		
		-- TODO: NPC:getItemList(table) -> SELL_LIST / BUY_LIST
		function NPC:getSellable()
			sellList = {}
			for a, b in pairs(self.SELL_LIST) do
				sellList:append(b)
			end
			return sellList
		end
		
		-- It will checks if the desired item is in some kind of list
		function NPC:checkItem(table, itemid)
		end
			
		function NPC:doPlayerLearnSpell(cid, spellName, array)
			if (array ~= nil) then
				spell = self.SPELL_LIST[spellName]
			else	
				spell = array[spellName]
			end
			if (spell ~= nil) then
				if (getPlayerLearnedInstantSpell(cid, spellName) == TRUE) then
					return self.ERRORS.alreadyLearned
				elseif (spell.level > getPlayerLevel(cid)) then
					return self.ERRORS.noLevel
				elseif (spell.maglevel > getPlayerMagLevel(cid)) then
					return self.ERRORS.noMagLevel
				elseif (canPlayerLearnInstantSpell(cid, spellName) == FALSE) then
					return self.ERRORS.noVocation
				elseif (doPlayerRemoveMoney(cid, spell.price == TRUE)) then
					playerLearnInstantSpell(cid, spellName)
				else
					return self.ERRORS.unknown
				end
			else
				return self.ERRORS.noSpell
			end
		end	
		
		function NPC:getSpells()
		end

		-- Incomplete
		function NPC:onSay(msg, delay)
			if (msg ~= nil) then
				if (delay > 0) then
					-- Incomplete
				else
					selfSay(msg)
				end
			end
		end
		
		-- Incomplete
		local messages = 
		{
			[talkstate] = {message = {}, answers = {}}
		}
		
		function NPC:onTalk(msg, msgArray)
			-- Incomplete
		end	
		
		-- Maybe this is not necessary
		function NPC:addKeyWord(messageArray, message)
			table.insert(messageArray[talkstate], message)
		end
		
		function NPC:onThink()
			-- Incomplete
		end
		
		function NPC:addFocus()
		end
		
		function NPC:messageHandler()
		end
end
