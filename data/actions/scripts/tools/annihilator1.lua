function onUse(cid, item, fromPosition, itemEx, toPosition)
if item.uid == 6005 then
queststatus = getPlayerStorageValue(cid,6000)
if queststatus == -1 then
doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "Você escolheu hunting spear.")
doPlayerAddItem(cid,3965,1)
setPlayerStorageValue(cid,6000,1)
else
doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "Você ja escolheu seu premio.")
end
elseif item.uid == 6006 then
queststatus = getPlayerStorageValue(cid,6000)
if queststatus == -1 then
doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "Você escolheu Magic Sword")
doPlayerAddItem(cid,2400,1)
setPlayerStorageValue(cid,6000,1)
else
doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "Você ja escolheu seu premio.")
end
elseif item.uid == 6007 then
queststatus = getPlayerStorageValue(cid, 6000)
if queststatus == -1 then
doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "Você escolheu Stonecutter's Axe .")
doPlayerAddItem(cid,2431,1)
setPlayerStorageValue(cid,6000,1)
else
doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "Você ja escolheu seu premio.")
end
elseif item.uid == 6008 then
queststatus = getPlayerStorageValue(cid,6000)
if queststatus == -1 then
doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "Você escolheu Thunder hammer")
doPlayerAddItem(cid,2421,1)
setPlayerStorageValue(cid,6000,1)
else
doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "Você ja escolheu seu premio.")

end
else
return 0
end

return 1
end