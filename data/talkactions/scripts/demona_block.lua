function onSay(cid, words, param)

   paredepos = { x=2052, y=2025, z=7, stackpos=1 } -- pos da parede
   maxdist = 3 -- qntos SQM de distância o player tem que ficar lonje da parede
   playerpos = getPlayerPosition(cid)
   if math.max(math.abs(playerpos.x-paredepos.x), math.abs(playerpos.y-paredepos.y)) < maxdist then
  parede = getThingfromPos(paredepos)
  doRemoveItem(parede.uid,1)
  doSendAnimatedText(playerpos, "OPEN!", 120)
  return 0
   else
   end
   return 1
end