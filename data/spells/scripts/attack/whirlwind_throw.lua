local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_BLOCKARMOR, TRUE)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_WEAPONTYPE)

function getSpellDamage(cid, weaponSkill, weaponAttack, attackStrength)

	local meelePw = (weaponSkill * 1.14) + weaponAttack
	local minDmg = 0
	local maxDmg = meelePw * 1
	local damage = -(math.random(minDmg, maxDmg) * attackStrength) / 100

	return minDmg, damage
end

setCombatCallback(combat, CALLBACK_PARAM_SKILLVALUE, "getSpellDamage")

function onCastSpell(cid, var)
	return doCombat(cid, combat, var)
end 