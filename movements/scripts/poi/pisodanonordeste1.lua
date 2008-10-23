function onStepIn(cid, item, pos)
---Action by Jovial---

--Config--
voc = 4    --0 = no vocation, 1 = sorcerer, 2 = druida, 3 = paladin, 4 = knight--
voc2 = 1
voc3 = 3 
vocProm = voc + 4
vocProm2 = voc2 + 4
vocProm3 = voc3 + 4

dano = 300 --quanto ira tirar de vida
cor = 180 --cor da letra do hit 5=azul, 180=red, etc
efeito = 3  --numero do efeito desejado
--End Config--

hp = getCreatureHealth(cid)
topos = getPlayerPosition(cid)
pvoc = getPlayerVocation(cid)
pvoc3 = getPlayerVocation(cid)
pvoc2 = getPlayerVocation(cid)

if voc == pvoc or voc2 == pvoc or voc3 == pvoc or vocProm == pvoc or vocProm2 == pvoc or vocProm3 == pvoc then
if getCreatureHealth(cid) >= dano then
doCreatureAddHealth(cid, -dano)
doSendAnimatedText(topos, dano, cor)
  doSendMagicEffect(topos, efeito)
else
doCreatureAddHealth(cid, -hp)
doSendAnimatedText(topos, hp, cor)
  doSendMagicEffect(topos, efeito)
end
end
return 1
end