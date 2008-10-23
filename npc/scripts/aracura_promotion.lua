local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)		npcHandler:onCreatureAppear(cid)		end
function onCreatureDisappear(cid)	npcHandler:onCreatureDisappear(cid)		end
function onCreatureSay(cid, type, msg)	npcHandler:onCreatureSay(cid, type, msg)	end
function onThink()			npcHandler:onThink()				end

local node1 = keywordHandler:addKeyword({'promotion'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I can promote you for 20000 gold coins. Do you want me to promote you?'})
	node1:addChildKeyword({'yes'}, StdModule.promotePlayer, {npcHandler = npcHandler, cost = 20000, level = 20, text = 'Congratulations! You are now promoted.'})
	node1:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Allright then. Come back when you are ready.', reset = true})

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

shopModule:addBuyableItem({'teleport scroll'}, 4328, 5000)	

function creatureSayCallback(cid, type, msg)

	if msgcontains(msg, 'job') then 
		selfSay('Eu tenho o poder de lhe promover por 20000 gold coins, mas tambem vendo os uteis teleport scroll que você pode usa-lo para ser teleportado ao templo por 5000 gps.') 	
	end
	
	return TRUE
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)	
npcHandler:addModule(FocusModule:new())