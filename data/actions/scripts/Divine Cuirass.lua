function onUse(cid, item, frompos, item2, topos)
if item.uid == 2100 then
queststatus = getPlayerStorageValue(cid,2100)
if queststatus == -1 or queststatus == 0 then
doPlayerSendTextMessage(cid,22,"Você achou uma Divine cuirass")
item_uid = doPlayerAddItem(cid,9776,1)
setPlayerStorageValue(cid,2100,1)


else
doPlayerSendTextMessage(cid,22,"O baú está vazio.")
end
else
return 0
end
return 1
end