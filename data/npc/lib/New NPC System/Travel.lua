if (Travel == nil) then
	Travel = 
	{
		ratePrice = 1, 
		
		-- This arrays are used only if not declared in the script, it will be always global values (access by the global table [_G])
		TRAVEL_LIST =
		{
			["city_name"] = {price = 100, pos = {x = 100, y = 100, z = 7}, premium = false}
		}
		
		-- In the future, it will be used as a debugger strackback
		-- TODO: Multilanguage system
		-- each const will be table with other values
		ERRORS =
		{
			noMoney = "You do not have enough money to use my services.",
			noPlace = "I do not have this route to you travel for. Maybe next time."
			onlyPremium = "My apologies, but only premium account players can use my services."
		}
			
	}

	-- Shop Module Instance
	function Travel:new(obj)
		obj = obj or {}
	    setmetatable(obj, self)
		self.__index = self
		return obj
	end
	
		function Travel:getTravelList(table)
			list = {}
			for a, b in pairs(table) do
				list:append(b)
			end
			return list
		end
		
		-- It will checks if the desired place is in some kind of list (returns true if exists)
		function Travel:checkTravel(table, name)
			if (table[name] ~= nil) then
				return true
			end
			return false
		end
		
		function Travel:doTravel(cid, place, array)
			if (array == nil) then
				travelPlace, travelTable = self.TRAVEL_LIST[place], TRAVEL_LIST
			else
				travelPlace, travelTable = array[place], array
			end
			if (self:checkTravel(travelTable, place)) then				
				if (doPlayerRemoveMoney(cid, travelPlace.price) == TRUE) then
					if (travelPlace.premium) then
						if (isPremium(cid) == TRUE) then
							doTeleportThing(cid, travelPlace.pos, FALSE)
						else
							return self.ERRORS.onlyPremium
						end
					else
						doTeleportThing(cid, travelPlace.pos, FALSE)
					end
				else
					return self.ERRORS.noMoney
				end
			else
				return self.ERRORS.noPlace
			end
		end
				
end
