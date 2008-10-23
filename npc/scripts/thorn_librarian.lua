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

--NPC Sell Items

shopModule:addBuyableItem({'scroll'}, 1949, 5, 'scroll')
shopModule:addBuyableItem({'document'}, 1952, 12, 'document')
shopModule:addBuyableItem({'parchment'}, 1948, 8, 'parchment')
shopModule:addBuyableItem({'inkwell'}, 2600, 500, 'inkwell')
shopModule:addBuyableItem({'black book'}, 1955, 15, 'black book')
shopModule:addBuyableItem({'brown book'}, 1950, 15, 'brown book')

npcHandler:addModule(FocusModule:new())