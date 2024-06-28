function onUse(cid, item, fromPosition, itemEx, toPosition)
local Level = 170 -- level que precisa
if getPlayerLevel(cid) >= Level then
local tp = {x=1574, y=478, z=7} -- Local que o player ira aparecer
doTeleportThing(cid, tp)
local player = getPlayerPosition(cid)
doSendMagicEffect(player, 38)
else
doTeleportThing(cid, frompos)
end
return TRUE
end