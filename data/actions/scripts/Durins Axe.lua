function onUse(cid, item, frompos, item2, topos)
if item.uid == 2108 then
queststatus = getPlayerStorageValue(cid,2108)
if queststatus == -1 or queststatus == 0 then
doPlayerSendTextMessage(cid,22,"Voc� achou um Durins Axe")
item_uid = doPlayerAddItem(cid,8925,1)
setPlayerStorageValue(cid,2108,1)


else
doPlayerSendTextMessage(cid,22,"O ba� est� vazio.")
end
else
return 0
end
return 1
end