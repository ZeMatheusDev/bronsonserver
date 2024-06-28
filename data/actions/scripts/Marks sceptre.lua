function onUse(cid, item, frompos, item2, topos)
if item.uid == 2109 then
queststatus = getPlayerStorageValue(cid,2109)
if queststatus == -1 or queststatus == 0 then
doPlayerSendTextMessage(cid,22,"Você achou um Marks sceptre")
item_uid = doPlayerAddItem(cid,7410,1)
setPlayerStorageValue(cid,2109,1)


else
doPlayerSendTextMessage(cid,22,"O baú está vazio.")
end
else
return 0
end
return 1
end