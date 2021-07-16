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
shopModule:addSellableItem({'axe ring'}, 2211, 100, 'axe ring')
shopModule:addSellableItem({'bronze amulet'}, 2172, 50, 'bronze amulet')
shopModule:addSellableItem({'club ring'}, 2209, 100, 'club ring')
shopModule:addSellableItem({'dwarven ring'}, 2213, 100, 'dwarven ring')
shopModule:addSellableItem({'elven amulet'}, 2198, 100, 'elven amulet')
shopModule:addSellableItem({'garlic necklace'}, 2199, 50, 'garlic necklace')
shopModule:addSellableItem({'magic light wand'}, 2162, 35, 'magic light wand')
shopModule:addSellableItem({'power ring'}, 2166, 50, 'power ring')
shopModule:addSellableItem({'stealth ring'}, 2165, 200, 'stealth ring')
shopModule:addSellableItem({'stone skin amulet'}, 2197, 500, 'stone skin amulet')
shopModule:addSellableItem({'sword ring'}, 2207, 100, 'sword ring')
shopModule:addSellableItem({'wand of dragonbreath'}, 2191, 200, 'wand of dragonbreath')
shopModule:addSellableItem({'wand of plague'}, 2188, 1000, 'wand of plague')
shopModule:addSellableItem({'wand of cosmic energy'}, 2189, 2000, 'wand of cosmic energy')
shopModule:addSellableItem({'wand of inferno'}, 2187, 3000, 'wand of inferno')

--NPC Sell Items
shopModule:addBuyableItem({'axe ring'}, 2211, 500, 'axe ring')
shopModule:addBuyableItem({'bronze amulet'}, 2172, 100, 'bronze amulet')
shopModule:addBuyableItem({'club ring'}, 2209, 500, 'club ring')
shopModule:addBuyableItem({'dwarven ring'}, 2213, 2000, 'dwarven ring')
shopModule:addBuyableItem({'elven amulet'}, 2198, 500, 'elven amulet')
shopModule:addBuyableItem({'garlic necklace'}, 2199, 100, 'garlic necklace')
shopModule:addBuyableItem({'magic light wand'}, 2162, 120, 'magic light wand')
shopModule:addBuyableItem({'power ring'}, 2166, 100, 'power ring')
shopModule:addBuyableItem({'stealth ring'}, 2165, 5000, 'stealth ring')
shopModule:addBuyableItem({'stone skin amulet'}, 2197, 5000, 'stone skin amulet')
shopModule:addBuyableItem({'sword ring'}, 2207, 500, 'sword ring')


npcHandler:addModule(FocusModule:new())