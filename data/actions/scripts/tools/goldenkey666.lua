	--[by Bizao]
function onUse(cid, item, frompos, item2, topos)
pos = {x=516, y=544, z=8}
item = getPlayerItemCount(cid,2090)

    if item >= 1 then
        doTeleportThing(cid, pos)
else

        doPlayerSendTextMessage(cid,22,"você precisa de uma golden key!.")
        doPlayerRemoveItem(cid, item_id, 1)

end
return TRUE
end