function removeDemons()

	pos1 = {x=2130, y=2342, z=14, stackpos=253}
	pos1object = getThingfromPos(pos1)
	pos2 = {x=2131, y=2346, z=14, stackpos=253}
	pos2object = getThingfromPos(pos2)
	pos3 = {x=2132, y=2342, z=14, stackpos=253}
	pos3object = getThingfromPos(pos3)
	pos4 = {x=2133, y=2346, z=14, stackpos=253}
	pos4object = getThingfromPos(pos4)
	pos5 = {x=2134, y=2344, z=14, stackpos=253}
	pos5object = getThingfromPos(pos5)
	pos6 = {x=2135, y=2344, z=14, stackpos=253}
	pos6object = getThingfromPos(pos6)
	pos7 = {x=2133, y=2344, z=14, stackpos=253}
	pos7object = getThingfromPos(pos7)
	pos8 = {x=2132, y=2344, z=14, stackpos=253}
	pos8object = getThingfromPos(pos8)
	pos9 = {x=2131, y=2344, z=14, stackpos=253}
	pos9object = getThingfromPos(pos9)
	pos10 = {x=2130, y=2344, z=14, stackpos=253}
	pos10object = getThingfromPos(pos10)
	
	doRemoveCreature(pos1object.uid)
	doRemoveCreature(pos2object.uid)
	doRemoveCreature(pos3object.uid)
	doRemoveCreature(pos4object.uid)
	doRemoveCreature(pos5object.uid)
	doRemoveCreature(pos6object.uid)
	doRemoveCreature(pos7object.uid)
	doRemoveCreature(pos8object.uid)
	doRemoveCreature(pos9object.uid)
	doRemoveCreature(pos10object.uid)
	
	return 0
end

function onUse(cid, item, frompos, item2, topos)
	if item.uid == 3000 then
		if item.itemid == 1946 then
		
			player1pos = {x=2133, y=2344, z=13, stackpos=253}
			player1 = getThingfromPos(player1pos)
			player2pos = {x=2132, y=2344, z=13, stackpos=253}
			player2 = getThingfromPos(player2pos)
			player3pos = {x=2131, y=2344, z=13, stackpos=253}
			player3 = getThingfromPos(player3pos)
			player4pos = {x=2130, y=2344, z=13, stackpos=253}
			player4 = getThingfromPos(player4pos)
			
			if player1.itemid > 0 and player2.itemid > 0 and player3.itemid > 0 and player4.itemid > 0 or getPlayerGroupId(player1.uid) > 3 then
				
				player1level = getPlayerLevel(player1.uid)
				player2level = getPlayerLevel(player2.uid)
				player3level = getPlayerLevel(player3.uid)
				player4level = getPlayerLevel(player4.uid)
				questlevel = 100
				
				if player1level >= questlevel and player2level >= questlevel and player3level >= questlevel and player4level >= questlevel or getPlayerGroupId(player1.uid) > 3 then
					
					queststatus1 = getPlayerStorageValue(player1.uid,100)
					queststatus2 = getPlayerStorageValue(player2.uid,100)
					queststatus3 = getPlayerStorageValue(player3.uid,100)
					queststatus4 = getPlayerStorageValue(player4.uid,100)
					
					if queststatus1 == -1 and queststatus2 == -1 and queststatus3 == -1 and queststatus4 == -1 or getPlayerGroupId(player1.uid) > 3 then					
						
						--if 1==1 then				
						demon1pos = {x=2130, y=2342, z=14}
						demon2pos = {x=2131, y=2346, z=14}
						demon3pos = {x=2132, y=2342, z=14}
						demon4pos = {x=2133, y=2346, z=14}
						demon5pos = {x=2134, y=2344, z=14}
						demon6pos = {x=2135, y=2344, z=14}
						
						doSummonCreature("Demon", demon1pos)
						doSummonCreature("Demon", demon2pos)
						doSummonCreature("Demon", demon3pos)
						doSummonCreature("Demon", demon4pos)
						doSummonCreature("Demon", demon5pos)
						doSummonCreature("Demon", demon6pos)
						
						nplayer1pos = {x=2133, y=2344, z=14}
						nplayer2pos = {x=2132, y=2344, z=14}
						nplayer3pos = {x=2131, y=2344, z=14}
						nplayer4pos = {x=2130, y=2344, z=14}
						
						doSendMagicEffect(player1pos,2)
						doSendMagicEffect(player2pos,2)
						doSendMagicEffect(player3pos,2)
						doSendMagicEffect(player4pos,2)
						
						doTeleportThing(player1.uid,nplayer1pos,1)
						doTeleportThing(player2.uid,nplayer2pos,1)
						doTeleportThing(player3.uid,nplayer3pos,1)
						doTeleportThing(player4.uid,nplayer4pos,1)
						
						doSendMagicEffect(nplayer1pos,10)
						doSendMagicEffect(nplayer2pos,10)
						doSendMagicEffect(nplayer3pos,10)
						doSendMagicEffect(nplayer4pos,10)
						
						doTransformItem(item.uid,1945)
					else
						doPlayerSendCancel(cid,"Um jogador do time ja completou a quest.")
					end
					
				else
					doPlayerSendCancel(cid,"E necessario lvl 100 ou superior.")
				end
				
			else
			doPlayerSendCancel(cid,"Sao necessarios 4 jogadores.")
			end
		end
		
		if item.itemid == 1945 then
						
			removeDemons()	
			doTransformItem(item.uid,1946)
		end
	end


return 1
end