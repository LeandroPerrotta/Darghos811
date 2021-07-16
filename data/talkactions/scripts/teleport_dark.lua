function onSay(cid, words, param)

	refPos = { x=1837, y=1224, z=7, stackpos=1 } -- Posição da referencia daonde o player poderá falar a talk e ela ter efeito
	maxDistPos = 3 -- Quantos SQM o player poderá estar distante da Posição da Referencia e a talk ter efeito
	teleportPos = { x=1834, y=1212, z=7} -- Posição para aonde o player será teleportado
	
	playerpos = getPlayerPosition(cid) -- não mecher
	
	if math.max(math.abs(playerpos.x-refPos.x), math.abs(playerpos.y-refPos.y)) < maxDistPos then
	
		doTeleportThing(cid, teleportPos, 1)
		doSendMagicEffect(teleportPos, 10)
		return 0
	end	
end 