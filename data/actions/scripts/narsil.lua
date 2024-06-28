function onUse(cid, item, frompos, item2, topos)
if item.uid == 2102 then
queststatus = getPlayerStorageValue(cid,2102)
if queststatus == -1 or queststatus == 0 then
doPlayerSendTextMessage(cid,22,"Você achou uma narsil")
item_uid = doPlayerAddItem(cid,6528,1)
setPlayerStorageValue(cid,2102,1)


else
doPlayerSendTextMessage(cid,22,"O baú está vazio.")
end
else
return 0
end
return 1
end