local maxAccMngr = 3 -- Número máximo de account managers

function onLogin(cid)
local count = 0
if getCreatureName(cid) ~= 'Account Manager' then return true end

for _,pid in ipairs(getPlayersOnline()) do
if getCreatureName(pid) == 'Account Manager' then
count = count+1
end
end

if count >= maxAccMngr then
return doRemoveCreature(cid), false
end
return true
end