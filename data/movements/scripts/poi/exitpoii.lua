--function by Armageddom--
function onStepIn(cid, item, frompos, item2, topos) 

	playerpos = getPlayerPosition(cid) 
	novapos = {x=348, y=445, z=8} 

	if item.uid == 3233 then
		getThingfromPos(playerpos) 
		doSendMagicEffect(playerpos,2) 
		doTeleportThing(cid,novapos) 
		doSendMagicEffect(novapos,10)
	end 
end