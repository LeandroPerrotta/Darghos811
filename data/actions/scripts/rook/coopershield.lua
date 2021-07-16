function onUse(cid, item, frompos, item2, topos)
if item.uid == 4406 then
  queststatus = getPlayerStorageValue(cid,4406)
  if queststatus == -1 or queststatus == 0 then
   doPlayerSendTextMessage(cid,22,"You have found a Copper shield.")
   item_uid = doPlayerAddItem(cid,2530,1)
   setPlayerStorageValue(cid,4406,1)

  else
   doPlayerSendTextMessage(cid,22,"it\'s empty.")
  end
else
  return 0
end
return 1
end
