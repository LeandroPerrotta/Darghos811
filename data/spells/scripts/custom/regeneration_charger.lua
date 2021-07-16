local SPELL_TIME = 5 -- in seconds
--local DELAY_TIME = 10 -- in seconds
local HEALTH_TICKS = 5 -- in seconds
local MANA_TICKS = 5 -- in seconds

local acombat = createCombatObject()
	setCombatParam(acombat, COMBAT_PARAM_EFFECT, CONST_ME_HOLYAREA)
	setCombatParam(acombat, COMBAT_PARAM_AGGRESSIVE, FALSE)

local combat = createCombatObject()
	setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, FALSE)

local condition = createConditionObject(CONDITION_REGENARATION)
	setConditionParam(condition, CONDITION_PARAM_TICKS, SPELL_TIME * 1000)
	--setConditionParam(condition, CONDITION_PARAM_DELAYED, DELAY_TIME * 1000)
	setConditionParam(condition, CONDITION_PARAM_HEALTICKS, HEALTH_TICKS)
	setConditionParam(condition, CONDITION_PARAM_MANATICKS, MANA_TICKS)
	setCombatCondition(combat, condition)

local arr = {
	{0, 0, 1, 0, 0},
	{0, 1, 1, 1, 0},
	{1, 1, 3, 1, 1},
	{0, 1, 1, 1, 0},
	{0, 0, 1, 0, 0}
}

local area = createCombatArea(arr)
setCombatArea(acombat, area)

function onTargetCreature(cid, target)
	if (isPlayer(target) == TRUE) then
		local arr = {acombat, combat}
		local combatEx = arr[math.random(1, 10)]
		if (combatEx) then
			doCombat(cid, combat, numberToVariant(target))	
		end
	end
	return TRUE
end

setCombatCallback(acombat, CALLBACK_PARAM_TARGETCREATURE, "onTargetCreature")

function onCastSpell(cid, var)
	return doCombat(cid, acombat, var)
end
