function onUse(cid, item, frompos, item2, topos)
if item.uid == 3020 then
queststatus = getPlayerStorageValue(cid,3020)
if queststatus == -1 or queststatus == 0 then
doPlayerSendTextMessage(cid,22,"Voc� achou uma blue robe")
item_uid = doPlayerAddItem(cid,2656,1)
setPlayerStorageValue(cid,3020,1)

else
doPlayerSendTextMessage(cid,22,"O ba� est� vazio.")
end
else
return 0
end
return 1
end