function onUse(cid, item)
local config = {
s = 11548, --nao mexa
exhau = 7200 --em quantos e quantos segundos ira precisar pra da user novamente ja esta correto em 2 hrs
}

local mensagens = 
{
"A Guild " .. getPlayerGuildName(cid) .. " acaba de dominar a Guild House de Dol Guldur!",
}
if (getPlayerStorageValue(cid, config.s) <= os.time()) then
setPlayerStorageValue(cid,config.s,os.time()+config.exhau)
doBroadcastMessage(mensagens[math.random(1,table.maxn(mensagens))])
else
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Volte mas tarde espere " .. config.exhau .. " segundos pra usar a alavanca novamente.")
end
return true
end
