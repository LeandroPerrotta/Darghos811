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
shopModule:addSellableItem({'pick'}, 2553, 15, 'pick')
shopModule:addSellableItem({'shovel'}, 2554, 10, 'shovel')

--NPC Sell Items
shopModule:addBuyableItem({'rope'}, 2120, 50, 'rope')
shopModule:addBuyableItem({'pick'}, 2553, 50, 'pick')
shopModule:addBuyableItem({'shovel'}, 2554, 50, 'shovel')
shopModule:addBuyableItem({'fishing rod'}, 2580, 150, 'fishing rod')
shopModule:addBuyableItem({'torch'}, 2050, 2, 'torch')
shopModule:addBuyableItem({'machete'}, 2420, 80, 'machete')

shopModule:addBuyableItem({'green backpack'}, 1998, 20, 'green backpack')
shopModule:addBuyableItem({'yellow backpack'}, 1999, 20, 'yellow backpack')
shopModule:addBuyableItem({'red backpack'}, 2000, 20, 'red backpack')
shopModule:addBuyableItem({'pink backpack'}, 2001, 20, 'pink backpack')
shopModule:addBuyableItem({'blue backpack'}, 2002, 20, 'blue backpack')
shopModule:addBuyableItem({'silver backpack'}, 2003, 20, 'silver backpack')
shopModule:addBuyableItem({'gold backpack'}, 2004, 20, 'gold backpack')
shopModule:addBuyableItem({'brown backpack', 'backpack'}, 1988, 20, 'brown backpack')


npcHandler:addModule(FocusModule:new())