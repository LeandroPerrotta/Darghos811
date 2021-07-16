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
shopModule:addSellableItem({'machete'}, 2420, 16, 'machete')
shopModule:addSellableItem({'bone sword'}, 2450, 28, 'bone sword')
shopModule:addSellableItem({'heavy machete'}, 2442, 40, 'heavy machete')
shopModule:addSellableItem({'longsword'}, 2397, 45, 'longsword')
shopModule:addSellableItem({'broad sword'}, 2413, 55, 'broad sword')
shopModule:addSellableItem({'serpent sword'}, 2409, 700, 'serpent sword')
shopModule:addSellableItem({'two handed sword', 'two-handed sword'}, 2377, 140)

--Clubs
shopModule:addSellableItem({'bone club'}, 2449, 15, 'bone club')
shopModule:addSellableItem({'daramanian mace'}, 2439, 44, 'daramanian mace')
shopModule:addSellableItem({'battle hammer'}, 2417, 120, 'battle hammer')
shopModule:addSellableItem({'morning star'}, 2394, 60, 'morning star')
shopModule:addSellableItem({'clerical mace'}, 2423, 160, 'clerical mace')
shopModule:addSellableItem({'war hammer'}, 2391, 500, 'war hammer')
shopModule:addSellableItem({'mace'}, 2398, 18, 'mace')
--Axes
shopModule:addSellableItem({'orcish axe'}, 2428, 60, 'orcish axe')
shopModule:addSellableItem({'battle axe'}, 2378, 60, 'battle axe')
shopModule:addSellableItem({'obsidian lance'}, 2425, 110, 'obsidian lance')
shopModule:addSellableItem({'double axe'}, 2387, 140, 'double axe')
shopModule:addSellableItem({'halberd'}, 2381, 220, 'halberd')
shopModule:addSellableItem({'axe'}, 2386, 15, 'axe')

--NPC Sell Items
--Swords
shopModule:addBuyableItem({'bone sword'}, 2450, 30, 'bone sword')
shopModule:addBuyableItem({'heavy machete'}, 2442, 60, 'heavy machete')
--Clubs
shopModule:addBuyableItem({'daramanian mace'}, 2439, 65, 'daramanian mace')
shopModule:addBuyableItem({'morning star'}, 2394, 160, 'morning star')
shopModule:addBuyableItem({'mace'}, 2398, 30, 'mace')
--Axes
shopModule:addBuyableItem({'battle axe'}, 2378, 180, 'battle axe')
shopModule:addBuyableItem({'halberd'}, 2381, 1500, 'halberd')



npcHandler:addModule(FocusModule:new())