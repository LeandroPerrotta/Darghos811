function onUse(cid, item, frompos, item2, topos)
--Rats Quest
--Rapier
if item.uid == 8650 then
    queststatus = getPlayerStorageValue(cid,8650)
if queststatus == -1 then
           doPlayerSendTextMessage(cid,22,"You have found Rapier")
doPlayerAddItem(cid,2384,1)
setPlayerStorageValue(cid,8650,1)
else
                doPlayerSendTextMessage(cid,22,"It is empty.")
end

--Trolls Quest
--Studded Shield
elseif item.uid == 8651 then
    queststatus = getPlayerStorageValue(cid,8651)
if queststatus == -1 then
           doPlayerSendTextMessage(cid,22,"You have found Studded Shield")
doPlayerAddItem(cid,2526,1)
setPlayerStorageValue(cid,8651,1)
else
                doPlayerSendTextMessage(cid,22,"It is empty.")
end

--Machete
elseif item.uid == 8652 then
    queststatus = getPlayerStorageValue(cid,8652)
if queststatus == -1 then
           doPlayerSendTextMessage(cid,22,"You have found Machete")
doPlayerAddItem(cid,2420,1)
setPlayerStorageValue(cid,8652,1)
else
                doPlayerSendTextMessage(cid,22,"It is empty.")
end

--Mino Quest
--Chain Armor
elseif item.uid == 8653 then
    queststatus = getPlayerStorageValue(cid,8653)
if queststatus == -1 then
           doPlayerSendTextMessage(cid,22,"You have found Chain Armor")
doPlayerAddItem(cid,2464,1)
setPlayerStorageValue(cid,8653,1)
else
                doPlayerSendTextMessage(cid,22,"It is empty.")
end

--Fishing Rod
elseif item.uid == 8654 then
    queststatus = getPlayerStorageValue(cid,8654)
if queststatus == -1 then
           doPlayerSendTextMessage(cid,22,"You have found Fishing Rod")
doPlayerAddItem(cid,2580,1)
setPlayerStorageValue(cid,8654,1)
else
                doPlayerSendTextMessage(cid,22,"It is empty.")
end

--Skeleton Quest
--Viking Helmet
elseif item.uid == 8655 then
    queststatus = getPlayerStorageValue(cid,8655)
if queststatus == -1 then
           doPlayerSendTextMessage(cid,22,"You have found Viking Helmet")
doPlayerAddItem(cid,2473,1)
setPlayerStorageValue(cid,8655,1)
else
                doPlayerSendTextMessage(cid,22,"It is empty.")
end

--Studded Legs
elseif item.uid == 8656 then
    queststatus = getPlayerStorageValue(cid,8656)
if queststatus == -1 then
           doPlayerSendTextMessage(cid,22,"You have found Studded Legs")
doPlayerAddItem(cid,2468,1)
setPlayerStorageValue(cid,8656,1)
else
                doPlayerSendTextMessage(cid,22,"It is empty.")
end

--Orcs Quest
--Carlin Sword
elseif item.uid == 8657 then
    queststatus = getPlayerStorageValue(cid,8657)
if queststatus == -1 then
           doPlayerSendTextMessage(cid,22,"You have found Carlin Sword")
doPlayerAddItem(cid,2395,1)
setPlayerStorageValue(cid,8657,1)
else
                doPlayerSendTextMessage(cid,22,"It is empty.")
end

--Katana & Plate Shield Quest (Rotworm Quest)
--Katana
elseif item.uid == 8658 then
    queststatus = getPlayerStorageValue(cid,8658)
if queststatus == -1 then
           doPlayerSendTextMessage(cid,22,"You have found Katana")
doPlayerAddItem(cid,2412,1)
setPlayerStorageValue(cid,8658,1)
else
                doPlayerSendTextMessage(cid,22,"It is empty.")
end

--Plate Shield
elseif item.uid == 8659 then
    queststatus = getPlayerStorageValue(cid,8659)
if queststatus == -1 then
           doPlayerSendTextMessage(cid,22,"You have found Plate Shield")
doPlayerAddItem(cid,2510,1)
setPlayerStorageValue(cid,8659,1)
else
                doPlayerSendTextMessage(cid,22,"It is empty.")
end

--Dream Sword Quest
--Spike Sword
elseif item.uid == 8660 then
    queststatus = getPlayerStorageValue(cid,8660)
if queststatus == -1 then
           doPlayerSendTextMessage(cid,22,"You have found Spike Sword")
doPlayerAddItem(cid,2383,1)
setPlayerStorageValue(cid,8660,1)
else
                doPlayerSendTextMessage(cid,22,"It is empty.")
end

--Noob Quest (Hand Axe)
elseif item.uid == 8661 then
    queststatus = getPlayerStorageValue(cid,8661)
if queststatus == -1 then
           doPlayerSendTextMessage(cid,22,"You have found Hand Axe")
doPlayerAddItem(cid,2380,1)
setPlayerStorageValue(cid,8661,1)
else
                doPlayerSendTextMessage(cid,22,"It is empty.")
end

	else
		return 0
   	end

   	return 1
end