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

shopModule:addBuyableItem({'backpack of ultimate healing', 'bp of ultimate healing'}, {1988, 2273, 3, 20},	20*270,	'backpack of ultimate healing runes')
shopModule:addBuyableItem({'backpack of heavy magic missile', 'bp of heavy magic missile'},	{1988, 2311, 30, 20},	20*150,	'backpack of heavy magic missile runes')
shopModule:addBuyableItem({'backpack of great fireball', 'bp of great fireball'},	{1988, 2304, 12, 20},	20*270,	'backpack of great fireball runes')
shopModule:addBuyableItem({'backpack of explosion', 'bp of explosion'},	{1988, 2313, 18, 20},	20*360,	'backpack of explosion runes')
shopModule:addBuyableItem({'backpack of sudden death', 'bp of sudden death'},	{1988, 2268, 9, 20},	20*450,	'backpack of sudden death runes')
shopModule:addBuyableItem({'backpack of magic wall', 'bp of magic wall'},	{1988, 2293, 9, 20},	20*330,	'backpack of magic wall runes')
shopModule:addBuyableItem({'backpack of paralize', 'bp of paralize'},	{1988, 2278, 3, 20},	20*600,	'backpack of paralize runes')
shopModule:addBuyableItem({'backpack of blank rune', 'bp of blank rune'},	{1988, 2260, 1, 20},	20*10,	'backpack of blank rune runes')
shopModule:addBuyableItem({'backpack of manafluid', 'backpack of mana fluid'},	{1988, 2006, 7, 20},	20*55,	'backpack of manafluid')

-- Magic Items
shopModule:addBuyableItem({'light wand', 'lightwand'}, 2163, 100, 'magic light wand')
shopModule:addBuyableItem({'mana fluid', 'manafluid'}, 2006, 55, 7, 'mana fluid')
shopModule:addBuyableItem({'life fluid', 'lifefluid'}, 2006, 60, 10, 'life fluid')

-- Wands
shopModule:addBuyableItem({'wand of vortex', 'vortex'}, 2190, 100, 'wand of vortex')
shopModule:addBuyableItem({'wand of dragonbreath', 'dragonbreath'}, 2191, 1000, 'wand of dragonbreath')
shopModule:addBuyableItem({'wand of decay', 'plague'}, 2188, 5000, 'wand of plague')
shopModule:addBuyableItem({'wand of cosmic energy', 'cosmic energy'}, 2189, 10000, 'wand of cosmic energy')
shopModule:addBuyableItem({'wand of inferno', 'inferno'}, 2187, 15000, 'wand of inferno')

-- Rods
shopModule:addBuyableItem({'snakebite rod', 'snakebite'}, 2182, 500, 'snakebite rod')
shopModule:addBuyableItem({'moonlight rod', 'moonlight'}, 2186, 1000, 'moonlight rod')
shopModule:addBuyableItem({'volcanic rod', 'volcanic'}, 2185, 5000, 'volcanic rod')
shopModule:addBuyableItem({'quagmire rod', 'quagmire'}, 2181, 10000, 'quagmire rod')
shopModule:addBuyableItem({'tempest rod', 'tempest'}, 2183, 15000, 'tempest rod')

-- Runes
shopModule:addBuyableItem({'ultimate healing'}, 2273, 270, 3, 'ultimate healing rune')
shopModule:addBuyableItem({'heavy magic missile'}, 2311, 150, 15, 'heavy magic missile rune')
shopModule:addBuyableItem({'great fireball'}, 2304, 270, 6, 'great fireball rune')
shopModule:addBuyableItem({'explosion'}, 2313, 360, 9, 'explosion rune')
shopModule:addBuyableItem({'sudden death'}, 2268, 450, 3, 'sudden death rune')
shopModule:addBuyableItem({'magic wall'}, 2293, 330, 9, 'magic wall rune')
shopModule:addBuyableItem({'paralize'}, 2278, 600, 3, 'paralize rune')
shopModule:addBuyableItem({'blank rune'}, 2260, 10, 'blank rune')

npcHandler:addModule(FocusModule:new())