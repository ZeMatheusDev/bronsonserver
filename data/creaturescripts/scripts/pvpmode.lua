function onCombat(cid, target)

if (isPlayer(cid) and isPlayer(target)) then
    if getPlayerStorageValue(cid, 102059) == 1 then
        doPlayerSendTextMessage(cid, 27, "Voce nao pode atacalo Seu status é no-pvp.")
        return FALSE
    elseif getPlayerStorageValue(target, 102059) == 1 then
        doPlayerSendTextMessage(cid, 27, "O status de seu oponente é no-pvp.")
        return FALSE
    end
end

  return TRUE
end