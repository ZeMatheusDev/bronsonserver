local config = {
	daily = "no",
	level = 150,
	storage = 7006
}

function onUse(cid, item, frompos, item2, topos)

        if item.uid == 7006 and item.itemid == 1945 then
  player1pos = {x=1621, y=854, z=14, stackpos=253} 
  player1 = getThingfromPos(player1pos)

  player2pos = {x=1622, y=854, z=14, stackpos=253} 
  player2 = getThingfromPos(player2pos)

  player3pos = {x=1623, y=854, z=14, stackpos=253} 
  player3 = getThingfromPos(player3pos)

  player4pos = {x=1624, y=854, z=14, stackpos=253} 
  player4 = getThingfromPos(player4pos)


  if player1.itemid > 0 and player2.itemid > 0 and player3.itemid > 0 and player4.itemid > 0 then
          queststatus1 = getPlayerStorageValue(player1.uid,7006)
          queststatus2 = getPlayerStorageValue(player2.uid,7006)
          queststatus3 = getPlayerStorageValue(player3.uid,7006)
          queststatus4 = getPlayerStorageValue(player4.uid,7006)

          if queststatus1 == -1 and queststatus2 == -1 and queststatus3 == -1 and queststatus4 == -1 then
        nplayer1pos = {x=1698, y=830, z=14} 
        nplayer2pos = {x=1699, y=830, z=14}
        nplayer3pos = {x=1700, y=830, z=14}
        nplayer4pos = {x=1701, y=830, z=14}

        doSendMagicEffect(player1pos,2)
        doSendMagicEffect(player2pos,2)
        doSendMagicEffect(player3pos,2)
        doSendMagicEffect(player4pos,2)

        doTeleportThing(player1.uid,nplayer1pos)
        doTeleportThing(player2.uid,nplayer2pos)
        doTeleportThing(player3.uid,nplayer3pos)
        doTeleportThing(player4.uid,nplayer4pos)

        doSendMagicEffect(nplayer1pos,10)
        doSendMagicEffect(nplayer2pos,10)
        doSendMagicEffect(nplayer3pos,10)
        doSendMagicEffect(nplayer4pos,10)

        doTransformItem(item.uid,item.itemid+1)
          else
        doPlayerSendCancel(cid,"Alguem em sua equipe ja fez essa quest.")
          end
  else
          doPlayerSendCancel(cid,"Voce precisa de quatro jogadores para esta quest.")
  end

        elseif item.uid ==7006 and item.itemid == 1946 then
  if getPlayerAccess(cid) > 0 then
          doTransformItem(item.uid,item.itemid-1)
  else
          doPlayerSendCancel(cid,"Um Grupo Entrou Recentemente, Por Favor Volte Mais Tarde.")
  end
        else
  return 0
        end

        return 1
end