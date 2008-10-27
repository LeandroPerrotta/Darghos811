TRUE = 1
FALSE = 0

LUA_ERROR = -1
LUA_NO_ERROR = 0

NORTH = 0
EAST = 1
SOUTH = 2
WEST = 3
SOUTHWEST = 4
SOUTHEAST = 5
NORTHWEST = 6
NORTHEAST = 7

COMBAT_FORMULA_UNDEFINED = 0
COMBAT_FORMULA_LEVELMAGIC = 1
COMBAT_FORMULA_SKILL = 2
COMBAT_FORMULA_DAMAGE = 3

CONDITION_PARAM_OWNER = 1
CONDITION_PARAM_TICKS = 2
CONDITION_PARAM_OUTFIT = 3
CONDITION_PARAM_HEALTHGAIN = 4
CONDITION_PARAM_HEALTHTICKS = 5
CONDITION_PARAM_MANAGAIN = 6
CONDITION_PARAM_MANATICKS = 7
CONDITION_PARAM_DELAYED = 8
CONDITION_PARAM_SPEED = 9
CONDITION_PARAM_LIGHT_LEVEL = 10
CONDITION_PARAM_LIGHT_COLOR = 11
CONDITION_PARAM_SOULGAIN = 12
CONDITION_PARAM_SOULTICKS = 13
CONDITION_PARAM_MINVALUE = 14
CONDITION_PARAM_MAXVALUE = 15
CONDITION_PARAM_STARTVALUE = 16
CONDITION_PARAM_TICKINTERVAL = 17
CONDITION_PARAM_FORCEUPDATE = 18
CONDITION_PARAM_SKILL_MELEE = 19
CONDITION_PARAM_SKILL_FIST = 20
CONDITION_PARAM_SKILL_CLUB = 21
CONDITION_PARAM_SKILL_SWORD = 22
CONDITION_PARAM_SKILL_AXE = 23
CONDITION_PARAM_SKILL_DISTANCE = 24
CONDITION_PARAM_SKILL_SHIELD = 25
CONDITION_PARAM_SKILL_FISHING = 26
CONDITION_PARAM_STAT_MAXHITPOINTS = 27
CONDITION_PARAM_STAT_MAXMANAPOINTS = 28
CONDITION_PARAM_STAT_SOULPOINTS = 29
CONDITION_PARAM_STAT_MAGICPOINTS = 30
CONDITION_PARAM_STAT_MAXHITPOINTSPERCENT = 31
CONDITION_PARAM_STAT_MAXMANAPOINTSPERCENT = 32
CONDITION_PARAM_STAT_SOULPOINTSPERCENT = 33
CONDITION_PARAM_STAT_MAGICPOINTSPERCENT = 34
CONDITION_PARAM_PERIODICDAMAGE = 35

COMBAT_PARAM_TYPE = 1
COMBAT_PARAM_EFFECT = 2
COMBAT_PARAM_DISTANCEEFFECT = 3
COMBAT_PARAM_BLOCKSHIELD = 4
COMBAT_PARAM_BLOCKARMOR = 5
COMBAT_PARAM_TARGETCASTERORTOPMOST = 6
COMBAT_PARAM_CREATEITEM = 7
COMBAT_PARAM_AGGRESSIVE = 8
COMBAT_PARAM_DISPEL = 9

CALLBACK_PARAM_LEVELMAGICVALUE = 1
CALLBACK_PARAM_SKILLVALUE = 2
CALLBACK_PARAM_TARGETTILE = 3
CALLBACK_PARAM_TARGETCREATURE = 4

COMBAT_NONE = 0
COMBAT_PHYSICALDAMAGE = 1
COMBAT_ENERGYDAMAGE = 2
COMBAT_EARTHDAMAGE = 4
COMBAT_POISONDAMAGE = 4
COMBAT_FIREDAMAGE = 8
COMBAT_UNDEFINEDDAMAGE = 16
COMBAT_LIFEDRAIN = 32
COMBAT_MANADRAIN = 64
COMBAT_HEALING = 128
COMBAT_DROWNDAMAGE = 256
COMBAT_ICEDAMAGE = 512
COMBAT_HOLYDAMAGE = 1024
COMBAT_DEATHDAMAGE = 2048

CONDITION_NONE = 0
CONDITION_POISON = 1
CONDITION_FIRE = 2
CONDITION_ENERGY = 4
CONDITION_LIFEDRAIN = 8
CONDITION_HASTE = 16
CONDITION_PARALYZE = 32
CONDITION_OUTFIT = 64
CONDITION_INVISIBLE = 128
CONDITION_LIGHT = 256
CONDITION_MANASHIELD = 512
CONDITION_INFIGHT = 1024
CONDITION_DRUNK = 2048
CONDITION_EXHAUSTED = 4096
CONDITION_FOOD = 8192
CONDITION_REGENERATION = 8192
CONDITION_SOUL = 16384
CONDITION_DROWN = 32768
CONDITION_MUTED = 65536
CONDITION_TRADETICKS = 131072
CONDITION_YELLTICKS = 262144
CONDITION_ATTRIBUTES = 524288
CONDITION_FREEZING = 1048576
CONDITION_DAZZLED = 2097152
CONDITION_CURSED = 4194304

CONST_SLOT_HEAD = 1
CONST_SLOT_NECKLACE = 2
CONST_SLOT_BACKPACK = 3
CONST_SLOT_ARMOR = 4
CONST_SLOT_RIGHT = 5
CONST_SLOT_LEFT = 6
CONST_SLOT_LEGS = 7
CONST_SLOT_FEET = 8
CONST_SLOT_RING = 9
CONST_SLOT_AMMO = 10

CONST_ME_DRAWBLOOD = 0
CONST_ME_LOSEENERGY = 1
CONST_ME_POFF = 2
CONST_ME_BLOCKHIT = 3
CONST_ME_EXPLOSIONAREA = 4
CONST_ME_EXPLOSIONHIT = 5
CONST_ME_FIREAREA = 6
CONST_ME_YELLOW_RINGS = 7
CONST_ME_GREEN_RINGS = 8
CONST_ME_HITAREA = 9
CONST_ME_TELEPORT = 10
CONST_ME_ENERGYHIT = 11
CONST_ME_MAGIC_BLUE = 12
CONST_ME_MAGIC_RED = 13
CONST_ME_MAGIC_GREEN = 14
CONST_ME_HITBYFIRE = 15
CONST_ME_HITBYPOISON = 16
CONST_ME_MORTAREA = 17
CONST_ME_SOUND_GREEN = 18
CONST_ME_SOUND_RED = 19
CONST_ME_POISONAREA = 20
CONST_ME_SOUND_YELLOW = 21
CONST_ME_SOUND_PURPLE = 22
CONST_ME_SOUND_BLUE = 23
CONST_ME_SOUND_WHITE = 24
CONST_ME_BUBBLES = 25
CONST_ME_CRAPS = 26
CONST_ME_GIFT_WRAPS = 27
CONST_ME_FIREWORK_YELLOW = 28
CONST_ME_FIREWORK_RED = 29
CONST_ME_FIREWORK_BLUE = 30
CONST_ME_STUN = 31
CONST_ME_SLEEP = 32
CONST_ME_WATERCREATURE = 33
CONST_ME_GROUNDSHAKER = 34
CONST_ME_HEARTS = 35
CONST_ME_FIREATTACK = 36
CONST_ME_ENERGYAREA = 37
CONST_ME_SMALLCLOUDS = 38
CONST_ME_HOLYDAMAGE = 39
CONST_ME_BIGCLOUDS = 40
CONST_ME_ICEAREA = 41
CONST_ME_ICETORNADO = 42
CONST_ME_ICEATTACK = 43
CONST_ME_STONES = 44
CONST_ME_SMALLPLANTS = 45
CONST_ME_CARNIPHILA = 46
CONST_ME_PURPLEENERGY = 47
CONST_ME_YELLOWENERGY = 48
CONST_ME_HOLYAREA = 49
CONST_ME_BIGPLANTS = 50
CONST_ME_CAKE = 51
CONST_ME_GIANTICE = 52
CONST_ME_WATERSPLASH = 53
CONST_ME_PLANTATTACK = 54
CONST_ME_NONE = 255

CONST_ANI_SPEAR = 0
CONST_ANI_BOLT = 1
CONST_ANI_ARROW = 2
CONST_ANI_FIRE = 3
CONST_ANI_ENERGY = 4
CONST_ANI_POISONARROW = 5
CONST_ANI_BURSTARROW = 6
CONST_ANI_THROWINGSTAR = 7
CONST_ANI_THROWINGKNIFE = 8
CONST_ANI_SMALLSTONE = 9
CONST_ANI_DEATH = 10
CONST_ANI_LARGEROCK = 11
CONST_ANI_SNOWBALL = 12
CONST_ANI_POWERBOLT = 13
CONST_ANI_POISON = 14
CONST_ANI_INFERNALBOLT = 15
CONST_ANI_HUNTINGSPEAR = 16
CONST_ANI_ENCHANTEDSPEAR = 17
CONST_ANI_REDSTAR = 18
CONST_ANI_GREENSTAR = 19
CONST_ANI_ROYALSPEAR = 20
CONST_ANI_SNIPERARROW = 21
CONST_ANI_ONYXARROW = 22
CONST_ANI_PIERCINGBOLT = 23
CONST_ANI_WHIRLWINDSWORD = 24
CONST_ANI_WHIRLWINDAXE = 25
CONST_ANI_WHIRLWINDCLUB = 26
CONST_ANI_ETHEREALSPEAR = 27
CONST_ANI_ICE = 28
CONST_ANI_EARTH = 29
CONST_ANI_HOLY = 30
CONST_ANI_SUDDENDEATH = 31
CONST_ANI_FLASHARROW = 32
CONST_ANI_FLAMMINGARROW = 33
CONST_ANI_SHIVERARROW = 34
CONST_ANI_ENERGYBALL = 35
CONST_ANI_SMALLICE = 36
CONST_ANI_SMALLHOLY = 37
CONST_ANI_SMALLEARTH = 38
CONST_ANI_EARTHARROW = 39
CONST_ANI_EXPLOSION = 40
CONST_ANI_CAKE = 41
CONST_ANI_WEAPONTYPE = 254
CONST_ANI_NONE = 255

TALKTYPE_SAY  = 1
TALKTYPE_WHISPER = 2
TALKTYPE_YELL = 3
TALKTYPE_PRIVATE = 4
TALKTYPE_CHANNEL_Y = 5
TALKTYPE_BROADCAST = 9
TALKTYPE_CHANNEL_R1 = 10
TALKTYPE_PRIVATE_RED = 11
TALKTYPE_CHANNEL_O = 12
TALKTYPE_CHANNEL_R2 = 14
TALKTYPE_ORANGE_1 = 16
TALKTYPE_ORANGE_2 = 17

MESSAGE_STATUS_CONSOLE_YELLOW = 1
MESSAGE_STATUS_CONSOLE_LBLUE = 4
MESSAGE_STATUS_CONSOLE_ORANGE = 17
MESSAGE_STATUS_WARNING = 18
MESSAGE_EVENT_ADVANCE = 19
MESSAGE_EVENT_DEFAULT = 20
MESSAGE_STATUS_DEFAULT = 21
MESSAGE_INFO_DESCR = 22
MESSAGE_STATUS_SMALL = 23
MESSAGE_STATUS_CONSOLE_BLUE = 24
MESSAGE_STATUS_CONSOLE_RED  = 25

TEXTCOLOR_BLUE = 5
TEXTCOLOR_LIGHTBLUE = 35
TEXTCOLOR_LIGHTGREEN = 30
TEXTCOLOR_TEAL = 65
TEXTCOLOR_PURPLE = 83
TEXTCOLOR_PLATINUMBLUE = 89
TEXTCOLOR_LIGHTGREY = 129
TEXTCOLOR_DARKRED = 144
TEXTCOLOR_RED = 180
TEXTCOLOR_ORANGE = 198
TEXTCOLOR_YELLOW = 210
TEXTCOLOR_WHITE_EXP = 215
TEXTCOLOR_NONE = 255

ITEM_TYPE_DEPOT = 1
ITEM_TYPE_MAILBOX = 2
ITEM_TYPE_TRASHHOLDER = 3
ITEM_TYPE_CONTAINER = 4
ITEM_TYPE_DOOR = 5
ITEM_TYPE_MAGICFIELD = 6
ITEM_TYPE_TELEPORT = 7

CONST_PROP_BLOCKSOLID = 0
CONST_PROP_HASHEIGHT = 1
CONST_PROP_BLOCKPROJECTILE = 2
CONST_PROP_BLOCKPATHFIND = 3
CONST_PROP_ISVERTICAL = 4
CONST_PROP_ISHORIZONTAL = 5
CONST_PROP_MOVEABLE = 6
CONST_PROP_BLOCKINGANDNOTMOVEABLE = 7
CONST_PROP_SUPPORTHANGABLE = 8

SKILL_FIST = 0
SKILL_CLUB = 1
SKILL_SWORD = 2
SKILL_AXE = 3
SKILL_DISTANCE = 4
SKILL_SHIELD = 5
SKILL_FISHING = 6

CONTAINER_POSITION = 65535

STACKPOS_GROUND = 0
STACKPOS_FIRST_ITEM_ABOVE_GROUNDTILE = 1
STACKPOS_SECOND_ITEM_ABOVE_GROUNDTILE = 2
STACKPOS_THIRD_ITEM_ABOVE_GROUNDTILE = 3
STACKPOS_FOURTH_ITEM_ABOVE_GROUNDTILE = 4
STACKPOS_FIFTH_ITEM_ABOVE_GROUNDTILE = 5
STACKPOS_TOP_CREATURE = 253
STACKPOS_TOP_FIELD = 254
STACKPOS_TOP_MOVEABLE_ITEM_OR_CREATURE = 255

RETURNVALUE_NOERROR = 1
RETURNVALUE_NOTPOSSIBLE = 2
RETURNVALUE_NOTENOUGHROOM = 3
RETURNVALUE_PLAYERISPZLOCKED = 4
RETURNVALUE_PLAYERISNOTINVITED = 5
RETURNVALUE_CANNOTTHROW = 6
RETURNVALUE_THEREISNOWAY = 7
RETURNVALUE_DESTINATIONOUTOFREACH = 8
RETURNVALUE_CREATUREBLOCK = 9
RETURNVALUE_NOTMOVEABLE = 10
RETURNVALUE_DROPTWOHANDEDITEM = 11
RETURNVALUE_BOTHHANDSNEEDTOBEFREE = 12
RETURNVALUE_CANONLYUSEONEWEAPON = 13
RETURNVALUE_NEEDEXCHANGE = 14
RETURNVALUE_CANNOTBEDRESSED = 15
RETURNVALUE_PUTTHISOBJECTINYOURHAND = 16
RETURNVALUE_PUTTHISOBJECTINBOTHHANDS = 17
RETURNVALUE_TOOFARAWAY = 18
RETURNVALUE_FIRSTGODOWNSTAIRS = 19
RETURNVALUE_FIRSTGOUPSTAIRS = 20
RETURNVALUE_CONTAINERNOTENOUGHROOM = 21
RETURNVALUE_NOTENOUGHCAPACITY = 22
RETURNVALUE_CANNOTPICKUP = 23
RETURNVALUE_THISISIMPOSSIBLE = 24
RETURNVALUE_DEPOTISFULL = 25
RETURNVALUE_CREATUREDOESNOTEXIST = 26
RETURNVALUE_CANNOTUSETHISOBJECT = 27
RETURNVALUE_PLAYERWITHTHISNAMEISNOTONLINE = 28
RETURNVALUE_NOTREQUIREDLEVELTOUSERUNE = 29
RETURNVALUE_YOUAREALREADYTRADING = 30
RETURNVALUE_THISPLAYERISALREADYTRADING = 31
RETURNVALUE_YOUMAYNOTLOGOUTDURINGAFIGHT = 32
RETURNVALUE_DIRECTPLAYERSHOOT = 33
RETURNVALUE_NOTENOUGHLEVEL = 34
RETURNVALUE_NOTENOUGHMAGICLEVEL = 35
RETURNVALUE_NOTENOUGHMANA = 36
RETURNVALUE_NOTENOUGHSOUL = 37
RETURNVALUE_YOUAREEXHAUSTED = 38
RETURNVALUE_PLAYERISNOTREACHABLE = 39
RETURNVALUE_CANONLYUSETHISRUNEONCREATURES = 40
RETURNVALUE_ACTIONNOTPERMITTEDINPROTECTIONZONE = 41
RETURNVALUE_YOUMAYNOTATTACKTHISPLAYER = 42
RETURNVALUE_YOUMAYNOTATTACKAPERSONINPROTECTIONZONE = 43
RETURNVALUE_YOUMAYNOTATTACKAPERSONWHILEINPROTECTIONZONE = 44
RETURNVALUE_YOUMAYNOTATTACKTHISCREATURE = 45
RETURNVALUE_YOUCANONLYUSEITONCREATURES = 46
RETURNVALUE_CREATUREISNOTREACHABLE = 47
RETURNVALUE_TURNSECUREMODETOATTACKUNMARKEDPLAYERS = 48
RETURNVALUE_YOUNEEDPREMIUMACCOUNT = 49
RETURNVALUE_YOUNEEDTOLEARNTHISSPELL = 50
RETURNVALUE_YOURVOCATIONCANNOTUSETHISSPELL = 51
RETURNVALUE_YOUNEEDAWEAPONTOUSETHISSPELL = 52
RETURNVALUE_PLAYERISPZLOCKEDLEAVEPVPZONE = 53
RETURNVALUE_PLAYERISPZLOCKEDENTERPVPZONE = 54
RETURNVALUE_ACTIONNOTPERMITTEDINANOPVPZONE = 55
RETURNVALUE_YOUCANNOTLOGOUTHERE = 56

maleOutfits = {128, 129, 130, 131, 132, 133, 134, 143, 144, 145, 146, 151, 152, 153, 154, 251, 268, 273, 278}
femaleOutfits = {136, 137, 138, 139, 140, 141, 142, 147, 148, 149, 150, 155, 156, 157, 158, 252, 269, 270, 279}

doors = {[1209] = 1211, [1210] = 1211, [1212] = 1214, [1213] = 1214, [1219] = 1220, [1221] = 1222, [1231] = 1233, [1232] = 1233, [1234] = 1236, [1235] = 1236, [1237] = 1238, [1239] = 1240, [1249] = 1251, [1250] = 1251, [1252] = 1254, [1253] = 1254, [1539] = 1540, [1541] = 1542, [3535] = 3537, [3536] = 3537, [3538] = 3539, [3544] = 3546, [3545] = 3546, [3547] = 3548, [4913] = 4915, [4914] = 4915, [4916] = 4918, [4917] = 4918, [5082] = 5083, [5084] = 5085, [5098] = 5100, [5099] = 5100, [5101] = 5102, [5107] = 5109, [5108] = 5109, [5110] = 5111, [5116] = 5118, [5117] = 5118, [5119] = 5120, [5125] = 5127, [5126] = 5127, [5128] = 5129, [5134] = 5136, [5135] = 5136, [5137] = 5139, [5138] = 5139, [5140] = 5142, [5141] = 5142, [5143] = 5145, [5144] = 5145, [5278] = 5280, [5279] = 5280, [5281] = 5283, [5282] = 5283, [5284] = 5285, [5286] = 5287, [5515] = 5516, [5517] = 5518, [5732] = 5734, [5733] = 5734, [5735] = 5737, [5736] = 5737, [6192] = 6194, [6193] = 6194, [6195] = 6197, [6196] = 6197, [6198] = 6199, [6200] = 6201, [6249] = 6251, [6250] = 6251, [6252] = 6254, [6253] = 6254, [6255] = 6256, [6257] = 6258, [6795] = 6796, [6797] = 6798, [6799] = 6800, [6801] = 6802, [6891] = 6893, [6892] = 6893, [6894] = 6895, [6900] = 6902, [6901] = 6902, [6903] = 6904, [7033] = 7035, [7034] = 7035, [7036] = 7037, [7042] = 7044, [7043] = 7044, [7045] = 7046, [7054] = 7055, [7056] = 7057}
verticalOpenDoors = {1211, 1220, 1224, 1228, 1233, 1238, 1242, 1246, 1251, 1256, 1260, 1540, 3546, 3548, 3550, 3552, 4915, 5083, 5109, 5111, 5113, 5115, 5127, 5129, 5131, 5133, 5142, 5145, 5283, 5285, 5289, 5293, 5516, 5737, 5749, 6194, 6199, 6203, 6207, 6251, 6256, 6260, 6264, 6798, 6802, 6902, 6904, 6906, 6908, 7044, 7046, 7048, 7050, 7055}
horizontalOpenDoors = {1214, 1222, 1226, 1230, 1236, 1240, 1244, 1248, 1254, 1258, 1262, 1542, 3537, 3539, 3541, 3543, 4918, 5085, 5100, 5102, 5104, 5106, 5118, 5120, 5122, 5124, 5136, 5139, 5280, 5287, 5291, 5295, 5518, 5734, 5746, 6197, 6201, 6205, 6209, 6254, 6258, 6262, 6266, 6796, 6800, 6893, 6895, 6897, 6899, 7035, 7037, 7039, 7041, 7057}
questDoors = {1223, 1225, 1241, 1243, 1255, 1257, 3542, 3551, 5105, 5114, 5123, 5132, 5288, 5290, 5745, 5748, 6202, 6204, 6259, 6261, 6898, 6907, 7040, 7049}
levelDoors = {1227, 1229, 1245, 1247, 1259, 1261, 3540, 3549, 5103, 5112, 5121, 5130, 5292, 5294, 6206, 6208, 6263, 6265, 6896, 6905, 7038, 7047}
keys = {2086, 2087, 2088, 2089, 2090, 2091, 2092}

BLUEBERRYBUSH_DECAY_INTERVAL = 300000

ITEMCOUNT_MAX = 100

ITEM_GOLD_COIN = 2148
ITEM_PLATINUM_COIN = 2152
ITEM_CRYSTAL_COIN = 2160
ITEM_FISH = 2667
ITEM_WORM = 3976
ITEM_BLUEBERRY = 2677
ITEM_BLUEBERRYBUSH = 2785
ITEM_BUSH = 2786
ITEM_PARCEL = 2595
ITEM_LABEL = 2599

timer_actions = {time1 = 0, time2 = 0}

quendorTravel = {x=1925, y=1865, z=6}
thornTravel = {x=2455, y=1857, z=6}
aracuraTravel = {x=2117, y=2129, z=6}
vertigoTravel = {x=2172, y=2123, z=6}
salazartTravel = {x=2166, y=2718, z=6}
northrendTravel = {x=2025, y=1235, z=6}
okolnirTravel = {x=1971, y=1396, z=7}
nargorTravel = {x=2341, y=2145, z=7}
florestTravel = {x=2567, y=2357, z=6}

quendorTemple = {x=2020, y=1903, z=7}
thornTemple = {x=2383, y=1856, z=7}
aracuraTemple = {x=2105, y=2142, z=7}
rookTemple = {x=1865, y=2489, z=7}
salazartTemple = {x=2269, y=2686, z=4}
northrendTemple = {x=1960, y=1271, z=7}

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
		
