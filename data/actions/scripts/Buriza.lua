function onUse(cid, item, frompos, item2, topos)
if item.uid == 2106 then
queststatus = getPlayerStorageValue(cid,2106)
if queststatus == -1 or queststatus == 0 then
doPlayerSendTextMessage(cid,22,"Voc� achou um buriza")
item_uid = doPlayerAddItem(cid,8852,1)
setPlayerStorageValue(cid,2106,1)


else
doPlayerSendTextMessage(cid,22,"O ba� est� vazio.")
end
else
return 0
end
return 1
end