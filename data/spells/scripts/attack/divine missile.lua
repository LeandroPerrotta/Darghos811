local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_HOLYDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_HOLYDAMAGE)

function onGetFormulaValues(cid, level, maglevel)

	local minMult = 2.2
	local maxMult = 4
	
	local minDmg = -((level / 5) + (maglevel * minMult))
	local maxDmg = -((level / 5) + (maglevel * maxMult))

	return minDmg, maxDmg
end

setCombatCallback(combat, CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

local distanceCombat = createCombatObject()
setCombatParam(distanceCombat, COMBAT_PARAM_TYPE, COMBAT_HOLYDAMAGE)
setCombatParam(distanceCombat, COMBAT_PARAM_EFFECT, CONST_ME_HOLYDAMAGE)
setCombatParam(distanceCombat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_SMALLHOLY)

function onGetFormulaValues(cid, level, maglevel)

	local minMult = 2.2
	local maxMult = 4
	
	local minDmg = -((level / 5) + (maglevel * minMult))
	local maxDmg = -((level / 5) + (maglevel * maxMult))

	return minDmg, maxDmg
end

setCombatCallback(distanceCombat, CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

function onCastSpell(cid, var)
	if(variantToNumber(var) ~= 0) then
		return doCombat(cid, distanceCombat, var)
	end
	return doCombat(cid, combat, var)
end