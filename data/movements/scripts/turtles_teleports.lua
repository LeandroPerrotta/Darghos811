function onStepIn(cid, item, pos)

	local novapos = {x=2257,y=2246 ,z=7}
	local value_quest = getPlayerStorageValue(cid,2022)
	local playerpos = getPlayerPosition(cid)
	
	if item.actionid == 2022 then
		if value_quest == 1 then
			doTeleportThing(cid, novapos)
			doSendMagicEffect(novapos, 10)
			doSendMagicEffect(playerpos, 10)
		else
			doPlayerSendCancel(cid, "Você precisa ter completado as missões nescessárias para ter acesso à ilha das tartarugas.")
			doMoveCreature(cid, 2)
		end
		
	elseif item.actionid == 2023 then
			
	local pos_exit = {x=2316 ,y=2276 ,z=7}
			
		doTeleportThing(cid, pos_exit)
		doSendMagicEffect(playerpos, 10)
		doSendMagicEffect(pos_exit, 10)
	end
end
	