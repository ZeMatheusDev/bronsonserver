function onUse(cid, item, frompos, item2, topos)
if item.uid == 3016 then
queststatus = getPlayerStorageValue(cid,3016)
if queststatus == -1 or queststatus == 0 then
doPlayerSendTextMessage(cid,22,"Você achou uma Divine robe")
item_uid = doPlayerAddItem(cid,11350,1)
setPlayerStorageValue(cid,3016,1)

else
doPlayerSendTextMessage(cid,22,"O baú está vazio.")
end
else
return 0
end
return 1
end