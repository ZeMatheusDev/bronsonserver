local config = {
    [53] = 69, -- [ID DA VOCATION] = Numero do outfit
    [31] = 5,
    [43] = 5,
    [26] = 159,
    [48] = 5,
    [38] = 159
    }
    
    
    function onLogin(cid)
    if(getPlayerStorageValue(cid,10005) > 0 or not config[getPlayerVocation(cid)]) then
    return TRUE
    end
    
    if getPlayerAccess(cid) >= 3 then
    return TRUE
    end
    
    doCreatureChangeOutfit(cid, {lookType = config[getPlayerVocation(cid)]})
    setPlayerStorageValue(cid,10005,1)
    return TRUE
    end
