function onUse(cid, item, frompos, item2, topos)
if item.uid == 3009 then
queststatus = getPlayerStorageValue(cid,3009)
if queststatus == -1 or queststatus == 0 then
doPlayerSendTextMessage(cid,22,"Voc� achou um elven bow.")
item_uid = doPlayerAddItem(cid,7438,1)
setPlayerStorageValue(cid,3009,1)

else
doPlayerSendTextMessage(cid,22,"O ba� est� vazio.")
end
else
return 0
end
return 1
end