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
--Pearls
shopModule:addSellableItem({'scarf'}, 2661, 50, 'scarf')
shopModule:addSellableItem({'white pearl'}, 2143, 160, 'white pearl')
shopModule:addSellableItem({'black pearl'}, 2144, 280, 'black pearl')

--Gems
shopModule:addSellableItem({'small diamond'}, 2145, 300, 'small diamond')
shopModule:addSellableItem({'small sapphire'}, 2146, 250, 'small sapphire')
shopModule:addSellableItem({'small ruby'}, 2147, 250, 'small ruby')
shopModule:addSellableItem({'small emerald'}, 2149, 250, 'small emerald')
shopModule:addSellableItem({'small amethyst'}, 2150, 200, 'small amethyst')

--NPC Sell Items
--Pearls
shopModule:addBuyableItem({'scarf'}, 2661, 200, 'scarf')
shopModule:addBuyableItem({'white pearl'}, 2143, 320, 'white pearl')
shopModule:addBuyableItem({'black pearl'}, 2144, 560, 'black pearl')

--Gems
shopModule:addBuyableItem({'small diamond'}, 2145, 600, 'small diamond')
shopModule:addBuyableItem({'small sapphire'}, 2146, 500, 'small sapphire')
shopModule:addBuyableItem({'small ruby'}, 2147, 500, 'small ruby')
shopModule:addBuyableItem({'small emerald'}, 2149, 500, 'small emerald')
shopModule:addBuyableItem({'small amethyst'}, 2150, 400, 'small amethyst')

--Jóias
shopModule:addBuyableItem({'wedding ring'}, 2121, 990, 'wedding ring')
shopModule:addBuyableItem({'golden amulet'}, 2130, 6600, 'golden amulet')
shopModule:addBuyableItem({'ruby necklace'}, 2133, 3560, 'ruby necklace')





npcHandler:addModule(FocusModule:new())