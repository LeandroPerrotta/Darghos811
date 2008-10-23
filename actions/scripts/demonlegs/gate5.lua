function onUse(cid, item, frompos, item2, topos)
if item.uid == 55555 then
  queststatus = getPlayerStorageValue(cid,60005)
  if queststatus == -1 or queststatus == 0 then
   doPlayerSendTextMessage(cid,22,"You have closed the Fifth hell gate.")
   item_uid = doPlayerAddItem(cid,2160,5)
   setPlayerStorageValue(cid,60005,1)

  else
   doPlayerSendTextMessage(cid,22,"The gate was closed before.")
  end
else
  return 0
end
return 1
end

