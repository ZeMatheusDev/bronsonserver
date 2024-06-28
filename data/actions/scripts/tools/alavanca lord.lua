function onUse(cid, item, fromPosition, itemEx, toPosition)
piece1pos = {x=192, y=839, z=8, stackpos=1}
getpiece1 = getThingfromPos(piece1pos)
if item.uid == 3333 and item.itemid == 9826 and getpiece1.itemid == 9791 then
doRemoveItem(getpiece1.uid,1)
doTransformItem(item.uid,item.itemid+1)
elseif item.uid == 3333 and item.itemid == 9825 then
doCreateItem(9791,1,piece1pos)
doTransformItem(item.uid,item.itemid-1)
else
doPlayerSendTextMessage(cid,22,"A alavanca ja foi puxada.")
end
return 1
end