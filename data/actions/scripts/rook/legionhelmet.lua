function onUse(cid, item, frompos, item2, topos)
if item.uid == 4408 then
  queststatus = getPlayerStorageValue(cid,4408)
  if queststatus == -1 or queststatus == 0 then
   doPlayerSendTextMessage(cid,22,"You have found a Legion Helmet.")
   item_uid = doPlayerAddItem(cid,2480,1)
   setPlayerStorageValue(cid,4408,1)

  else
   doPlayerSendTextMessage(cid,22,"it\'s empty.")
  end
else
  return 0
end
return 1
end
