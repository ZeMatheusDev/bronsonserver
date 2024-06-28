function onUse(cid, item, frompos, item2, topos)

player1pos = {x=topos.x,y=topos.y, z=topos.z, stackpos=253}
player1 = getThingfromPos(player1pos)

nome = getPlayerName(player1.uid)
nivel = math.random(1,100)
mana = getPlayerMana(player1.uid)
health = getCreatureHealth(player1.uid)

if mana < 10 then

doPlayerSendTextMessage(cid,5,"Seu Merda ta sem Energia!")

elseif mana > 11 then

if health < 100 then

doPlayerSendTextMessage(cid,5,"Se Xerar mais vai Morrer FDP...")

elseif health > 101 then

if nivel > 1 and nivel < 74 then

doPlayerRemoveItem(cid,2692,1)
doPlayerSendTextMessage(cid,22,"LoL sem Canudinho...vc e FODA")
doPlayerAddMana(player1.uid,-500)
doSendMagicEffect(player1pos,2)
doCreatureSay(cid,"X.X To Noiadão!",2)
doSendAnimatedText(player1pos, "VIAJANDO...",35)

elseif nivel > 75 and nivel < 100 then

doCreatureAddHealth(player1.uid,-500)
doCreatureSay(cid, "QUI XEROX u.u",2)
doSendAnimatedText(player1pos, "OVERDOSE!",30)
doPlayerRemoveItem(cid,2692,1)
doPlayerSendTextMessage(cid,22,"LoL sem Canudinho...vc e FODA")
doSendMagicEffect(player1pos,2)

end
end
end
end