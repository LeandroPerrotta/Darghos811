-------By Far Carder------
-----------------start of config-----------------------------------------------------------------------What the formula looks like---------------
local level = 50 ----- change this to make the npc hit more/less---------------------|damage_min = (level * 2 + maglevel * 3) * min_multiplier |
local maglevel = 30 ----- change this to make the npc hit more/less -----------------|damage_max = (level * 2 + maglevel * 3) * max_multiplier |
local min_multiplier = 5.1 ----- change this to make the npc hit more/less ----------|damage_formula = math.random(damage_min,damage_max) |
local max_multiplier = 10.2 ----- change this to make the npc hit more/less ---------------------------------------------------------------------
local check_interval = 5 ----- change this to the time between checks for a creature (the less time the more it will probably lag :S)
local radiusx = 7 ----- change this to the amount of squares left/right the NPC checks (default 7 so he checks 7 squares left of him and 7 squares right (the hole screen)
local radiusy = 5 ----- change this to the amount of squares left/right the NPC checks (default 5 so he checks 5 squares up of him and 5 squares down (the hole screen)
local Attack_message = "One Invasor! DIE!!!" ----- change this to what the NPC says when he sees a monster(s)
local town_name = "Quendor" ----- the name of the town the NPC says when you say "hi"
local Attack_monsters = FALSE ----- set to TRUE for the npc to attack monsters in his area or FALSE if he doesnt
local Attack_swearers = FALSE ----- set to TRUE for the npc to attack players that swear near him or FALSE if he doesnt
local Attack_pkers = TRUE ----- set to TRUE for the npc to attack players with white and red skulls or FALSE if he doesnt -- NOTE: Set this to FALSE if you are using TFS as there is no way to tell if a player is skulled on TFS, you will only get errors
local health_left = 100 ----- set to the amount of health the npc will leave a player with if they swear at him (ie at 10 he will hit the player to 10 health left)
local swear_message = "You are not welcome at Quendor!" ----- change this to what you want the NPC to say when he attackes a swearer
local swear_words = {"######", "######", "######", "fdp", "tnc", "pau no ######", "pnc"} ----- if "Attack_swearers" is set to TRUE then the NPC will attack anyone who says a word in here. Remember to put "" around each word and seperate each word with a comma (,)
local hit_effect = CONST_ME_MORTAREA ----- set this to the magic effect the creature will be hit with, see global.lua for more effects
local damage_colour = TEXTCOLOR_RED ----- set this to the colour of the text that shows the damage when the creature gets hit
------------------end of config------------------
local check_clock = os.clock() ----- leave this
local focus = 0 ----- leave this
function msgcontains(txt, str)
return (string.find(txt, str) and not string.find(txt, '(%w+)' .. str) and not string.find(txt, str .. '(%w+)'))
end

function onCreatureSay(cid, type, msg)
msg = string.lower(msg)
health = getPlayerHealth(cid) - health_left
if ((string.find(msg, '(%a*)hi(%a*)'))) and getDistanceToCreature(cid) < 4 then
selfSay('Hello ' .. creatureGetName(cid) .. '! I am a defender of '..town_name..'.')
doNpcSetCreatureFocus(cid)
focus = 0
end
if msgcontains(msg, 'time') then
selfSay('Time to eat.')
end
if messageIsInArray(swear_words, msg) then
if Attack_swearers == TRUE then
selfSay('' .. swear_message ..' ')
doPlayerAddHealth(cid,-health)
doSendMagicEffect(getThingPos(cid),17)
doSendAnimatedText(getThingPos(cid),health,180)
doNpcSetCreatureFocus(cid)
focus = 0
end
end
end

function getMonstersfromArea(pos, radiusx, radiusy, stack)
local monsters = { }
local starting = {x = (pos.x - radiusx), y = (pos.y - radiusy), z = pos.z, stackpos = stack}
local ending = {x = (pos.x + radiusx), y = (pos.y + radiusy), z = pos.z, stackpos = stack}
local checking = {x = starting.x, y = starting.y, z = starting.z, stackpos = starting.stackpos}
repeat
creature = getThingfromPos(checking)
if creature.itemid > 0 then
if isCreature(creature.uid) == TRUE then
if isPlayer(creature.uid) == FALSE then
if Attack_monsters == TRUE then
table.insert (monsters, creature.uid)
check_clock = os.clock()
end
elseif isPlayer(creature.uid) == TRUE then
if Attack_pkers == TRUE then
if getPlayerSkull(creature.uid) > 0 then
table.insert (monsters, creature.uid)
check_clock = os.clock()
end
end
end
end
end
if checking.x == pos.x-1 and checking.y == pos.y then
checking.x = checking.x+2
else
checking.x = checking.x+1
end
if checking.x > ending.x then
checking.x = starting.x
checking.y = checking.y+1
end
until checking.y > ending.y
return monsters
end

function onThink()
if (Attack_monsters == TRUE and Attack_pkers == TRUE) or (Attack_monsters == TRUE and Attack_pkers == FALSE) or (Attack_monsters == FALSE and Attack_pkers == TRUE) then
if (os.clock() - check_clock) > check_interval then
monster_table = getMonstersfromArea(getCreaturePosition(getNpcCid( )), radiusx, radiusy, 253)
if #monster_table >= 1 then
selfSay('' .. Attack_message ..' ')
for i = 1, #monster_table do
doNpcSetCreatureFocus(monster_table[i])
local damage_min = (level * 2 + maglevel * 3) * min_multiplier
local damage_max = (level * 2 + maglevel * 3) * max_multiplier
local damage_formula = math.random(damage_min,damage_max)
doSendMagicEffect(getThingPos(monster_table[i]),17)
doCreatureAddHealth(monster_table[i],-damage_formula) doSendMagicEffect(getThingPos(monster_table[i]),hit_effect)
doSendAnimatedText(getThingPos(monster_table[i]),damage_formula,damage_colour)
check_clock = os.clock()
focus = 0
end
elseif table.getn(monster_table) < 1 then
focus = 0
check_clock = os.clock()
end
end
end
focus = 0
end