local useWorms = FALSE
function onUse(cid, item, fromPosition, itemEx, toPosition)
	if itemEx.itemid >= 4608 and itemEx.itemid <= 4625 or itemEx.itemid == 493 then
		if item.itemid ~= 493 then
			if useWorms == FALSE or useWorms == TRUE and doPlayerRemoveItem(cid, ITEM_WORM, 1) == TRUE then
				if math.random(1, (100 + (getPlayerSkill(cid, SKILL_FISHING) / 10))) <= getPlayerSkill(cid, SKILL_FISHING) then
					doPlayerAddItem(cid, ITEM_FISH, 1)
				end
				doPlayerAddSkillTry(cid, SKILL_FISHING, 1)
			end
		end
		doSendMagicEffect(toPosition, CONST_ME_LOSEENERGY)
	else
		return FALSE
	end
	return TRUE
end