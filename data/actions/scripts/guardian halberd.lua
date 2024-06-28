function onUse(cid, item, frompos, item2, topos)
if item.uid == 1047 then
queststatus = getPlayerStorageValue(cid,1047)
if queststatus == -1 or queststatus == 0 then
doPlayerSendTextMessage(cid,22,"Você achou uma guardian halberd.")
item_uid = doPlayerAddItem(cid,2427,1)
setPlayerStorageValue(cid,1047,1)


else
doPlayerSendTextMessage(cid,22,"O baú está vazio.")
end
else
return 0
end
return 1
end