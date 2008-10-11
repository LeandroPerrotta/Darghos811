local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_ENERGYAREA)

function onGetFormulaValues(cid, level, maglevel)

	local minMult = 3
	local maxMult = 3.8
	
	local minDmg = -((level / 3) + (maglevel * minMult))
	local maxDmg = -((level / 3) + (maglevel * maxMult))

	return minDmg, maxDmg
end

setCombatCallback(combat, CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

local area = createCombatArea(AREA_BEAM5, AREADIAGONAL_BEAM5)
setCombatArea(combat, area)

function onCastSpell(cid, var)
	return doCombat(cid, combat, var)
end