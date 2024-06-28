function onUse(cid, item, frompos, item2, topos)
if item.uid == 3004 then
queststatus = getPlayerStorageValue(cid,3004)
if queststatus == -1 or queststatus == 0 then
doPlayerSendTextMessage(cid,22,"Você achou uma magma legs")
item_uid = doPlayerAddItem(cid,7894,1)
setPlayerStorageValue(cid,3004,1)

else
doPlayerSendTextMessage(cid,22,"O baú está vazio.")
end
else
return 0
end
return 1
end