local config = {
	level = 100,
}

function onUse(cid, item, frompos, item2, topos)
if item.uid == 3007 then
queststatus = getPlayerStorageValue(cid,3007)
if queststatus == -1 or queststatus == 0 then
doPlayerSendTextMessage(cid,22,"Você achou uma Aghanim boots ")
item_uid = doPlayerAddItem(cid,7893,1)
setPlayerStorageValue(cid,3007,1)

else
doPlayerSendTextMessage(cid,22,"O baú está vazio.")
end
else
return 0
end
return 1
end