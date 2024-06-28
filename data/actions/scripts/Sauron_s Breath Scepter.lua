function onUse(cid, item, frompos, item2, topos)
if item.uid == 3001 then
queststatus = getPlayerStorageValue(cid,3001)
if queststatus == -1 or queststatus == 0 then
doPlayerSendTextMessage(cid,22,"Você achou um Sauron's Breath Scepter")
item_uid = doPlayerAddItem(cid,8910,1)
setPlayerStorageValue(cid,3001,1)

else
doPlayerSendTextMessage(cid,22,"O baú está vazio.")
end
else
return 0
end
return 1
end