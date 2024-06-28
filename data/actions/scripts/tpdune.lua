function onUse(cid, item, fromPosition, itemEx, toPosition)
local axe = {x=1574,y=478,z=7}
if itemEx.itemid == 9825 and item.actionid == 667 then
 doTeleportThing(cid, axe)
 doSendMagicEffect(getPlayerPosition(cid), 27)
end
end