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
--Weapons
shopModule:addSellableItem({'hand axe'}, 2380, 4)
shopModule:addSellableItem({'axe'}, 2386, 7)
shopModule:addSellableItem({'battle axe'}, 2378, 80)
shopModule:addSellableItem({'halberd'}, 2381, 400)
shopModule:addSellableItem({'spear'}, 2389, 3)
shopModule:addSellableItem({'mace'}, 2398, 30)
shopModule:addSellableItem({'battle hammer'}, 2417, 120)
shopModule:addSellableItem({'dagger'}, 2379, 2)
shopModule:addSellableItem({'rapier'}, 2384, 5)
shopModule:addSellableItem({'short sword'}, 2406, 10)
shopModule:addSellableItem({'sabre'}, 2385, 12)
shopModule:addSellableItem({'two handed sword'}, 2377, 450)
shopModule:addSellableItem({'sword'}, 2376, 25)

--Armor
shopModule:addSellableItem({'leather armor'}, 2467, 12)
shopModule:addSellableItem({'chain armor'}, 2464, 70)
shopModule:addSellableItem({'brass armor'}, 2465, 150)
shopModule:addSellableItem({'plate armor'}, 2463, 400)

--Helmets
shopModule:addSellableItem({'leather helmet'}, 2461, 4)
shopModule:addSellableItem({'chain helmet'}, 2458, 17)
shopModule:addSellableItem({'steel helmet'}, 2457, 190)

--Legs
shopModule:addSellableItem({'chain legs'}, 2648, 25)

--Shields
shopModule:addSellableItem({'wooden shield'}, 2512, 5)
shopModule:addSellableItem({'steel shield'}, 2509, 80)
shopModule:addSellableItem({'battle shield'}, 2513, 95)

--NPC Sell Items
--Weapons
shopModule:addSellableItem({'hand axe'}, 2380, 8)
shopModule:addSellableItem({'axe'}, 2386, 20)
shopModule:addSellableItem({'spear'}, 2389, 10)
shopModule:addSellableItem({'mace'}, 2398, 90)
shopModule:addSellableItem({'battle hammer'}, 2417, 350)
shopModule:addSellableItem({'dagger'}, 2379, 5)
shopModule:addSellableItem({'rapier'}, 2384, 15)
shopModule:addSellableItem({'sabre'}, 2385, 35)
shopModule:addSellableItem({'sword'}, 2376, 85)
shopModule:addSellableItem({'throwing star'}, 2399, 50)

--Armor
shopModule:addSellableItem({'leather armor'}, 2467, 35)
shopModule:addSellableItem({'chain armor'}, 2464, 200)
shopModule:addSellableItem({'brass armor'}, 2465, 450)

--Helmets
shopModule:addSellableItem({'leather helmet'}, 2461, 12)
shopModule:addSellableItem({'chain helmet'}, 2458, 52)

--Legs
shopModule:addSellableItem({'chain legs'}, 2648, 80)

--Shields
shopModule:addSellableItem({'wooden shield'}, 2512, 15)
shopModule:addSellableItem({'steel shield'}, 2509, 240)

npcHandler:addModule(FocusModule:new())