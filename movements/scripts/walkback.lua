function onStepIn(cid, item, position)
	if item.uid > 0 and item.uid < 65535 then
		if isPlayer(cid) == TRUE then
			local lookDirection = getPlayerLookDir(cid)
			if lookDirection == NORTH then
				position.y = position.y + 1
			elseif lookDirection == WEST then
				position.x = position.x + 1
			elseif lookDirection == SOUTH then
				position.y = position.y - 1
			else
				position.x = position.x - 1
			end
			doTeleportThing(cid, position, FALSE)
		end
	end
	return TRUE
end