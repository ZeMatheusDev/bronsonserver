function onUse(cid, item, frompos, item2, topos)
if item.uid == 3019 then
queststatus = getPlayerStorageValue(cid,3019)
if queststatus == -1 or queststatus == 0 then
doPlayerSendTextMessage(cid,22,"Você achou uma dark lord's cape")
item_uid = doPlayerAddItem(cid,8865,1)
setPlayerStorageValue(cid,3019,1)

else
doPlayerSendTextMessage(cid,22,"O baú está vazio.")
end
else
return 0
end
return 1
end