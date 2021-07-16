local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)



-- OTServ event handling functions start
function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) 	npcHandler:onCreatureSay(cid, type, msg) end
function onThink() 						npcHandler:onThink() end
-- OTServ event handling functions end

function buyParcel(cid, message, keywords, parameters, node)
	local module = parameters.module
	if(cid ~= npcHandler.focus) then
		return false
	end
	local parentParameters = node:getParent():getParameters()
	local parseInfo = {
			[TAG_PLAYERNAME] = getPlayerName(cid),
			[TAG_ITEMCOUNT] = module.amount,
			[TAG_TOTALCOST] = parentParameters.cost*module.amount,
			[TAG_ITEMNAME] = parentParameters.realname or node:getParent():getKeywords()[1]
		}
	
	local ret = doPlayerBuyItem(cid, parentParameters.itemid, module.amount, parentParameters.cost*module.amount, parentParameters.charges)
	if(ret == LUA_NO_ERROR) then
		doPlayerBuyItem(cid, 2599, module.amount, 0)
		local msg = module.npcHandler:getMessage(MESSAGE_ONBUY)
		msg = module.npcHandler:parseMessage(msg, parseInfo)
		npcHandler:say(msg)
	else
		local msg = module.npcHandler:getMessage(MESSAGE_NEEDMOREMONEY)
		msg = module.npcHandler:parseMessage(msg, parseInfo)
		npcHandler:say(msg)
	end
	
	npcHandler:resetNpc()
	return true
end

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

local node = keywordHandler:addKeyword({'parcel'}, ShopModule.tradeItem, {itemid=2595, cost=15, eventType=SHOPMODULE_BUY_ITEM, module=shopModule})
node:addChildKeyword({'yes'}, buyParcel, {module = shopModule})
node:addChildKeywordNode(shopModule.noNode)
shopModule:addBuyableItem({'letter'}, 2597, 5)
shopModule:addBuyableItem({'label'}, 2599, 2)


npcHandler:addModule(FocusModule:new())