function onUse(cid, item, frompos, item2, topos)
if item.uid == 2101 then
queststatus = getPlayerStorageValue(cid,2101)
if queststatus == -1 or queststatus == 0 then
doPlayerSendTextMessage(cid,22,"Você achou uma Legolas Plate ")
item_uid = doPlayerAddItem(cid,8891,1)
setPlayerStorageValue(cid,2101,1)


else
doPlayerSendTextMessage(cid,22,"O baú está vazio.")
end
else
return 0
end
return 1
end