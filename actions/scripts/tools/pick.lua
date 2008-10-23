--Pick script using action ids by AGS or God Lord
function onUse(cid, item, frompos, item2, topos)

aID = 777 --Action Id the ground tile must have to turn into a hole.
ticks = 30 --How many seconds the hole will last before turning into a normal tile again
topos = {x=topos.x, y=topos.y, z=topos.z}
GRASS = {4526, 4527, 4528, 4529, 4530, 4531, 4532, 4533, 4534, 4535, 4536, 4537, 4538, 4529, 4540, 4541, 4567, 4568, 4569, 4756}
DIRT = {351, 352, 353, 354, 355}

if item2.actionid == aID then
    if isInArray(GRASS, item2.itemid) == 1 then
        doTransformItem(item2.uid,469)
        doDecayItemTo(topos, item2.itemid, ticks)
    elseif isInArray(DIRT, item2.itemid) == 1 then
        doTransformItem(item2.uid,383)
        doDecayItemTo(topos, item2.itemid, ticks)
    elseif item2.itemid == 671 then
        doTransformItem(item2.uid,484)
        doDecayItemTo(topos, item2.itemid, ticks)    
    end
end
end