function onUse(cid, item, frompos, item2, topos)
if item.uid == 3012 then
queststatus = getPlayerStorageValue(cid,3012)
if queststatus == -1 or queststatus == 0 then
doPlayerSendTextMessage(cid,22,"Voc� achou um Phoenix Plate")
item_uid = doPlayerAddItem(cid,8877,1)
setPlayerStorageValue(cid,3012,1)

else
doPlayerSendTextMessage(cid,22,"O ba� est� vazio.")
end
else
return 0
end
return 1
end