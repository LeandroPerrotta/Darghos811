function string.explode(str, delimiter)
	if str == nil then
		return {}
	end
	t = {}
	for v in string.gmatch(str, "([^,]*)" .. delimiter .. "?") do
		table.insert(t, v)
	end
	table.remove(t) -- Removes last element (Always "")
	return t
end

function string.strip_whitespace(str)
	if str == nil then return str end
	local start = string.find(str, "[^%s]") -- First non-whitespace character
	local _end = #str + 1 - string.find(str:reverse(), "[^%s]") -- Last non-whitespace character
	
	if start ~= nil and _end ~= nil then
		return string.sub(str, start, _end)
	elseif start ~= nil then
		return string.sub(str, start)
	elseif _end ~= nil then
		return string.sub(str, 1, _end)
	end
	return str
end

function doPlayerGiveItem(cid, itemid, count, charges)
	local hasCharges = (isItemRune(itemid) == TRUE or isItemFluidContainer(itemid) == TRUE)
	if(hasCharges and charges == nil) then
		charges = 1
	end
	while count > 0 do
		local tempcount = 1
		if(hasCharges) then
			tempcount = charges
		end
		if(isItemStackable(itemid) == TRUE) then
			tempcount = math.min (100, count)
   		end
	   	local ret = doPlayerAddItem(cid, itemid, tempcount)
	   	if(ret == LUA_ERROR) then
			ret = doCreateItem(itemid, tempcount, getPlayerPosition(cid))
		end
		if(ret ~= LUA_ERROR) then
			if(hasCharges) then
				count = count - 1
			else
				count = count - tempcount
			end
		else
			return LUA_ERROR
		end
	end
	return LUA_NO_ERROR
end

function doPlayerTakeItem(cid, itemid, count)
	if(getPlayerItemCount(cid,itemid) >= count) then
		while count > 0 do
			local tempcount = 0
			if(isItemStackable(itemid) == TRUE) then
				tempcount = math.min (100, count)
			else
				tempcount = 1
			end
			local ret = doPlayerRemoveItem(cid, itemid, tempcount)
			if(ret ~= LUA_ERROR) then
				count = count-tempcount
			else
				return LUA_ERROR
			end
		end
		if(count == 0) then
			return LUA_NO_ERROR
		end
	else
		return LUA_ERROR
	end
end

function doPlayerAddMoney(cid, amount)
	local crystals = math.floor(amount/10000)
	amount = amount - crystals*10000
	local platinum = math.floor(amount/100)
	amount = amount - platinum*100
	local gold = amount
	local ret = 0
	if(crystals > 0) then
		ret = doPlayerGiveItem(cid, ITEM_CRYSTAL_COIN, crystals)
		if(ret ~= LUA_NO_ERROR) then
			return LUA_ERROR
		end
	end
	if(platinum > 0) then
		ret = doPlayerGiveItem(cid, ITEM_PLATINUM_COIN, platinum)
		if(ret ~= LUA_NO_ERROR) then
			return LUA_ERROR
		end
	end
	if(gold > 0) then
		ret = doPlayerGiveItem(cid, ITEM_GOLD_COIN, gold)
		if(ret ~= LUA_NO_ERROR) then
			return LUA_ERROR
		end
	end
	return LUA_NO_ERROR
end

function doPlayerBuyItem(cid, itemid, count, cost, charges)
    if(type(itemid) == "table") then
	cost = cost
	end
	    if(doPlayerRemoveMoney(cid, cost) == TRUE) then
			if(type(itemid) == "table") then
			y = 0
			while y < count do
			bp = doPlayerAddItem(cid, itemid[1], 1)
			x = 0
			
			while x < itemid[4] do
				doAddContainerItem(bp, itemid[2], itemid[3])
				x = x + 1
			end
			y = y + 1
			end
			return LUA_NO_ERROR
		else
	    	return doPlayerGiveItem(cid, itemid, count, charges)
		end
    else
        return LUA_ERROR
    end
end

function doPlayerSellItem(cid, itemid, count, cost)
	if(doPlayerTakeItem(cid, itemid, count) == LUA_NO_ERROR) then
		if(doPlayerAddMoney(cid, cost) ~= LUA_NO_ERROR) then
			error('Could not add money to ' .. getPlayerName(cid) .. '(' .. cost .. 'gp)')
		end
		return LUA_NO_ERROR
	end
	return LUA_ERROR
end

function isInRange(pos, fromPos, toPos)
	if pos.x >= fromPos.x and pos.y >= fromPos.y and pos.z >= fromPos.z and pos.x <= toPos.x and pos.y <= toPos.y and pos.z <= toPos.z then
		return TRUE
	end
	return FALSE
end

function isPremium(cid)
	if isPlayer(cid) == TRUE and getPlayerPremiumDays(cid) > 0 then
		return TRUE
	end
	return FALSE
end

function rows(connection, sql_statement)
	local cursor = assert(connection:execute(sql_statement))
	return function ()
		return cursor:fetch()
	end
end

function getMonthDayEnding(day)
	if day == "01" or day == "21" or day == "31" then
		return "st"
	elseif day == "02" or day == "22" then
		return "nd"
	elseif day == "03" or day == "23" then
		return "rd"
	else
		return "th"
	end
end

function getMonthString(m)
	return os.date("%B", os.time{year = 1970, month = m, day = 1})
end

function getArticle(str)
	return str:find("[AaEeIiOoUuYy]") == 1 and "an" or "a"
end

function getDistanceBetween(firstPosition, secondPosition)
	local xDif = math.abs(firstPosition.x - secondPosition.x)
	local yDif = math.abs(firstPosition.y - secondPosition.y)

	local posDif = math.max(xDif, yDif)
	if(firstPosition.z ~= secondPosition.z) then
		posDif = posDif + 9 + 6
	end
	return posDif
end

function doPlayerAddAddons(cid, addon)
	for i = 0, table.maxn(maleOutfits) do
		doPlayerAddOutfit(cid, maleOutfits[i], addon)
	end

	for i = 0, table.maxn(femaleOutfits) do
		doPlayerAddOutfit(cid, femaleOutfits[i], addon)
	end
end

function numRows(cursor)
	local row = cursor:fetch()
	local rows = 0
	while row do
		rows = rows + 1
		row = cursor:fetch()
	end
	cursor:close()
	return rows
end

function isSorcerer(cid)
	if(isPlayer(cid) == FALSE) then
		debugPrint("isSorcerer: Player not found.")
		return false
	end

	return (isInArray({1,5}, getPlayerVocation(cid)) == TRUE)
end

function isDruid(cid)
	if(isPlayer(cid) == FALSE) then
		debugPrint("isDruid: Player not found.")
		return false
	end

	return (isInArray({2,6}, getPlayerVocation(cid)) == TRUE)
end

function isPaladin(cid)
	if(isPlayer(cid) == FALSE) then
		debugPrint("isPaladin: Player not found.")
		return false
	end

	return (isInArray({3,7}, getPlayerVocation(cid)) == TRUE)
end

function isKnight(cid)
	if(isPlayer(cid) == FALSE) then
		debugPrint("isKnight: Player not found.")
		return false
	end

	return (isInArray({4,8}, getPlayerVocation(cid)) == TRUE)
end

-- Dynamic quest maker functions
		-- TODO: add contidition -> getContainerCap(bp)-getContainerSize(bp) 
		Quest = {}

		function Quest:doQuest(uid, itemid, count, exp, storage, p)
			local queststatus = getPlayerStorageValue(uid, storage)
			local playerweigh = getPlayerFreeCap(uid)	
			
			if (type(itemid) == 'table') then
				if (queststatus == -1) then
					local containerweigh = self:getContainerWeight(uid, itemid, count, 0)
					if (containerweigh < playerweigh) then
						self:doPlayerGivePrize(uid, itemid, count, 0)
						if (exp > 0) then
							doPlayerAddExp(uid,exp)
						end
						setPlayerStorageValue(uid, storage, 1)
						return TRUE
					else
						return FALSE, "It is too heavy."
					end
				else
					return FALSE, "It is empty." 
				end
			else	
				if (queststatus == -1) then
					if (playerweigh >= itemweigh) then
						doPlayerAddItem(uid, itemid, count)
						if (exp > 0) then
							doPlayerAddExp(uid,exp)
						end
						setPlayerStorageValue(uid, storage, 1)
						return TRUE
					else
						return FALSE, "It is too heavy."
					end
				else
					return FALSE, "It is empty." 
				end
			end
			return FALSE
		end

		function Quest:doPlayerGivePrize(uid, itens, counts, cnt)
			local container = 0
			local tmp1, tmp2
			
			if (cnt == 0) then
				container = doPlayerAddItem(uid,itens.container,1)
			else
				if (itens.container ~= nil) then
					container = doAddContainerItem(cnt,itens.container,1)
				end
			end
			
			if (type(counts) ~= 'table') then
				counts = {}
			end
			
			for tmp1 = 1, #itens do
				if (type(itens[tmp1]) == 'number') then
					if ((counts[tmp1] == nil) or (counts[tmp1] < 0)) then
						counts[tmp1] = 1
					end
					doAddContainerItem(container, itens[tmp1], counts[tmp1])
				else
					if ((type(counts[tmp1]) == 'number') or (counts[tmp1] == nil)) then
						counts[tmp1] = {}
					end
					self:doPlayerGivePrize(uid, itens[tmp1], counts[tmp1], container)
				end
			end
		end

		function Quest:getContainerWeight(uid,itens,counts,cnt)
			local tmp1, tmp2
			
			if (cnt == nil) then
				cnt = 0
			end
			
			cnt = cnt + getItemWeight(itens.container, 1)
			
			local tmp1,tmp2
			if (type(counts) ~= 'table') then
				local counts = {}
			end
			
			for tmp1 = 1, #itens do
				if (type(itens[tmp1]) == 'number') then
					if (counts[tmp1] == nil or counts[tmp1] < 0) then
						counts[tmp1] = 1
					end
					cnt = cnt + getItemWeight(itens[tmp1], counts[tmp1])
				else
					if ((type(counts[tmp1]) == 'number') or (counts[tmp1] == nil)) then
						counts[tmp1] = {}
					end
					cnt = cnt + self:getContainerWeight(uid, itens[tmp1], counts[tmp1], cnt)
				end
			end
			return cnt
		end
		
				function doEventCallBack(param)
			if (type(param.func) == 'function') then
				param.func(unpack(param))
			end
		end

		function addArrayEvent(functions, delays, params)
			if ((type(functions) ~= 'table') or (type(delays) ~= 'table') or (type(params) ~= 'table')) then
				debug('All parameters need to be arrays.')
				return FALSE
			end
			local count = math.max(#functions, math.max(#delays, #params))
			local tmp, last_function, last_delay, last_param, eventid, delay_tmp
			local EventIds = {}
			for tmp = 1, count do
				eventid = addEvent(functions[tmp] or last_function, delays[tmp] or last_delay, params[tmp] or last_param)
				table.insert(EventIds, eventid)
				last_function = functions[tmp] or last_function
				if (delays[tmp] ~= nil ) then
					last_delay = delays[tmp]
					delay_tmp = delays[tmp]
				else
					last_delay = last_delay + delay_tmp
				end
				last_param = params[tmp] or last_param
			end
			return EventIds
		end

		function doCombatEvent(param)
			if (isCreature(param.caster) == TRUE) then
				if (param.var ~= nil) then
					doCombat(param.caster, param.combat, param.var)
				elseif (param.target ~= nil) then
					if (isCreature(param.target) == TRUE) then
						doCombat(param.caster, param.combat, numberToVariant(param.target))
					end
				elseif (param.pos ~= nil) then
					doCombat(param.caster, param.combat, positionToVariant(param.pos))
				elseif (param.string ~= nil) then
					doCombat(param.caster, param.combat, stringToVariant(param.string))
				else
					debug('Parameter missing.')
				end
			end
		end
		
