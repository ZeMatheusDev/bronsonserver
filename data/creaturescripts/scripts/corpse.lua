local table = {
    --[vocation] = id do corpse
    [26] = 6003, 
    [27] = 6003,
    [28] = 6003, 
    [29] = 6003, 
    [30] = 6003,
    [31] = 5966, 
    [32] = 5966,
    [33] = 5966, 
    [34] = 5966, 
    [35] = 5966,
    [36] = 5966, 
    [37] = 5966,
    [38] = 6003, 
    [39] = 6003, 
    [40] = 6003,
    [41] = 6003, 
    [42] = 6003,
    [43] = 5966, 
    [44] = 5966, 
    [45] = 5966,
    [46] = 5966, 
    [47] = 5966,
    [48] = 5966, 
    [49] = 5966, 
    [50] = 5966,
    [51] = 5966, 
    [52] = 5966,
    [53] = 6007, 
    [54] = 6007, 
    [55] = 6007,
    [56] = 6007, 
    [57] = 6007,
    }
     
    local function transform(pos, id, voc)
    local item = getTileItemById(pos, id)
    if item and item.uid > 1 then
       doTransformItem(item.uid, table[voc])
       doDecayItem(item.uid or 0)
    end
    end
     
    function onDeath(cid, corpse)
    if not isPlayer(cid) or not table[getPlayerVocation(cid)] then return true end
       addEvent(transform, 15, getThingPos(cid), corpse.itemid, 
     
    getPlayerVocation(cid))
    return true
    end