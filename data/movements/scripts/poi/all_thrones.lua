function onStepIn(cid, item, pos)
    if item.uid == 10001 then
        if getPlayerStorageValue(cid,12341) == -1 then
            setPlayerStorageValue(cid,12341,1)
            doPlayerSendTextMessage(cid,MESSAGE_EVENT_ADVANCE,'You have touched Verminor큦 throne and absorbed some of his spirit.')
        else
            doPlayerSendTextMessage(cid,MESSAGE_EVENT_ADVANCE,'You have already absorbed some of Veminor큦 spirit.')
        end
    elseif item.uid == 10002 then
        if getPlayerStorageValue(cid,12342) == -1 then
            setPlayerStorageValue(cid,12342,1)
            doPlayerSendTextMessage(cid,MESSAGE_EVENT_ADVANCE,'You have touched Infernatil큦 throne and absorbed some of his spirit.')
        else
            doPlayerSendTextMessage(cid,MESSAGE_EVENT_ADVANCE,'You have already absorbed some of Infernatil큦 spirit.')
        end
    elseif item.uid == 10003 then
        if getPlayerStorageValue(cid,12343) == -1 then
            setPlayerStorageValue(cid,12343,1)
            doPlayerSendTextMessage(cid,MESSAGE_EVENT_ADVANCE,'You have touched Tafariel큦 throne and absorbed some of his spirit.')
        else
            doPlayerSendTextMessage(cid,MESSAGE_EVENT_ADVANCE,'You have already absorbed some of Tafariel큦 spirit.')
        end
    elseif item.uid == 10004 then
        if getPlayerStorageValue(cid,12344) == -1 then
            setPlayerStorageValue(cid,12344,1)
            doPlayerSendTextMessage(cid,MESSAGE_EVENT_ADVANCE,'You have touched Apocalypse큦 throne and absorbed some of his spirit.')
        else
            doPlayerSendTextMessage(cid,MESSAGE_EVENT_ADVANCE,'You have already absorbed some of Apocalypse큦 spirit.')
        end
    elseif item.uid == 10005 then
        if getPlayerStorageValue(cid,12345) == -1 then
            setPlayerStorageValue(cid,12345,1)
            doPlayerSendTextMessage(cid,MESSAGE_EVENT_ADVANCE,'You have touched Pumin큦 throne and absorbed some of his spirit.')
        else
            doPlayerSendTextMessage(cid,MESSAGE_EVENT_ADVANCE,'You have already absorbed some of Pumin큦 spirit.')
        end

    elseif item.uid == 10006 then
        if getPlayerStorageValue(cid,12346) == -1 then
            setPlayerStorageValue(cid,12346,1)
            doPlayerSendTextMessage(cid,MESSAGE_EVENT_ADVANCE,'You have touched Ashfalor큦 throne and absorbed some of his spirit.')
        else
            doPlayerSendTextMessage(cid,MESSAGE_EVENT_ADVANCE,'You have already absorbed some of Ashfalor큦 spirit.')
        end
    elseif item.uid == 22222 and item.itemid == 351 then
        if getPlayerStorageValue(cid,12341) == 1 
		and getPlayerStorageValue(cid,12342) == 1 
		and getPlayerStorageValue(cid,12343) == 1 
		and getPlayerStorageValue(cid,12344) == 1 
		and getPlayerStorageValue(cid,12345) == 1 
		and getPlayerStorageValue(cid,12346) == 1 then  
	    doPlayerSendTextMessage(cid,MESSAGE_EVENT_ADVANCE,'You absorbed enough energy! You may pass.')
        
			else			
			doPlayerSendTextMessage(cid,MESSAGE_EVENT_ADVANCE,'Sorry, but you did not absorb enough energy!')
			doTeleportThing(cid, {x = getPlayerPosition(cid).x + 1, y = getPlayerPosition(cid).y, z = getPlayerPosition(cid).z}, FALSE)
		end
    end
    return 1
end