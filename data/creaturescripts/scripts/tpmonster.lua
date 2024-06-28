local config = {
message = "Entre no teleporte, ele desapareçera em 1 minuto.",
timeToRemove = 60, -- seconds
teleportId = 1387,
bosses = {
["Gothmog"] = { x = 1699, y = 823, z = 14 },

}
}

local function removal(position)
doRemoveThing(getTileItemById(position, config.teleportId).uid, 1)
return TRUE
end

function onDeath(cid, corpse, killer)
registerCreatureEvent(cid, "teleportmonster")
local position = getCreaturePosition(cid)

for name, pos in pairs(config.bosses) do
if name == getCreatureName(cid) then
teleport = doCreateTeleport(config.teleportId, pos, position)
doCreatureSay(cid, config.message, TALKTYPE_ORANGE_1)
addEvent(removal, config.timeToRemove * 1000, position)
doSendMagicEffect(position,10)
end
end
return TRUE
end