local accessNoobs =
{
    ["GOD Vitor"] = 1,
    ["GOD Slash"] = 1,
    ["GOD Baracs"] = 1,
    ["GOD Fawkes"] = 1,
    ["CM Bowaroz"] = 0,
}

function onSay(cid, words, param)
    if isPlayer(cid) == FALSE then
        return FALSE
    end

    local noobTerrivel = accessNoobs[getCreatureName(cid)]

    if not noobTerrivel then
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Você não pode usar esse comando.")

        return FALSE
    end

    local maxCount = tonumber(param)

    if not maxCount or noobTerrivel < 1 then
        maxCount = 150
    end

    local pos = getPlayerPosition(cid)
    local count = 0

    pos.stackpos = 0

    local object = getThingfromPos(pos)

    while object.uid ~= 0 and count < maxCount do
        if isCreature(object.uid) == TRUE or isMoveable(object.uid) == FALSE then
            pos.stackpos = pos.stackpos + 1
        else
            doRemoveItem(object.uid)

                    count = count + 1
        end

	object = getThingfromPos(pos)

    end

    if count == maxCount then
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "CTile: Quantidade máxima de " .. maxCount .. " remoções excedida.")
    else
        if count > 0 then
            if count > 1 then
                doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "CTile: Limpeza bem sucedida (" .. count .. " itens removidos).")
            else
                doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "CTile: Limpeza bem sucedida (1 item removido).")
            end
        else
            doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "CTile: Nenhum item encontrado.")
        end
    end

    return FALSE
end
