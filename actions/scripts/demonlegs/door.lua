ction onUse(cid, item, frompos, item2, topos)

item.uid == 55557 and item.itemid == 5105 and pos == {x=1007, y=1032, z=7} then
        if getPlayerStorageValue(cid,55551) == -1 or getPlayerStorageValue(cid,55552) == -1 or getPlayerStorageValue(cid,55553) == -1 or getPlayerStorageValue(cid,55554) == -1 or getPlayerStorageValue(cid,55555) == -1 then
            doTransformItem(item.uid,item.itemid+1)
            doPlayerSendTextMessage(cid,MESSAGE_EVENT_ADVANCE,'Sorry, but you did not close all gates!')
        else
            doPlayerSendTextMessage(cid,MESSAGE_EVENT_ADVANCE,'You absorbed enough energy! You may pass.')
        end
    end