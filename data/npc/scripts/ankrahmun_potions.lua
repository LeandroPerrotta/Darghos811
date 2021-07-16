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

shopModule:addSellableItem({'empty strong potion flask'}, 7634, 7, 'empty strong potion flask')
shopModule:addSellableItem({'empty great potion flask'}, 7635, 10, 'empty great potion flask')
shopModule:addSellableItem({'empty potion flask'}, 7636, 5, 'empty potion flask')

npcHandler:addModule(FocusModule:new())