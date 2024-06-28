function onUse(cid, item, frompos, item2, topos)
if item.uid == 2104 then
queststatus = getPlayerStorageValue(cid,2104)
if queststatus == -1 or queststatus == 0 then
doPlayerSendTextMessage(cid,22,"Você achou um Eaglehorn")
item_uid = doPlayerAddItem(cid,7424,1)
setPlayerStorageValue(cid,2104,1)


else
doPlayerSendTextMessage(cid,22,"O baú está vazio.")
end
else
return 0
end
return 1
end