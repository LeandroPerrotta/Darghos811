function onStepOut(cid, item, pos)
	addEvent(transformBack, 10000, {oldItemID = item.itemid, position = pos})
	if item.itemid == 670 then
		doTransformItem(item.uid, 6594)
	else
		doTransformItem(item.uid, item.itemid + 15)
	end
end

function transformBack(parameters)
	parameters.position.stackpos = 0
	doTransformItem(getThingfromPos(parameters.position).uid, parameters.oldItemID)
end