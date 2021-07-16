local holes = {468, 481, 483}
function onUse(cid, item, fromPosition, itemEx, toPosition)

aID = 777 --Action Id the ground tile must have to turn into a hole.
ticks = 30 --How many seconds the hole will last before turning into a normal tile again
toPosition = {x=toPosition.x, y=toPosition.y, z=toPosition.z}
rand = math.random(1, 100)

	if itemEx.actionid == aID and rand > 80 then
		if itemEx.itemid == 231 then
	        doTransformItem(itemEx.uid,482)
	        doDecayItemTo(toPosition, itemEx.itemid, ticks)
		end
	end
	
	if isInArray(holes, itemEx.itemid) == TRUE then
		doTransformItem(itemEx.uid, itemEx.itemid + 1)
		doDecayItem(itemEx.uid)
	elseif itemEx.itemid == 231 then
		
		if rand == 1 then
			doCreateItem(2159, 1, toPosition)
		elseif rand > 95 then
			doSummonCreature("Scarab", toPosition)
		end
		doSendMagicEffect(toPosition, CONST_ME_POFF)
	else
		return FALSE
	end
	return TRUE
end