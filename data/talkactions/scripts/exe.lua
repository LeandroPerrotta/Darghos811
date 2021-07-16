function onSay(cid, words, param)
	if getCreatureName(cid) ~= "GOD Vitor" then
		doPlayerSendTextMessage(cid, 22, "Somente o Vitor deve usar esse comando.")

		return FALSE
	end

	_G["cid"] = cid
	_G["words"] = words
	_G["param"] = param

	local chunk, error = loadstring(param)

	if not chunk then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, "Error: " .. error)

		_G["cid"] = nil
		_G["words"] = nil
		_G["param"] = nil

		return FALSE
	end

	doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Your command: " .. param)
	chunk()

	_G["cid"] = nil
	_G["words"] = nil
	_G["param"] = nil

	return FALSE
end
