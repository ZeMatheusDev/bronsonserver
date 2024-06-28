local config={
    {outfit={136,128,137,129,138,130,139,131,140,132,141,133,142,134,143,135,144,136,145,137,146,138,147,139, 148,140,149,141,150,142,151,143,152,144,153,145,154,146,155,147,278,279,251,252,269,268,270,273,288,289,324,325,336,335,328,329,366,367},voc={1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25},storage=40850}, -- Humanos
    
    {outfit={5, 7, 50, 6, 8, 59, 2, 4},voc={31,32,33,34,35,36,37,43,44,45,46,47,48,49,50,51,52},storage=40853},  -- orc
    
    {outfit={159, 64, 148, 144, 63},voc={26,27,28,29,30,38,39,40,41,42},storage=40852},  -- elf
    
    {outfit={69, 71, 70, 66, 332},voc={53,54,55,56,57},storage=40854}  -- dwarf
    } 
     
    function onLogin(cid)  
     
    for a =1,#config do  
    if isInArray(config[a].voc, getPlayerVocation(cid)) and getPlayerStorageValue(cid, config[a].storage) == -1 then  
    setPlayerStorageValue(cid, config[a].storage, 1)  
    for i = 1, #config[a].outfit do 
    doPlayerAddOutfit(cid, config[a].outfit[i], 3)   
    end   
    break  
    end  
    end  
    return TRUE  
    end