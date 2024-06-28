	--[by Bizao]
function onUse(cid, item, frompos, item2, topos)
pos = {x=1610, y=768, z=14}
item = getPlayerItemCount(cid,2092)

    if item >= 1 then
        doTeleportThing(cid, pos)
else

        doPlayerSendTextMessage(cid,22,"você precisa de uma bone key!!!.")
        doPlayerRemoveItem(cid, item_id, 1)

end
return TRUE
end
