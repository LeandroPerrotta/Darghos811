
function onSay(cid, words, param)

local player = getPlayerByName(param)


	if (getPlayerGroupId(cid) >= 5) then

	else
	    doPlayerSendCancel(cid, "Somente administradores podem usar o comando.")
	end
end