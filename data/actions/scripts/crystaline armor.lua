function onUse(cid, item, frompos, item2, topos)
if item.uid == 3015 then
queststatus = getPlayerStorageValue(cid,3015)
if queststatus == -1 or queststatus == 0 then
doPlayerSendTextMessage(cid,22,"Você achou uma crystaline armor")
item_uid = doPlayerAddItem(cid,8878,1)
setPlayerStorageValue(cid,3015,1)

else
doPlayerSendTextMessage(cid,22,"O baú está vazio.")
end
else
return 0
end
return 1
end