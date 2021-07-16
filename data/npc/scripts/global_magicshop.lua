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

shopModule:addSellableItem({'vial', 'flask'}, 2006, 5, 'vial')
shopModule:addSellableItem({'empty strong potion flask'}, 7634, 7, 'empty strong potion flask')
shopModule:addSellableItem({'empty great potion flask'}, 7635, 10, 'empty great potion flask')
shopModule:addSellableItem({'empty potion flask'}, 7636, 5, 'empty potion flask')

shopModule:addBuyableItem({'backpack of ultimate healing', 'bp of ultimate healing'}, {1988, 2273, 2, 20},	20*180,	'backpack of ultimate healing runes')
shopModule:addBuyableItem({'backpack of heavy magic missile', 'bp of heavy magic missile'},	{1988, 2311, 20, 20},	20*100,	'backpack of heavy magic missile runes')
shopModule:addBuyableItem({'backpack of great fireball', 'bp of great fireball'},	{1988, 2304, 8, 20},	20*180,	'backpack of great fireball runes')
shopModule:addBuyableItem({'backpack of explosion', 'bp of explosion'},	{1988, 2313, 12, 20},	20*240,	'backpack of explosion runes')
shopModule:addBuyableItem({'backpack of sudden death', 'bp of sudden death'},	{1988, 2268, 6, 20},	20*300,	'backpack of sudden death runes')
shopModule:addBuyableItem({'backpack of magic wall', 'bp of magic wall'},	{1988, 2293, 6, 20},	20*220,	'backpack of magic wall runes')
shopModule:addBuyableItem({'backpack of paralize', 'bp of paralize'},	{1988, 2278, 2, 20},	20*400,	'backpack of paralize runes')
shopModule:addBuyableItem({'backpack of blank rune', 'bp of blank rune'},	{1988, 2260, 1, 20},	20*10,	'backpack of blank rune runes')
shopModule:addBuyableItem({'backpack of manafluid', 'backpack of mana fluid'},	{1988, 2006, 7, 20},	20*55,	'backpack of manafluid')
shopModule:addBuyableItem({'backpack of lifefluid', 'backpack of life fluid'},	{1988, 2006, 10, 20},	20*60,	'backpack of ultimate healing runes')

--potions
shopModule:addBuyableItem({'backpack of strong mana potion'},	{1988, 7589, 1, 20},	20*80,	'backpack of strong mana potion')
shopModule:addBuyableItem({'backpack of great mana potion'},	{1988, 7590, 1, 20},	20*120,	'backpack of great mana potion')
shopModule:addBuyableItem({'backpack of mana potion'},	{1988, 7620, 1, 20},	20*50,	'backpack of mana potion')

shopModule:addBuyableItem({'backpack of strong health potion'},	{1988, 7588, 1, 20},	20*100,	'backpack of strong health potion')
shopModule:addBuyableItem({'backpack of great health potion'},	{1988, 7591, 1, 20},	20*190,	'backpack of great health potion')
shopModule:addBuyableItem({'backpack of ultimate health potion'},	{1988, 8377, 1, 20},	20*310,	'backpack of ultimate health potion')
shopModule:addBuyableItem({'backpack of health potion'},	{1988, 7618, 1, 20},	20*45,	'backpack of health potion')

shopModule:addBuyableItem({'backpack of great spirit potion'},	{1988, 8376, 1, 20},	20*190,	'backpack of great spirit potion')

shopModule:addBuyableItem({'strong mana potion'}, 7589, 80, 'strong mana potion')
shopModule:addBuyableItem({'great mana potion'}, 7590, 120, 'great mana potion')
shopModule:addBuyableItem({'mana potion'}, 7620, 50, 'mana potion')

shopModule:addBuyableItem({'great spirit potion'}, 8376, 190, 'great spirit potion')

shopModule:addBuyableItem({'strong health potion'}, 7588, 100, 'strong health potion')
shopModule:addBuyableItem({'great health potion'}, 7591, 190, 'great health potion')
shopModule:addBuyableItem({'ultimate health potion'}, 8377, 310, 'ultimate health potion')
shopModule:addBuyableItem({'health potion'}, 7618, 45, 'health potion')

-- Magic Items
shopModule:addBuyableItem({'light wand', 'lightwand'}, 2163, 500, 'magic light wand')
shopModule:addBuyableItem({'mana fluid', 'manafluid'}, 2006, 55, 7, 'mana fluid')
shopModule:addBuyableItem({'life fluid', 'lifefluid'}, 2006, 60, 10, 'life fluid')

-- Wands
shopModule:addBuyableItem({'wand of vortex', 'vortex'}, 2190, 500, 'wand of vortex')
shopModule:addBuyableItem({'wand of dragonbreath', 'dragonbreath'}, 2191, 1000, 'wand of dragonbreath')
shopModule:addBuyableItem({'wand of plague', 'plague'}, 2188, 5000, 'wand of plague')
shopModule:addBuyableItem({'wand of cosmic energy', 'cosmic energy'}, 2189, 10000, 'wand of cosmic energy')
shopModule:addBuyableItem({'wand of inferno', 'inferno'}, 2187, 15000, 'wand of inferno')

-- Rods
shopModule:addBuyableItem({'snakebite rod', 'snakebite'}, 2182, 500, 'snakebite rod')
shopModule:addBuyableItem({'moonlight rod', 'moonlight'}, 2186, 1000, 'moonlight rod')
shopModule:addBuyableItem({'volcanic rod', 'volcanic'}, 2185, 5000, 'volcanic rod')
shopModule:addBuyableItem({'quagmire rod', 'quagmire'}, 2181, 10000, 'quagmire rod')
shopModule:addBuyableItem({'tempest rod', 'tempest'}, 2183, 15000, 'tempest rod')

-- Runes
shopModule:addBuyableItem({'ultimate healing'}, 2273, 180, 2, 'ultimate healing rune')
shopModule:addBuyableItem({'heavy magic missile'}, 2311, 120, 20, 'heavy magic missile rune')
shopModule:addBuyableItem({'great fireball'}, 2304, 180, 8, 'great fireball rune')
shopModule:addBuyableItem({'explosion'}, 2313, 240, 12, 'explosion rune')
shopModule:addBuyableItem({'sudden death'}, 2268, 300, 6, 'sudden death rune')
shopModule:addBuyableItem({'magic wall'}, 2293, 220, 6, 'magic wall rune')
shopModule:addBuyableItem({'paralize'}, 2278, 400, 2, 'paralize rune')
shopModule:addBuyableItem({'blank rune'}, 2260, 10, 'blank rune')


npcHandler:addModule(FocusModule:new())