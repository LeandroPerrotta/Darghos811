local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)



-- OTServ event handling functions start
function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) 	npcHandler:onCreatureSay(cid, type, msg) end
function onThink() 						npcHandler:onThink() end
-- OTServ event handling functions end

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

--NPC Buy Items
shopModule:addSellableItem({'rope'}, 2120, 15, 'rope')
shopModule:addSellableItem({'shovel'}, 2554, 10, 'shovel')

--NPC Sell Items
shopModule:addBuyableItem({'rope'}, 2120, 50, 'rope')
shopModule:addBuyableItem({'pick'}, 2553, 350, 'pick')
shopModule:addBuyableItem({'shovel'}, 2554, 50, 'shovel')
shopModule:addBuyableItem({'fishing rod'}, 2580, 150, 'fishing rod')
shopModule:addBuyableItem({'torch'}, 2050, 2, 'torch')
shopModule:addBuyableItem({'backpack'}, 1988, 20, 'brown backpack')
shopModule:addBuyableItem({'life fluid', 'lifefluid'}, 2006, 60, 10, 'life fluid')


npcHandler:addModule(FocusModule:new())