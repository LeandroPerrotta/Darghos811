local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_EARTHDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_CARNIPHILA)

function onGetFormulaValues(cid, level, maglevel)

	local minMult = 1.2
	local maxMult = 2.5
	
	local minDmg = -((level / 3) + (maglevel * minMult))
	local maxDmg = -((level / 3) + (maglevel * maxMult))

	return minDmg, maxDmg
end

setCombatCallback(combat, CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

local distanceCombat = createCombatObject()
setCombatParam(distanceCombat, COMBAT_PARAM_TYPE, COMBAT_EARTHDAMAGE)
setCombatParam(distanceCombat, COMBAT_PARAM_EFFECT, CONST_ME_CARNIPHILA)
setCombatParam(distanceCombat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_SMALLEARTH)

function onGetFormulaValues(cid, level, maglevel)

	local minMult = 1.2
	local maxMult = 2.5
	
	local minDmg = -((level / 3) + (maglevel * minMult))
	local maxDmg = -((level / 3) + (maglevel * maxMult))

	return minDmg, maxDmg
end

setCombatCallback(distanceCombat, CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

function onCastSpell(cid, var)
	if(variantToNumber(var) ~= 0) then
		return doCombat(cid, distanceCombat, var)
	end
	return doCombat(cid, combat, var)
end