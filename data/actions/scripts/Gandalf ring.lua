function onUse(cid, item, frompos, item2, topos)
if item.uid == 3002 then
queststatus = getPlayerStorageValue(cid,3002)
if queststatus == -1 or queststatus == 0 then
doPlayerSendTextMessage(cid,22,"Voc� achou um gandalf ring")
item_uid = doPlayerAddItem(cid,2357,1)
setPlayerStorageValue(cid,3002,1)

else
doPlayerSendTextMessage(cid,22,"O ba� est� vazio.")
end
else
return 0
end
return 1
end