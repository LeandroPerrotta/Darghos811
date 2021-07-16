local greatHealthPot = 7591
local greatManaPot = 7590
local strongHealthPot = 7588
local strongManaPot = 7589
local healthPot = 7618
local manaPot = 7620
local greatEmptyPot = 7635
local strongEmptyPot = 7634
local emptyPot = 7636
local greatSpirit = 8376
local ultimatePot = 8377

function onUse(cid, item, fromPosition, itemEx, toPosition)
	if itemEx.uid ~= cid or itemEx.itemid ~= 1 then
		return TRUE
	end

	if(item.itemid == healthPot) then
		if(doTargetCombatHealth(0, cid, COMBAT_HEALING, 130, 170, CONST_ME_MAGIC_BLUE) == LUA_ERROR) then
			return FALSE
		end
		doCreatureSay(cid, "Aaaah...", TALKTYPE_ORANGE_1)
		doTransformItem(item.uid, emptyPot)

	elseif(item.itemid == manaPot) then
		if(doTargetCombatMana(0, cid, 70, 130, CONST_ME_MAGIC_BLUE) == LUA_ERROR) then
			return FALSE
		end
		doCreatureSay(cid, "Aaaah...", TALKTYPE_ORANGE_1)
		doTransformItem(item.uid, emptyPot)

	elseif(item.itemid == strongHealthPot) then
		if (not(isKnight(cid) or isPaladin(cid)) or (getPlayerLevel(cid) < 50)) and not(getPlayerGroupId(cid) >= 3) then
			doCreatureSay(cid, "This potion can only be consumed by paladins and knights of level 50 or higher.", TALKTYPE_ORANGE_1)
			return TRUE
		end

		if(doTargetCombatHealth(0, cid, COMBAT_HEALING, 320, 380, CONST_ME_MAGIC_BLUE) == LUA_ERROR) then
			return FALSE
		end
		doCreatureSay(cid, "Aaaah...", TALKTYPE_ORANGE_1)
		doTransformItem(item.uid, strongEmptyPot)

	elseif(item.itemid == strongManaPot) then
		if (not(isSorcerer(cid) or isDruid(cid) or isPaladin(cid)) or (getPlayerLevel(cid) < 50)) and not(getPlayerGroupId(cid) >= 3) then
			doCreatureSay(cid, "This potion can only be consumed by sorcerers, druids and paladins of level 50 or higher.", TALKTYPE_ORANGE_1)
			return TRUE
		end

		if(doTargetCombatMana(0, cid, 110, 190, CONST_ME_MAGIC_BLUE) == LUA_ERROR) then
			return FALSE
		end
		doCreatureSay(cid, "Aaaah...", TALKTYPE_ORANGE_1)
		doTransformItem(item.uid, strongEmptyPot)

	elseif(item.itemid == greatHealthPot) then
		if (not(isKnight(cid)) or (getPlayerLevel(cid) < 80)) and not(getPlayerGroupId(cid) >= 3) then
			doCreatureSay(cid, "This potion can only be consumed by knights of level 80 or higher.", TALKTYPE_ORANGE_1)
			return TRUE
		end

		if(doTargetCombatHealth(0, cid, COMBAT_HEALING, 590, 790, CONST_ME_MAGIC_BLUE) == LUA_ERROR) then
			return FALSE
		end
		doCreatureSay(cid, "Aaaah...", TALKTYPE_ORANGE_1)
		doTransformItem(item.uid, greatEmptyPot)

	elseif(item.itemid == greatManaPot) then
		if (not(isSorcerer(cid) or isDruid(cid)) or (getPlayerLevel(cid) < 80)) and not(getPlayerGroupId(cid) >= 3) then
			doCreatureSay(cid, "This potion can only be consumed by sorcerers and druids of level 80 or higher.", TALKTYPE_ORANGE_1)
			return TRUE
		end

		if(doTargetCombatMana(0, cid, 200, 350, CONST_ME_MAGIC_BLUE) == LUA_ERROR) then
			return FALSE
		end
		doCreatureSay(cid, "Aaaah...", TALKTYPE_ORANGE_1)
		doTransformItem(item.uid, greatEmptyPot)
		
	elseif(item.itemid == greatSpirit) then
		if (not(isPaladin(cid)) or (getPlayerLevel(cid) < 80)) and not(getPlayerGroupId(cid) >= 3) then
			doCreatureSay(cid, "This potion can only be consumed by paladins of level 80 or higher.", TALKTYPE_ORANGE_1)
			return TRUE
		end

		if(doTargetCombatMana(0, cid, 120, 170, CONST_ME_MAGIC_BLUE) == LUA_ERROR) then
			return FALSE
		end
		
		if(doTargetCombatHealth(0, cid, COMBAT_HEALING, 270, 380, CONST_ME_MAGIC_BLUE) == LUA_ERROR) then
			return FALSE
		end
		doCreatureSay(cid, "Aaaah...", TALKTYPE_ORANGE_1)
		doTransformItem(item.uid, greatEmptyPot)
		
	elseif(item.itemid == ultimatePot) then
		if (not(isKnight(cid)) or (getPlayerLevel(cid) < 130)) and not(getPlayerGroupId(cid) >= 3) then
			doCreatureSay(cid, "This potion can only be consumed by knights of level 130 or higher.", TALKTYPE_ORANGE_1)
			return TRUE
		end

		if(doTargetCombatHealth(0, cid, COMBAT_HEALING, 870,1400, CONST_ME_MAGIC_BLUE) == LUA_ERROR) then
			return FALSE
		end
		doCreatureSay(cid, "Aaaah...", TALKTYPE_ORANGE_1)
		doTransformItem(item.uid, greatEmptyPot)

	end

	return TRUE
end