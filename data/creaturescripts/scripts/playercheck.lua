function onLogin(cid, words, param, channel)
local _ip = nil
local p = 0
local list, ips = {}, {}
local players = getPlayersOnline()
for i, pid in ipairs(players) do
local ip = getPlayerIp(pid)
local tmp = table.find(ips, ip)
if(tmp ~= nil and (not _ip or _ip == ip)) then
if(table.countElements(list, ip) == 0) then
list[players[tmp]] = ip
end

list[pid] = ip
end

table.insert(ips, ip)
end

if(table.maxn(list) > 0) then
meip = getPlayerIp(cid)
mename = getCreatureName(cid)
for pid, ip in pairs(list) do
local metmp = table.find(ips, meip)
if (metmp ~= nil) then
p = p + 1
end
end
if (p <= 2) then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Voce tem ".. p .." chars Online!")
end

if (p > 2) then
doRemoveCreature(cid, mename)
end
else
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Voce tem ".. p+1 .." char Online!")
end

return true
end