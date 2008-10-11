function onUse(cid, item, frompos, item2, topos)
if item.uid == 4405 then
  queststatus = getPlayerStorageValue(cid,4405)
  if queststatus == -1 or queststatus == 0 then
   doPlayerSendTextMessage(cid,22,"You have found a Carlin Sword.")
   item_uid = doPlayerAddItem(cid,2395,1)
   setPlayerStorageValue(cid,4405,1)

  else
   doPlayerSendTextMessage(cid,22,"it\'s empty.")
  end
else
  return 0
end
return 1
end
