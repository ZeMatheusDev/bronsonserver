function onUse(cid, item, frompos, item2, topos)
if item.uid == 3017 then
queststatus = getPlayerStorageValue(cid,3017)
if queststatus == -1 or queststatus == 0 then
doPlayerSendTextMessage(cid,22,"Você achou um divine sceptre")
item_uid = doPlayerAddItem(cid,8854,1)
setPlayerStorageValue(cid,3017,1)

else
doPlayerSendTextMessage(cid,22,"O baú está vazio.")
end
else
return 0
end
return 1
end