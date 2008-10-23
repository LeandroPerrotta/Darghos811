local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_HEALING)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, FALSE)
setCombatParam(combat, COMBAT_PARAM_DISPEL, CONDITION_PARALYZE)

function onGetFormulaValues(cid, level, maglevel)

	local minMult = 16
	local maxMult = 24
	
	local minDmg = ((level / 2) + (maglevel * minMult))
	local maxDmg = ((level / 2) + (maglevel * maxMult))
	
	--print("level: ".. level .." maglevel: ".. maglevel .." min: ".. minDmg .." max: ".. maxDmg)	

	return minDmg, maxDmg
end

setCombatCallback(combat, CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

function onCastSpell(cid, var)
	return doCombat(cid, combat, var)
end