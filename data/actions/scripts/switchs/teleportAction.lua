function onUse(cid, item, frompos, item2, topos)
	if item.actionid == 4011 then
		if item.itemid == 1445 then						
			teleportPos = {x=2573, y=2493, z=8}										
			doTeleportThing(cid,teleportPos,1)						
			doSendMagicEffect(teleportPos,10)
		else
			doPlayerSendCancel(cid,"Sorry, not possible.")			
		end
	end

	return 1
end