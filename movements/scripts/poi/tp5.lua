--function by Armageddom--
function onStepIn(cid, item, frompos, item2, topos) 

playerpos = getPlayerPosition(cid) 
novapos = {x=411, y=437, z=7} 

if item.uid == 9117 then

getThingfromPos(playerpos) 
doSendMagicEffect(playerpos,2) 
doTeleportThing(cid,novapos) 
doSendMagicEffect(novapos,10)
end 
end