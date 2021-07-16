function onStepIn(cid, item, pos)

npos = {x=pos.x, y=pos.y, z=pos.z, stackpos=253}
getplayer = getThingfromPos(npos)

outfit = {lookType=267,lookHead=0,lookAddons=0,lookLegs=0,lookBody=0,lookFeet=0}
outfitTime = -1

swimstorage = 33

normal = getCreatureOutfit(cid)

swimstatus = getPlayerStorageValue(cid,swimstorage)

	 if item.itemid == 4632 then
		if swimstatus == -1 or swimstatus == 0 then
		         npos = {x=pos.x-0, y=pos.y-1, z=pos.z}
		         doTeleportThing(getplayer.uid,npos)
		         doSendMagicEffect(npos, 53)
			 doSetCreatureOutfit(cid, outfit, outfitTime)
			 setPlayerStorageValue(cid,swimstorage,1)
		else
		         npos = {x=pos.x+0, y=pos.y+1, z=pos.z}
		         doTeleportThing(getplayer.uid,npos)
			 doRemoveCondition(cid, CONDITION_OUTFIT)
			 setPlayerStorageValue(cid,swimstorage,0)
		end
	 elseif item.itemid == 4633 then
		if swimstatus == -1 or swimstatus == 0 then
		         npos = {x=pos.x-0, y=pos.y-1, z=pos.z}
		         doTeleportThing(getplayer.uid,npos)
		         doSendMagicEffect(npos, 53)
			 doSetCreatureOutfit(cid, outfit, outfitTime)
			 setPlayerStorageValue(cid,swimstorage,1)
		else
		         npos = {x=pos.x+0, y=pos.y+1, z=pos.z}
		         doTeleportThing(getplayer.uid,npos)
			 doRemoveCondition(cid, CONDITION_OUTFIT)
			 setPlayerStorageValue(cid,swimstorage,0)
		end
	 elseif item.itemid == 4635 then
		if swimstatus == -1 or swimstatus == 0 then
		         npos = {x=pos.x-0, y=pos.y-1, z=pos.z}
		         doTeleportThing(getplayer.uid,npos)
		         doSendMagicEffect(npos, 53)
			 doSetCreatureOutfit(cid, outfit, outfitTime)
			 setPlayerStorageValue(cid,swimstorage,1)
		else
		         npos = {x=pos.x+0, y=pos.y+1, z=pos.z}
		         doTeleportThing(getplayer.uid,npos)
			 doRemoveCondition(cid, CONDITION_OUTFIT)
			 setPlayerStorageValue(cid,swimstorage,0)
		end
	 elseif item.itemid == 4634 then
		if swimstatus == -1 or swimstatus == 0 then
		         npos = {x=pos.x+0 , y=pos.y+1, z=pos.z}
		         doTeleportThing(getplayer.uid,npos)
		         doSendMagicEffect(npos, 53)
			 doSetCreatureOutfit(cid, outfit, outfitTime)
			 setPlayerStorageValue(cid,swimstorage,1)
		else
		         npos = {x=pos.x-0, y=pos.y-1, z=pos.z}
		         doTeleportThing(getplayer.uid,npos)
			 doRemoveCondition(cid, CONDITION_OUTFIT)
			 setPlayerStorageValue(cid,swimstorage,0)
		end
	 elseif item.itemid == 4636 then
		if swimstatus == -1 or swimstatus == 0 then
		         npos = {x=pos.x+0, y=pos.y+1, z=pos.z}
		         doTeleportThing(getplayer.uid,npos)
		         doSendMagicEffect(npos, 53)
			 doSetCreatureOutfit(cid, outfit, outfitTime)
			 setPlayerStorageValue(cid,swimstorage,1)
		else
		         npos = {x=pos.x-0, y=pos.y-1, z=pos.z}
		         doTeleportThing(getplayer.uid,npos)
			 doRemoveCondition(cid, CONDITION_OUTFIT)
			 setPlayerStorageValue(cid,swimstorage,0)
		end
	 elseif item.itemid == 4637 then
		if swimstatus == -1 or swimstatus == 0 then
		         npos = {x=pos.x+0, y=pos.y+1, z=pos.z}
		         doTeleportThing(getplayer.uid,npos)
		         doSendMagicEffect(npos, 53)
			 doSetCreatureOutfit(cid, outfit, outfitTime)
			 setPlayerStorageValue(cid,swimstorage,1)
		else
		         npos = {x=pos.x-0, y=pos.y-1, z=pos.z}
		         doTeleportThing(getplayer.uid,npos)
			 doRemoveCondition(cid, CONDITION_OUTFIT)
			 setPlayerStorageValue(cid,swimstorage,0)
		end
	 elseif item.itemid == 4638 then
		if swimstatus == -1 or swimstatus == 0 then
		         npos = {x=pos.x-0, y=pos.y-1, z=pos.z}
		         doTeleportThing(getplayer.uid,npos)
		         doSendMagicEffect(npos, 53)
			 doSetCreatureOutfit(cid, outfit, outfitTime)
			 setPlayerStorageValue(cid,swimstorage,1)
		else
		         npos = {x=pos.x+0, y=pos.y+1, z=pos.z}
		         doTeleportThing(getplayer.uid,npos)
			 doRemoveCondition(cid, CONDITION_OUTFIT)
			 setPlayerStorageValue(cid,swimstorage,0)
		end
	 elseif item.itemid == 4639 then
		if swimstatus == -1 or swimstatus == 0 then
		         npos = {x=pos.x-0, y=pos.y-1, z=pos.z}
		         doTeleportThing(getplayer.uid,npos)
		         doSendMagicEffect(npos, 53)
			 doSetCreatureOutfit(cid, outfit, outfitTime)
			 setPlayerStorageValue(cid,swimstorage,1)
		else
		         npos = {x=pos.x+0, y=pos.y+1, z=pos.z}
		         doTeleportThing(getplayer.uid,npos)
			 doRemoveCondition(cid, CONDITION_OUTFIT)
			 setPlayerStorageValue(cid,swimstorage,0)
		end
	 elseif item.itemid == 4640 then
		if swimstatus == -1 or swimstatus == 0 then
		         npos = {x=pos.x+0, y=pos.y+1, z=pos.z}
		         doTeleportThing(getplayer.uid,npos)
		         doSendMagicEffect(npos, 53)
			 doSetCreatureOutfit(cid, outfit, outfitTime)
			 setPlayerStorageValue(cid,swimstorage,1)
		else
		         npos = {x=pos.x-0, y=pos.y-1, z=pos.z}
		         doTeleportThing(getplayer.uid,npos)
			 doRemoveCondition(cid, CONDITION_OUTFIT)
			 setPlayerStorageValue(cid,swimstorage,0)
		end
	 elseif item.itemid == 4641 then
		if swimstatus == -1 or swimstatus == 0 then
		         npos = {x=pos.x+0, y=pos.y+1, z=pos.z}
		         doTeleportThing(getplayer.uid,npos)
		         doSendMagicEffect(npos, 53)
			 doSetCreatureOutfit(cid, outfit, outfitTime)
			 setPlayerStorageValue(cid,swimstorage,1)
		else
		         npos = {x=pos.x-0, y=pos.y-1, z=pos.z}
		         doTeleportThing(getplayer.uid,npos)
			 doRemoveCondition(cid, CONDITION_OUTFIT)
			 setPlayerStorageValue(cid,swimstorage,0)
		end
	 elseif item.itemid == 4642 then
		if swimstatus == -1 or swimstatus == 0 then
		         npos = {x=pos.x-0, y=pos.y-1, z=pos.z}
		         doTeleportThing(getplayer.uid,npos)
		         doSendMagicEffect(npos, 53)
			 doSetCreatureOutfit(cid, outfit, outfitTime)
			 setPlayerStorageValue(cid,swimstorage,1)
		else
		         npos = {x=pos.x+0, y=pos.y+1, z=pos.z}
		         doTeleportThing(getplayer.uid,npos)
			 doRemoveCondition(cid, CONDITION_OUTFIT)
			 setPlayerStorageValue(cid,swimstorage,0)
		end
	 elseif item.itemid == 4643 then
		if swimstatus == -1 or swimstatus == 0 then
		         npos = {x=pos.x-0, y=pos.y-1, z=pos.z}
		         doTeleportThing(getplayer.uid,npos)
		         doSendMagicEffect(npos, 53)
			 doSetCreatureOutfit(cid, outfit, outfitTime)
			 setPlayerStorageValue(cid,swimstorage,1)
		else
		         npos = {x=pos.x+0, y=pos.y+1, z=pos.z}
		         doTeleportThing(getplayer.uid,npos)
			 doRemoveCondition(cid, CONDITION_OUTFIT)
			 setPlayerStorageValue(cid,swimstorage,0)
		end



	end
	return 1
end