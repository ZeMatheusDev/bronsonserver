function onUse(cid, item, frompos, item2, topos)
if item.uid == 3013 then
queststatus = getPlayerStorageValue(cid,3013)
if queststatus == -1 or queststatus == 0 then
doPlayerSendTextMessage(cid,22,"Voc� achou um vile axe ")
item_uid = doPlayerAddItem(cid,7388,1)
setPlayerStorageValue(cid,3013,1)

else
doPlayerSendTextMessage(cid,22,"O ba� est� vazio.")
end
else
return 0
end
return 1
end