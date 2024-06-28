function onUse(cid, item, fromPosition, itemEx, toPosition)
piece1pos = {x=1541, y=112, z=10, stackpos=1}
getpiece1 = getThingfromPos(piece1pos)
if item.uid == 1069 and item.itemid == 1945 and getpiece1.itemid == 5733 then
doRemoveItem(getpiece1.uid,1)
doTransformItem(item.uid,item.itemid+1)
elseif item.uid == 1069 and item.itemid == 1946 then
doCreateItem(5733,1,piece1pos)
doTransformItem(item.uid,item.itemid-1)
else
doPlayerSendTextMessage(cid,22,"Sorry, not possible.")
end
return 1
end