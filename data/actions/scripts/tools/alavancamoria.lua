local config = {
	daily = "no",
	level = 20,
	storage = 1220
}

function onUse(cid, item, frompos, item2, topos)

        if item.uid == 1220 and item.itemid == 1945 then
  player1pos = {x=994, y=696, z=11, stackpos=253} 
  player1 = getThingfromPos(player1pos)

  player2pos = {x=995, y=696, z=11, stackpos=253} 
  player2 = getThingfromPos(player2pos)

  player3pos = {x=996, y=696, z=11, stackpos=253} 
  player3 = getThingfromPos(player3pos)

  player4pos = {x=997, y=696, z=11, stackpos=253} 
  player4 = getThingfromPos(player4pos)


  if player1.itemid > 0 and player2.itemid > 0 and player3.itemid > 0 and player4.itemid > 0 then
          queststatus1 = getPlayerStorageValue(player1.uid,1220)
          queststatus2 = getPlayerStorageValue(player2.uid,1220)
          queststatus3 = getPlayerStorageValue(player3.uid,1220)
          queststatus4 = getPlayerStorageValue(player4.uid,1220)

          if queststatus1 == -1 and queststatus2 == -1 and queststatus3 == -1 and queststatus4 == -1 then
        nplayer1pos = {x=928, y=893, z=12} 
        nplayer2pos = {x=928, y=894, z=12}
        nplayer3pos = {x=928, y=895, z=12}
        nplayer4pos = {x=926, y=896, z=12}

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

        elseif item.uid ==1220 and item.itemid == 1946 then
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