function onUse(cid, item, frompos, item2, topos)
if item.uid == 3000 then
queststatus = getPlayerStorageValue(cid,3000)
if queststatus == -1 or queststatus == 0 then
doPlayerSendTextMessage(cid,22,"Voc� achou uma golden key")
item_uid = doPlayerAddItem(cid,2090,1)
setPlayerStorageValue(cid,3000,1)

else
doPlayerSendTextMessage(cid,22,"O ba� est� vazio.")
end
else
return 0
end
return 1
end