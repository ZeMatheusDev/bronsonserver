function onUse(cid, item, frompos, item2, topos)
if item.uid == 3003 then
queststatus = getPlayerStorageValue(cid,3003)
if queststatus == -1 or queststatus == 0 then
doPlayerSendTextMessage(cid,22,"Você achou um knight axe")
item_uid = doPlayerAddItem(cid,2430,1)
setPlayerStorageValue(cid,3003,1)

else
doPlayerSendTextMessage(cid,22,"O baú está vazio.")
end
else
return 0
end
return 1
end