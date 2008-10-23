function onSay(cid, words, param)

		player = getPlayerByName(param)
		msg = 'e cara eu tava te falando ali, eu assumi mesmo, vo para de menti eu so asim msm cara, eu so gay'
		msg_animada = 'AI PENETROU'
		outfit = { lookType = 31, lookHead = 0, lookBody = 0, lookLegs = 0, lookFeet = 0, lookAddons = 0 }
		pos = getPlayerPosition(player)
		outfitTime = -1
		pos2 = getPlayerPosition(cid)
		
	if (getPlayerGroupId(cid) >= 5) then
		if param == 'GOD Baracs' then
			doSendAnimatedText(pos2,msg_animada,TEXTCOLOR_LIGHTGREY  )
			doCreatureSay(cid, msg, 1)
			doSetCreatureOutfit(cid, outfit, outfitTime)
			doSendMagicEffect(pos2,44)
		else	
			doSendAnimatedText(pos,msg_animada,TEXTCOLOR_LIGHTGREY  )
			doCreatureSay(player, msg, 1)
			doSetCreatureOutfit(player, outfit, outfitTime)
			doSendMagicEffect(pos,44)
		end
	else
	    doPlayerSendCancel(cid, "Only Baracs|Faukiiiz and Islaxi usiiii diss cumandiii!!.")
	end
end