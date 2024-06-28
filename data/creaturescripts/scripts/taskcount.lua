function onKill(cid, target)
if(isMonster(target) == TRUE) then
local n = getCreatureName(target)
local name_monster = tasktabble[string.lower(n)]
if(name_monster and getPlayerStorageValue(cid,name_monster.storage_start) >= 1) then
local contagem = getPlayerStorageValue(cid, name_monster.storage)
if (contagem == -1) then contagem = 1 end
if not tonumber(contagem) then return true end
if contagem > name_monster.count then return true end
setPlayerStorageValue(cid, name_monster.storage, contagem+1)
if contagem == name_monster.count then
doPlayerSendTextMessage(cid, 18, "Parabéns! Você terminou a tarefa de "..n)
end
end
end
return TRUE
end