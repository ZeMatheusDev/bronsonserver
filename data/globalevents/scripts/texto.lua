local config = {
    positions = {
        ["BronsonBR"] = { x = 1070, y = 1036, z = 1 },
        ["BronsonBR"] = { x = 737, y = 517, z = 3 },
        ["Primeiro"] = { x = 1174, y = 720, z = 8 },
        ["Segundo"] = { x = 1174, y = 723, z = 8 },
        ["Terceiro"] = { x = 1174, y = 726, z = 8 }
    }
}

function onThink(cid, interval, lastExecution)
    for text, pos in pairs(config.positions) do
        doSendAnimatedText(pos, text, math.random(1, 255))
    end
    
    return TRUE
end  