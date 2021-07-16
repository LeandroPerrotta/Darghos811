local internalCustomerQueue = {}
local keywordHandler = KeywordHandler:new({root = {}})
local npcHandler = ShopNpcHandler:new({})
local customerQueue = CustomerQueue:new({customers = internalCustomerQueue, handler = npcHandler})
npcHandler:init(customerQueue, keywordHandler)
npcHandler.walkDistance = 0

-- OTServ event handling functions start
function onThingMove(creature, thing, oldpos, oldstackpos)     npcHandler:onThingMove(creature, thing, oldpos, oldstackpos) end
function onCreatureAppear(creature)                             npcHandler:onCreatureAppear(creature) end
function onCreatureDisappear(id)                                 npcHandler:onCreatureDisappear(id) end
function onCreatureTurn(creature)                                 npcHandler:onCreatureTurn(creature) end
function onCreatureSay(cid, type, msg)                         npcHandler:onCreatureSay(cid, type, msg) end
function onCreatureChangeOutfit(creature)                         npcHandler:onCreatureChangeOutfit(creature) end
function onThink()                                            
   
   if (os.clock() - npcHandler.talkStart) > 40 then
       if npcHandler.focus > 0 then
           selfSay('May Crunor bless you.')
       end
       
       npcHandler:resetNpc()
       
       npcHandler.queue:greetNext()
   end
   
   local dist = getDistanceToCreature(npcHandler.focus)
   if dist > 3 then
       selfSay('May Crunor bless you.')
       npcHandler:resetNpc()
       npcHandler.queue:greetNext()
   end
   
   
   
   if npcHandler.focus == 0 then
 if(npcHandler.spawnPos == nil) then
     local sx, sy, sz = selfGetPosition()
     npcHandler.spawnPos = {x = sx, y = sy, z = sz}
 end
     npcHandler.lastMove = walk(npcHandler.lastMove, npcHandler.spawnPos, npcHandler.walkDistance)
    else
 npcHandler.lastPos = turnToCreature(npcHandler.focus, npcHandler.lastPos)
    end
   
end

-- OTServ event handling functions end

-- Keyword handling functions start
function tradeItem(cid, message, keywords, parameters)    
   if npcHandler.focus ~= cid then
       return false
   end
   
   local tempcount = getCount(message)
   if(tempcount > 500) then
       tempcount = 500
   end
   
   
   local itemname = keywords[1]
   if(keywords[1] == 'sell') then
       itemname = keywords[2]
   end
   
   if(parameters.realname ~= nil) then
       itemname = parameters.realname
   end
   
   local tradeKeyword = 'buy'
   if(keywords[1] == 'sell') then
       tradeKeyword = 'sell'
   end
    if(tempcount == 1) then
 selfSay('Do you want to ' .. tradeKeyword .. ' a ' .. itemname .. ' for ' .. parameters.cost*tempcount .. ' gold?')
    else
 selfSay('Do you want to ' .. tradeKeyword .. ' ' .. tempcount .. ' ' .. itemname .. 's for ' .. parameters.cost*tempcount .. ' gold?')
   end
   if(keywords[1] == 'sell') then
       npcHandler.talkState = TALKSTATE_SELL_ITEM
   else
       npcHandler.talkState = TALKSTATE_BUY_ITEM
   end
   
   npcHandler:setActiveItem(parameters.itemid, tempcount, parameters.charges, tempcount*parameters.cost, (parameters.stackable ~= nil and parameters.stackable == true))
   return true
end

function confirmAction(cid, message, keywords, parameters)
   if npcHandler.focus ~= cid then
       return false
   end
   if(keywords[1] == 'yes') then
       if(npcHandler.talkState == TALKSTATE_SELL_ITEM) then
           npcHandler.talkState = TALKSTATE_NONE
           local ret = doPlayerSellItem(npcHandler.focus, npcHandler.itemid, npcHandler.stackable, npcHandler.count, npcHandler.cost)
           if(ret == LUA_NO_ERROR) then
               selfSay('Here you are.')
           else
               selfSay('You don\'t have any empty vials.')
           end
       elseif(npcHandler.talkState == TALKSTATE_BUY_ITEM) then
           npcHandler.talkState = TALKSTATE_NONE
           local ret = 0
           if(npcHandler.charges == nil or npcHandler.charges <= 1) then
               ret = doPlayerBuyItem(npcHandler.focus, npcHandler.itemid, npcHandler.stackable, npcHandler.count, npcHandler.cost)
           else
               ret = doPlayerBuyRune(npcHandler.focus, npcHandler.itemid, npcHandler.count, npcHandler.charges, npcHandler.cost)
           end
           if(ret == LUA_NO_ERROR) then
               selfSay('Here you are. There is a deposit of 5 gold on the vial, but be sure to only sell empty vials.')
           else
               selfSay('Come back, when you have enough money.')
           end
       elseif(npcHandler.talkState == TALKSTATE_TRADE_ITEM) then
           npcHandler.talkState = TALKSTATE_NONE
     
     if (getPlayerItemCount(cid, npcHandler.itemid1) >= npcHandler.count1) then
   if(npcHandler.cost ~= nil and npcHandler.cost > 0) then
       if(doPlayerRemoveMoney(cid, npcHandler.cost) ~= 1) then
     selfSay('Come back, when you have enough money.')
     return true
       end    
   end
     else
   selfSay('You don\'t have any empty vials.')
   return true
     end  
     if(npcHandler.prize > 0) then
   doPlayerAddMoney(cid, parameters.prize)
     end    
           local ret = 0
     if(doPlayerTakeItem(cid, npcHandler.itemid1, npcHandler.stackable1, npcHandler.count1) == LUA_NO_ERROR) then
   ret = doPlayerGiveItem(npcHandler.focus, npcHandler.itemid2, npcHandler.stackable2, npcHandler.count2)
   if(ret == LUA_NO_ERROR) then
       selfSay('Here you are.')
   end    
     end    
 end
   elseif(keywords[1] == 'no') then
       if(npcHandler.talkState == TALKSTATE_SELL_ITEM) then
           selfSay('Hmm, but please keep Tibia litter free.')
           npcHandler.talkState = TALKSTATE_NONE
       elseif(npcHandler.talkState == TALKSTATE_BUY_ITEM) then
           selfSay('Hmm but next time.')
           npcHandler.talkState = TALKSTATE_NONE
       elseif(npcHandler.talkState == TALKSTATE_TRADE_ITEM) then
           selfSay('You don\'t even have a simple item?')
           npcHandler.talkState = TALKSTATE_NONE      
       end
   end
   
   return true
end

function sayMessage(cid, message, keywords, parameters)     return npcHandler:defaultMessageHandler(cid, message, keywords, parameters) end
function greet(cid, message, keywords, parameters)        

   if npcHandler.focus > 0 or not(npcHandler.queue:isEmpty()) then
    if npcHandler.focus ~= cid then
       selfSay('Wait, ' .. creatureGetName(cid) .. '')
       if(not npcHandler.queue:isInQueue(cid)) then
           npcHandler.queue:pushBack(cid)
       end
    else
 npcHandler.talkStart = os.clock()
    end    
   elseif(npcHandler.focus == 0) and (npcHandler.queue:isEmpty()) then
       selfSay('Greetings, traveller ' .. creatureGetName(cid) .. '.')
       npcHandler.focus = cid
       npcHandler.talkStart = os.clock()
   end
   
   return true
end

function farewell(cid, message, keywords, parameters)      
   if(cid == npcHandler.focus) then
       selfSay('May Crunor bless you.')
       npcHandler:resetNpc()
       npcHandler.queue:greetNext()
       return true
   end
   return false
end

-- Keyword handling functions end

-- Keyword structure generation start

-- Vial - will sell life fluids also so it's up to you whether to include this code. I have included a warning in "function confirmAction".
keywordHandler:addKeyword({'sell', 'vial'},     tradeItem, {itemid = 2006, cost = 5, charges = 0, realname = "empty vial"})
-- Lifefluid
keywordHandler:addKeyword({'life fluid'},     tradeItem, {itemid = 2006, cost = 60, charges = 10})


keywordHandler:addKeyword({'yes'}, confirmAction, nil)
keywordHandler:addKeyword({'no'}, confirmAction, nil)

keywordHandler:addKeyword({'job'},     sayMessage, {text = 'I am a druid and healer, a follower of Crunor.', onlyfocus = true})
keywordHandler:addKeyword({'sell'},        sayMessage, {text = 'I just sell some revitalizing life fluids.', onlyfocus = true})
keywordHandler:addKeyword({'name'},     sayMessage, {text = 'I am Hyacinth.', onlyfocus = true})

keywordHandler:addKeyword({'dallheim'},     sayMessage, {text = 'A man of the sword.', onlyfocus = true})
keywordHandler:addKeyword({'amber'},     sayMessage, {text = 'I never talked to her long.', onlyfocus = true})
keywordHandler:addKeyword({'cipfried'},     sayMessage, {text = 'His healing powers equal even mine.', onlyfocus = true})
keywordHandler:addKeyword({'seymour'},     sayMessage, {text = 'I am Hyacinth.', onlyfocus = true})
keywordHandler:addKeyword({'obi'},     sayMessage, {text = 'A greedy and annoying person as most people are.', onlyfocus = true})
keywordHandler:addKeyword({'tibia'},     sayMessage, {text = 'It is shaped by the will of the gods, so we don\'t have to question it.', onlyfocus = true})
keywordHandler:addKeyword({'time'},     sayMessage, {text = 'Time does not matter to me.', onlyfocus = true})
keywordHandler:addKeyword({'king'},     sayMessage, {text = 'I don\'t care about kings, queens, and the like.', onlyfocus = true})
keywordHandler:addKeyword({'magic'},     sayMessage, {text = 'I am one of the few magic users on this isle. But I sense a follower of the dark path of magic hiding somewhere in the depths of the dungeons.', onlyfocus = true})
keywordHandler:addKeyword({'help'},     sayMessage, {text = 'I can only sell life fluids, ask Cipfried for further help.', onlyfocus = true})
keywordHandler:addKeyword({'weapon'},     sayMessage, {text = 'I don\'t care much about weapons.', onlyfocus = true})
keywordHandler:addKeyword({'spell'},     sayMessage, {text = 'I can\'t teach you magic. On the mainland you will learn your spells soon enough.', onlyfocus = true})
keywordHandler:addKeyword({'sewer'},     sayMessage, {text = 'I rarely visit the town.', onlyfocus = true})
keywordHandler:addKeyword({'god'},     sayMessage, {text = 'As far as I know there is a library in the village. Teach yourself about the gods.', onlyfocus = true})
keywordHandler:addKeyword({'dungeon'},     sayMessage, {text = 'The dungeons are dangerous for unexperienced adventurers.', onlyfocus = true})
keywordHandler:addKeyword({'monster'},     sayMessage, {text = 'Most of the so called monsters of this isle are just creatures of the gods. On the mainland there are some beasts that truly are monstrous.', onlyfocus = true})

keywordHandler:addKeyword({'hi'}, greet, nil)
keywordHandler:addKeyword({'hello'}, greet, nil)
keywordHandler:addKeyword({'bye'}, farewell, nil)
-- Keyword structure generation end