	--[by Bizao]
function onUse(cid, item, frompos, item2, topos)
pos = {x=1349, y=617, z=6}
item = getPlayerItemCount(cid,2086)

    if item >= 1 then
        doTeleportThing(cid, pos)
else

        doPlayerSendTextMessage(cid,22,"você precisa de uma purple key!!!.")
        doPlayerRemoveItem(cid, item_id, 1)

end
return TRUE
end
