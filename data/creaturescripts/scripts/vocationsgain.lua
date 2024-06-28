local vocationsItem = {
        [13] = 7410, -- arcane wizard, troque os 1234 pelo id do item.
        [14] = 7410, -- spirit healer
        [15] = 7368, -- paladin
        [16] = 7405, -- kina
        [20] = 7776, -- miner
        [24] = 7368, -- elf
        [30] = 7434, -- orc general
        [34] = 7410, -- lightbrinder
        [38] = 7368, -- orc spearmaster
        [42] = 7424 -- orc wizard
}

local lvlGain = 300 -- lvl para ganhar

function onAdvance(cid, skill, oldLevel, newLevel)

        if (getPlayerLevel(cid) == lvlGain and getPlayerStorageValue(cid, 403245) ~= 1) then
                doPlayerAddItem(cid, vocationsItem[getPlayerVocation(cid)])
                setPlayerStorageValue(cid, 403245, 1)
                doPlayerSendTextMessage(cid,22, "Voce recebeu sua arma de lv 300.")
        end
        
        return true
end