function onUse(cid, item, fromPosition, itemEx, toPosition)
local axe = {x=1085,y=624,z=8}
if itemEx.itemid == 8834 and item.actionid == 668 then
 doTeleportThing(cid, axe)
 doSendMagicEffect(getPlayerPosition(cid), 31)
end
end