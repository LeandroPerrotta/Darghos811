-- BANUTA TP
function onStepIn(cid, item, pos) 

playerpos = getPlayerPosition(cid) 
novapos = {x=2435, y=2312, z=9} 

	if item.actionid == 1994 and item.itemid == 6299 then
		
		doSendMagicEffect(playerpos,2)
		doTeleportThing(cid, novapos)
		doSendMagicEffect(novapos, 10)
	end
end 