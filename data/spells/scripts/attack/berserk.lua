local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_HITAREA)

function onGetFormulaValues(cid, level, maglevel)

	local minMult = 15
	local maxMult = 25
	
	local minDmg = -((level / 5) + (maglevel * minMult))
	local maxDmg = -((level / 5) + (maglevel * maxMult))

	return minDmg, maxDmg
end

setCombatCallback(combat, CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

local area = createCombatArea(AREA_SQUARE1X1)
setCombatArea(combat, area)

function onCastSpell(cid, var)
	return doCombat(cid, combat, var)
end