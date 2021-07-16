if (Shop == nil) then
	Shop = 
	{
		ratePrice = 1, 
		
		-- This arrays are used only if not declared in the script, it will be always global values (access by the global table [_G])
		BUY_LIST =
		{
			["item_name"] = {id = , price = , count = }
		},
		
		SELL_LIST =
		{
			["item_name"] = {id = , price = , count = }
		}
		
		-- In the future, it will be used as a debugger strackback
		-- TODO: Multilanguage system
		-- each const will be table with other values
		ERRORS =
		{
			maxCount = "Item count should be less then 100.",
			noCount = "Item count should be especified.",
			noMoney = "You do not have enough money. Maybe next time.",
			noItemOnSale = "Sorry, but the item that you are looking for it isn't on sale.",
			noItemBuyable = "Sorry, but i do not buy that item.",
			noPlayerItem = "You do not have that item. Ae you trying to cheat me?",
		}
			
	}

	-- Shop Module Instance
	function Shop:new(obj)
		obj = obj or {}
	    setmetatable(obj, self)
		self.__index = self
		return obj
	end
	
		function getItemList(table)
			list = {}
			for a, b in pairs(table) do
				list:append(b)
			end
			return list
		end
		
		-- It will checks if the desired item is in some kind of list
		function Shop:checkItem(table, name)
			if (table[name] ~= nil) then
				return true
			end
			return false
		end
			
		function Shop:Buy(cid, itemName, count, array)
			-- Maybe should be moved into the main scope in the future
			if (array == nil) then
				item, shopTable = self.BUY_LIST[itemName], BUY_LIST
			else	
				item, shopTable = array[itemName], array
			end
			local totalCount, totalPrice = item.count + count, (item.price * count) * self.ratePrice 
			if (self:checkTravel(shopTable, itemName)) then			
				if (doPlayerRemoveMoney(cid, totalPrice) == TRUE) then
					if (item.count ~= nil) then
						-- maybe that condition it isn't necessary, but we will have to do somethings later
						if (totalCount <= 100) then
							-- TODO: Support to charges and counts separately
							doPlayerAddItem(cid, item.id, totalCount)
							doPlayerRemoveMoney(cid, totalPrice)
							return TRUE
						else
							return self.ERRORS.maxCount
						end
					else
						-- TODO: if count not espeficied, use count = 1
						return self.ERRORS.noCount
					end
				else
					return self.ERRORS.noMoney
				end
			else
				return self.ERRORS.noItemOnSale
				--[[ for i = array[1], #array do
					return i.name .. i.price .. i.count
				end --]]
			end
		end
						
		function Shop:Sell(cid, itemName, count, array)
			-- Maybe should be moved into the main scope in the future
			if (array == nil) then
				item, shopTable = self.SELL_LIST[itemName], SELL_LIST
			else	
				item, shopTable = array[itemName], array
			end
			local totalCount, totalPrice = item.count + count, (item.price * count) * self.ratePrice 
			if (self:checkTravel(shopTable, itemName)) then			
				if (getPlayerItemCount(cid) >= count) then
					if (item.count ~= nil) then
						-- TODO: remove maxCount. This will need a function to remove itens in deep search mode (if doPlayerRemoveItem does not do that already)
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
				return self.ERRORS.noItemBuyable
				--[[ for i = array[1], #array do
					return i.name .. i.price .. i.count
				end --]]
			end
		end
end
