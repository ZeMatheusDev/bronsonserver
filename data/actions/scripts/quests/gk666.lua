function onUse(cid, item, frompos, item2, topos)
if item.uid == 6670 then
queststatus = getPlayerStorageValue(cid,6670)
if queststatus == -1 then
doPlayerSendTextMessage(cid,22,"Voc� Ganhou Uma Golden Key!.")
doPlayerAddItem(cid,2091,1 )
setPlayerStorageValue(cid,6670,1)
else
doPlayerSendTextMessage(cid,22,"Voc� ja fez essa quest!")
end
else
return 0
end
return 1
end 