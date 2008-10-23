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
shopModule:addSellableItem({'lightning robe'}, 7898, 12000, 'lightning robe')
shopModule:addSellableItem({'lightning legs'}, 7895, 10000, 'lightning legs')
shopModule:addSellableItem({'lightning boots'}, 7893, 6000, 'lightning boots')
shopModule:addSellableItem({'terra mantle'}, 7884, 12000, 'terra mantle')
shopModule:addSellableItem({'terra legs'}, 7885, 10000, 'terra legs')
shopModule:addSellableItem({'terra boots'}, 7886, 6000, 'terra boots')
shopModule:addSellableItem({'ancient shield'}, 2532, 900, 'ancient shield')
shopModule:addSellableItem({'black shield'}, 2529, 800, 'black shield')
shopModule:addSellableItem({'dark armor'}, 2489, 400, 'dark armor')
shopModule:addSellableItem({'dark helmet'}, 2490, 250, 'dark helmet')
shopModule:addSellableItem({'dragon hammer'}, 2434, 1400, 'dragon hammer')
shopModule:addSellableItem({'giant sword'}, 2393, 10000, 'giant sword')
shopModule:addSellableItem({'knight armor'}, 2476, 3500, 'knight armor')
shopModule:addSellableItem({'knight axe'}, 2430, 2100, 'knight axe')
shopModule:addSellableItem({'knight legs'}, 2477, 4200, 'knight legs')
shopModule:addSellableItem({'mystic turban'}, 2663, 500, 'mystic turban')
shopModule:addSellableItem({'poison dagger'}, 2411, 50, 'poison dagger')
shopModule:addSellableItem({'scimitar'}, 2419, 150, 'scimitar')
shopModule:addSellableItem({'serpent sword'}, 2409, 1500, 'serpent sword')
shopModule:addSellableItem({'skull staff'}, 2436, 9000, 'skull staff')
shopModule:addSellableItem({'strange helmet'}, 2479, 500, 'strange helmet')
shopModule:addSellableItem({'tower shield'}, 2528, 4500, 'tower shield')
shopModule:addSellableItem({'vampire shield'}, 2534, 9500, 'vampire shield')
shopModule:addSellableItem({'warrior helmet'}, 2475, 2500, 'warrior helmet')
shopModule:addSellableItem({'war axe'}, 2454, 8000, 'war axe')
shopModule:addSellableItem({'relic sword'}, 7383, 18000, 'relic sword')
shopModule:addSellableItem({'haunted blade'}, 7407, 14000, 'haunted blade')
shopModule:addSellableItem({'dragon slayer'}, 7402, 8000, 'dragon slayer')
shopModule:addSellableItem({'wyvern fang'}, 7408, 1000, 'wyvern fang')
shopModule:addSellableItem({'noble axe'}, 7456, 8500, 'noble axe')
shopModule:addSellableItem({'dreaded cleaver'}, 7419, 16000, 'dreaded cleaver')
shopModule:addSellableItem({'hammer of wrath'}, 2444, 21000, 'hammer of wrath')
shopModule:addSellableItem({'steel boots'}, 2645, 11000, 'steel boots')

--NPC Sell Items
shopModule:addBuyableItem({'ancient shield'}, 2532, 5000, 'ancient shield')
shopModule:addBuyableItem({'dark armor'}, 2489, 1500, 'dark armor')
shopModule:addBuyableItem({'dark helmet'}, 2490, 1000, 'dark helmet')
shopModule:addBuyableItem({'ice rapier'}, 2396, 5000, 'ice rapier')
shopModule:addBuyableItem({'serpent sword'}, 2409, 6000, 'serpent sword')


npcHandler:addModule(FocusModule:new())