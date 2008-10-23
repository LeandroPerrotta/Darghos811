function onUse(cid, item, frompos, item2, topos)
	
	local playerAccess = getPlayerGroupId(cid)
	
	--Elven Quest Trap
	if item.uid == 7000 then
		queststatus = getPlayerStorageValue(cid,7500)
		if queststatus == -1 or queststatus == 0 or playerAccess == 6 then
		
			creaturePos1 = {x=2395, y=1784, z=9}
			creaturePos2 = {x=2395, y=1785, z=9}
			creaturePos3 = {x=2395, y=1786, z=9}
			creaturePos4 = {x=2395, y=1787, z=9}
			creaturePos5 = {x=2389, y=1784, z=9}
			creaturePos6 = {x=2389, y=1785, z=9}
			creaturePos7 = {x=2389, y=1786, z=9}
			creaturePos8 = {x=2389, y=1787, z=9}
			
			doSummonCreature("Elf Arcanist", creaturePos1)
			doSummonCreature("Elf Arcanist", creaturePos2)
			doSummonCreature("Elf Arcanist", creaturePos3)
			doSummonCreature("Elf Arcanist", creaturePos4)
			doSummonCreature("Elf Arcanist", creaturePos5)
			doSummonCreature("Elf Arcanist", creaturePos6)
			doSummonCreature("Elf Arcanist", creaturePos7)
			doSummonCreature("Elf Arcanist", creaturePos8)
			
			setPlayerStorageValue(cid,7500,1)
		else
			doPlayerSendTextMessage(cid,22,"It is empty.")
		end
	end

	else
		return 0
   	end		
		
   	return 1	
end