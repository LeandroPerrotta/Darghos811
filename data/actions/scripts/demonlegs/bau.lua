function onUse(cid, item, frompos, item2, topos)
if item.uid == 55556 then
  queststatus = getPlayerStorageValue(cid,60006)
  if queststatus == -1 or queststatus == 0 then
   doPlayerSendTextMessage(cid,22,"You have found a Demon Legs.")
   item_uid = doPlayerAddItem(cid,2495,1)
   setPlayerStorageValue(cid,60006,1)

  else
   doPlayerSendTextMessage(cid,22,"it\'s empty.")
  end
else
  return 0
end
return 1
end

