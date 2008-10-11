function onSay(cid)
    if (getPlayerGroupId(cid) >= 3) then       
		local saveTime1 = os.time()
        broadcastMessage("Sistema pausado para salvamento, aguarde um momento...", MESSAGE_STATUS_CONSOLE_BLUE)
		saveData()
		local saveTime2 = os.time()
		local saveDataTime = os.difftime (saveTime2, saveTime1)
		broadcastMessage("Sistema salvo com sucesso em ".. saveDataTime .. " segundo(s)!", MESSAGE_STATUS_CONSOLE_BLUE)
		print("MANUAL SERVER SAVE... [Salvo em ".. saveDataTime .."s]")
    else
        doPlayerSendCancel(cid, "You can not execute this command.")
    end
end  