function onUse(cid, item, fromPosition, itemEx, toPosition)
local axe = {x=516,y=544,z=8}
if itemEx.itemid == 9751 and item.actionid == 666 then
 doTeleportThing(cid, axe)
 doSendMagicEffect(getPlayerPosition(cid), 38)
end
end