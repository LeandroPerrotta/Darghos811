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

--Swords
shopModule:addSellableItem({'rapier'}, 2384, 12, 'rapier')
shopModule:addSellableItem({'sabre'}, 2385, 15, 'sabre')
shopModule:addSellableItem({'machete'}, 2420, 15, 'machete')
shopModule:addSellableItem({'katana'}, 2412, 100, 'katana')
shopModule:addSellableItem({'spike sword'}, 2383, 1000, 'spike sword')
shopModule:addSellableItem({'sword'}, 2376, 25, 'sword')

--Clubs
shopModule:addSellableItem({'bone club'}, 2449, 15, 'bone club')
shopModule:addSellableItem({'mace'}, 2398, 28, 'mace')

--Axes
shopModule:addSellableItem({'hand axe'}, 2380, 12, 'hand axe')
shopModule:addSellableItem({'hatchet'}, 2388, 20, 'hatchet')
shopModule:addSellableItem({'axe'}, 2386, 15, 'axe')

--Armors
shopModule:addSellableItem({'leather armor'}, 2467, 2, 'leather armor')
shopModule:addSellableItem({'studded armor'}, 2484, 8, 'studded armor')
shopModule:addSellableItem({'chain armor'}, 2464, 45, 'chain armor')

--Shields
shopModule:addSellableItem({'wooden shield'}, 2512, 6, 'wooden shield')
shopModule:addSellableItem({'studded shield'}, 2526, 8, 'studded shield')
shopModule:addSellableItem({'brass shield'}, 2511, 15, 'brass shield')
shopModule:addSellableItem({'plate shield'}, 2510, 40, 'plate shield')
shopModule:addSellableItem({'copper shield'}, 2530, 46, 'copper shield')

--Legs
shopModule:addSellableItem({'studded legs'}, 2468, 36, 'studded legs')

--Helmets
shopModule:addSellableItem({'chain helmet'}, 2458, 8, 'chain helmet')
shopModule:addSellableItem({'studded helmet'}, 2482, 8, 'studded helmet')
shopModule:addSellableItem({'brass helmet'}, 2460, 15, 'brass helmet')
shopModule:addSellableItem({'viking helmet'}, 2473, 30, 'viking helmet')
shopModule:addSellableItem({'legion helmet'}, 2480, 35, 'legion helmet')

--NPC Sell Items
--Swords
shopModule:addBuyableItem({'rapier'}, 2384, 20, 'rapier')
shopModule:addBuyableItem({'sabre'}, 2385, 25, 'sabre')
shopModule:addBuyableItem({'machete'}, 2420, 25, 'machete')
shopModule:addBuyableItem({'sword'}, 2376, 60, 'sword')

--Clubs
shopModule:addBuyableItem({'bone club'}, 2449, 25, 'bone club')

--Axes
shopModule:addBuyableItem({'hand axe'}, 2380, 20, 'hand axe')
shopModule:addBuyableItem({'hatchet'}, 2388, 60, 'hatchet')
shopModule:addBuyableItem({'axe'}, 2386, 25, 'axe')

--Armors
shopModule:addBuyableItem({'studded armor'}, 2484, 16, 'studded armor')

--Shields
shopModule:addBuyableItem({'wooden shield'}, 2512, 22, 'wooden shield')
shopModule:addBuyableItem({'studded shield'}, 2526, 30, 'studded shield')

--Helmets
shopModule:addBuyableItem({'brass helmet'}, 2460, 20, 'brass helmet')



npcHandler:addModule(FocusModule:new())