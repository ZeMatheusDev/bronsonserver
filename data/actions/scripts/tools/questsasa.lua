-- [( Script created by Doidin for XTibia.com )] --
function onUse(cid, item, fromPosition, item2, toPosition)

local teleport = {x=1653, y=378, z=6} -- Coordenadas para onde o player irá ser teleportado.
local item_id = 2091 -- ID do item que o player precisa para ser teleportado.

if getPlayerItemCount(cid,item_id) >= 1 then
        doTeleportThing(cid, teleport)
        doSendMagicEffect(getPlayerPosition(cid), 10)
        doPlayerRemoveItem(cid, item_id, 1)
        doPlayerSendTextMessage(cid, 22, "Ok, vamos lá! Você sacrificou a sua "..getItemNameById(item_id).." para fazer esta quest!")
        else
        doPlayerSendTextMessage(cid, 23, "Desculpe, você precisa de uma "..getItemNameById(item_id).." para entrar.")
        end
end