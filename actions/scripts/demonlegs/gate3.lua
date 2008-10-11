function onUse(cid, item, frompos, item2, topos)
if item.uid == 55553 then
  queststatus = getPlayerStorageValue(cid,60003)
  if queststatus == -1 or queststatus == 0 then
   doPlayerSendTextMessage(cid,22,"You have closed the Third hell gate.")
   item_uid = doPlayerAddItem(cid,2160,6)
   setPlayerStorageValue(cid,60003,1)

  else
   doPlayerSendTextMessage(cid,22,"The gate was closed before.")
  end
else
  return 0
end
return 1
end

