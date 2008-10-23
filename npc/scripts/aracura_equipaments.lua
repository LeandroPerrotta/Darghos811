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
--Armors
shopModule:addSellableItem({'chain armor'}, 2464, 60, 'chain armor')
shopModule:addSellableItem({'brass armor'}, 2465, 140, 'brass armor')
shopModule:addSellableItem({'scale armor'}, 2483, 75, 'scale armor')
shopModule:addSellableItem({'plate armor'}, 2463, 400, 'plate armor')
shopModule:addSellableItem({'dark armor'}, 2489, 160, 'dark armor')
shopModule:addSellableItem({'noble armor'}, 2486, 600, 'noble armor')
shopModule:addSellableItem({'blue robe'}, 2656, 6500, 'blue robe')
shopModule:addSellableItem({'knight armor'}, 2476, 3500, 'knight armor')
shopModule:addSellableItem({'crown armor'}, 2487, 7000, 'crown armor')

--Shields
shopModule:addSellableItem({'wooden shield'}, 2512, 6, 'wooden shield')
shopModule:addSellableItem({'studded shield'}, 2526, 8, 'studded shield')
shopModule:addSellableItem({'brass shield'}, 2511, 15, 'brass shield')
shopModule:addSellableItem({'plate shield'}, 2510, 30, 'plate shield')
shopModule:addSellableItem({'black shield'}, 2529, 250, 'black shield')
shopModule:addSellableItem({'bone shield'}, 2541, 60, 'bone shield')
shopModule:addSellableItem({'steel shield'}, 2509, 80, 'steel shield')
shopModule:addSellableItem({'viking shield'}, 2531, 160, 'viking shield')
shopModule:addSellableItem({'battle shield'}, 2513, 96, 'battle shield')
shopModule:addSellableItem({'dark shield'}, 2521, 100, 'dark shield')
shopModule:addSellableItem({'dwarven shield'}, 2525, 210, 'dwarven shield')
shopModule:addSellableItem({'ancient shield'}, 2532, 300, 'ancient shield')
shopModule:addSellableItem({'beholder shield'}, 2518, 450, 'beholder shield')
shopModule:addSellableItem({'guardian shield'}, 2515, 500, 'guardian shield')
shopModule:addSellableItem({'dragon shield'}, 2516, 830, 'dragon shield')
shopModule:addSellableItem({'tower shield'}, 2528, 1300, 'tower shield')
shopModule:addSellableItem({'crown shield'}, 2519, 1300, 'crown shield')
shopModule:addSellableItem({'medusa shield'}, 2536, 2000, 'medusa shield')
shopModule:addSellableItem({'vampire shield'}, 2534, 2500, 'vampire shield')

--Legs
shopModule:addSellableItem({'studded legs'}, 2468, 36, 'studded legs')
shopModule:addSellableItem({'chain legs'}, 2648, 65, 'chain legs')
shopModule:addSellableItem({'brass legs'}, 2478, 150, 'brass legs')
shopModule:addSellableItem({'plate legs'}, 2647, 500, 'plate legs')
shopModule:addSellableItem({'knight legs'}, 2477, 1200, 'knight legs')
shopModule:addSellableItem({'crown legs'}, 2488, 2300, 'crown legs')

--Helmets
shopModule:addSellableItem({'mystic turban'}, 2663, 50, 'mystic turban')
shopModule:addSellableItem({'chain helmet'}, 2458, 8, 'chain helmet')
shopModule:addSellableItem({'studded helmet'}, 2482, 8, 'studded helmet')
shopModule:addSellableItem({'brass helmet'}, 2460, 30, 'brass helmet')
shopModule:addSellableItem({'viking helmet'}, 2473, 66, 'viking helmet')
shopModule:addSellableItem({'legion helmet'}, 2480, 50, 'legion helmet')
shopModule:addSellableItem({'iron helmet'}, 2459, 150, 'iron helmet')
shopModule:addSellableItem({'steel helmet'}, 2457, 290, 'steel helmet')
shopModule:addSellableItem({'dark helmet'}, 2490, 100, 'dark helmet')
shopModule:addSellableItem({'crown helmet'}, 2491, 550, 'crown helmet')
shopModule:addSellableItem({'devil helmet'}, 2462, 500, 'devil helmet')
shopModule:addSellableItem({'warrior helmet'}, 2475, 1000, 'warrior helmet')
shopModule:addSellableItem({'crusader helmet'}, 2497, 1200, 'crusader helmet')
shopModule:addSellableItem({'royal helmet'}, 2498, 7000, 'royal helmet')

--Boots
shopModule:addSellableItem({'boots of haste'}, 2195, 7000, 'boots of haste')

--NPC Sell Items
--Armors
shopModule:addBuyableItem({'scale armor'}, 2483, 150, 'scale armor')
shopModule:addBuyableItem({'plate armor'}, 2463, 800, 'plate armor')

--Shields
shopModule:addBuyableItem({'wooden shield'}, 2512, 22, 'wooden shield')
shopModule:addBuyableItem({'studded shield'}, 2526, 25, 'studded shield')
shopModule:addBuyableItem({'viking shield'}, 2531, 400, 'viking shield')
shopModule:addBuyableItem({'copper shield'}, 2530, 50, 'copper shield')


--Legs
shopModule:addBuyableItem({'studded legs'}, 2468, 40, 'studded legs')
shopModule:addBuyableItem({'brass legs'}, 2478, 210, 'brass legs')

--Helmets
shopModule:addBuyableItem({'legion helmet'}, 2480, 75, 'legion helmet')
shopModule:addBuyableItem({'dark helmet'}, 2490, 400, 'dark helmet')



npcHandler:addModule(FocusModule:new())