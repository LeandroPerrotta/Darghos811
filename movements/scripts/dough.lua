function onAddItem(moveitem, tileitem, pos)
	if moveitem.itemid == 2693 then
		doTransformItem(moveitem.uid, 2689)
		doSendMagicEffect(pos,15)
	end
	return 1
end