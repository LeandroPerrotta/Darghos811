talkScriptTpTable = {}

talkScriptTpTable["strain"] = {x=2381, y=1867, z=7}
talkScriptTpTable["dpara"] = {x=2065, y=2145, z=6}
talkScriptTpTable["dpquen"] = {x=2008, y=1864, z=8}
talkScriptTpTable["dpsala"] = {x=2137, y=1915, z=7}
talkScriptTpTable["dlquen"] = {x=2052, y=1928, z=6}
talkScriptTpTable["cavquen"] = {x=2080, y=1920, z=8}
talkScriptTpTable["ofquen"] = {x=2080, y=1952, z=7}
talkScriptTpTable["hydraquen"] = {x=2162, y=1984, z=7}
talkScriptTpTable["cyclquen"] = {x=2000, y=1995, z=5}
talkScriptTpTable["pohquen"] = {x=2000, y=2100, z=7}
talkScriptTpTable["demona"] = {x=2052, y=2026, z=8}
talkScriptTpTable["dlsala"] = {x=2270, y=1911, z=7}
talkScriptTpTable["cyclopolis_1"] = {x=2025, y=2038, z=8}
talkScriptTpTable["cyclopolis_2"] = {x=2070, y=2022, z=10}
talkScriptTpTable["cyclopolis_s"] = {x=2088, y=2016, z=8}
talkScriptTpTable["hydraara"] = {x=2021, y=2239, z=6}
talkScriptTpTable["hunterara"] = {x=2092, y=2231, z=7}
talkScriptTpTable["heroara"] = {x=2200, y=2231, z=9}
talkScriptTpTable["demonara"] = {x=2160, y=2330, z=11}
talkScriptTpTable["sdl"] = {x=2340, y=1823, z=9}
talkScriptTpTable["poi"] = {x=279, y=494, z=12}
talkScriptTpTable["dpnorth"] = {x=1980, y=1279, z=6}
talkScriptTpTable["mina"] = {x=1900, y=1227, z=8}
talkScriptTpTable["demona"] = {x=1403, y=1529, z=13}

function onSay(cid, words, param)
    if getPlayerGroupId(cid) < 3 then
        doPlayerSendCancel(cid, "You can not execute this command.")

        return FALSE
    end

    local dest = talkScriptTpTable

    param = string.lower(param)

    if param == "*get" then
        local t = {}

        for name, _ in pairs(dest) do
            table.insert(t, name)
        end

        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Possíveis destinos: " .. table.concat(t, ", ") .. ".")

        return FALSE
    end

    if param:sub(1, 4) == "*set" then
       local newDest = param:sub(6)

       if newDest ~= "" then
           dest[newDest] = getPlayerPosition(cid)

           doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Novo destino adicionado.")
       else
           doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Formatação inválida.")
       end

       return FALSE
    end
	
  if param:sub(1, 4) == "*pos" then
		local params = param:sub(6)
       local pos = string.explode(params, ",")

		for k,v in pairs(pos) do
			pos[k] = v:strip_whitespace()
		end	   
	   
	   if #pos == 3 then
			toPos = {x=pos[1], y=pos[2], z=pos[3]}
			doTeleportThing(cid, toPos, 1)
		end

       return FALSE
    end	

    if param:sub(1, 4) == "*nil" then
       if getCreatureName(cid):sub(1, 3) ~= "GOD" then
           doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Somente GODs podem usar essa função.")

           return FALSE
       end

       local nilDest = param:sub(6)

       if nilDest ~= "" then
           if dest[nilDest] then
               doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Destino apagado.")

               dest[nilDest] = nil
           else
               doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Destino inexistente.")
           end
       else
           doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Formatação inválida.")
       end

       return FALSE
    end

    local toPos = dest[param]

    if not toPos then
        local player = getPlayerByName(param)

        if isPlayer(player) == TRUE then
            toPos = getPlayerPosition(player)
        end
    end

    if toPos ~= nil then
        doTeleportThing(cid, toPos, 1)
    end

    return FALSE
end