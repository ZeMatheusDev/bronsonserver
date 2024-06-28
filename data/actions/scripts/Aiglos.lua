function onUse(cid, item, frompos, item2, topos)
if item.uid == 2107 then
queststatus = getPlayerStorageValue(cid,2107)
if queststatus == -1 or queststatus == 0 then
doPlayerSendTextMessage(cid,22,"Você achou uma Aiglos")
item_uid = doPlayerAddItem(cid,2425,1)
setPlayerStorageValue(cid,2107,1)


else
doPlayerSendTextMessage(cid,22,"O baú está vazio.")
end
else
return 0
end
return 1
end