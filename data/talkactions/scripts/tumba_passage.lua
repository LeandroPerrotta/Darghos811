function onSay(cid, words, param)

   paredepos = { x=2282, y=2550, z=11, stackpos=1 } -- pos da parede
   maxdist = 3 -- qntos SQM de distância o player tem que ficar lonje da parede
   playerpos = getPlayerPosition(cid)
   if math.max(math.abs(playerpos.x-paredepos.x), math.abs(playerpos.y-paredepos.y)) < maxdist then
  parede = getThingfromPos(paredepos)
  teleportPos = {x=2282, y=2549, z=11}										
  doTeleportThing(cid,teleportPos,1)
  doSendAnimatedText(playerpos, "Teleported.Nice!", 120)
  return 0
   else
   end
   return 1
end