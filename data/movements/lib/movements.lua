function teleport(player)

	dir = getPlayerLookDir(player)
	pos = getPlayerPosition(player)

    if dir == 0 then
        position = {x=pos.x, y=pos.y+1, z=pos.z}
    elseif dir == 1 then
        position = {x=pos.x-1, y=pos.y, z=pos.z}
    elseif dir == 2 then
        position = {x=pos.x, y=pos.y-1, z=pos.z}
    elseif dir == 3 then
        position = {x=pos.x+1, y=pos.y, z=pos.z}
    end

    return position
end    

