local config = {
--[vocation id] = corpse id, 
[26] = 5978,
[27] = 5978, 
[28] = 5978, 
[29] = 5978, 
[30] = 5978
}
function onDeath(cid, corpse, deathList)
local crp = config[getPlayerVocation(cid)]
if crp and tonumber(crp) then
doTransformItem(corpse, crp)
end
return true
end