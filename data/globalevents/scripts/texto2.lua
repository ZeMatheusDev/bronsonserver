local config = {
    positions = {
        ["Treiners"] = { x = 1203, y = 754, z = 7 },
        [""] = { x = 1208, y = 747, z = 7 },
        [""] = { x = 1143, y = 755, z = 8 },
        [""] = { x = 1143, y = 757, z = 8 },
        [""] = { x = 1143, y = 759, z = 8 }
    }
}

function onThink(cid, interval, lastExecution)
    for text, pos in pairs(config.positions) do
        doSendAnimatedText(pos, text, math.random(1, 255))
    end
    
    return TRUE
end  