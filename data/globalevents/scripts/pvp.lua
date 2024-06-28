-- PVP Mode alernator, desenvolvido por EMPRESA RIACHO

local tipos = {

        [WORLD_TYPE_NO_PVP] = "No-PVP",
        [WORLD_TYPE_PVP] = "PVP",
}

function executeCPVPT()

local atualpktipo = tipos[getWorldType()]


if (atualpktipo=='PVP') then

setWorldType(1)

novopktipo = "No-PVP"


elseif (atualpktipo=='No-PVP') then

setWorldType(2)

novopktipo = "PVP"


else

doBroadcastMessage("ERRO, FAVOR AVISAR O SCRIPTER!" .. atualpktipo .. ".", MESSAGE_EVENT_ADVANCE)
return TRUE

end


doBroadcastMessage("O servidor está em modo " .. novopktipo .. ".")
return TRUE

end




function onThink(interval, lastExecution, thinkInterval)


local atualpktipo = tipos[getWorldType()]

if (atualpktipo=='PVP') then

novopktipo = "No-PVP"

elseif (atualpktipo=='No-PVP') then

novopktipo = "PVP" end

doBroadcastMessage("O servidor mudará para modo " .. novopktipo .. " em 3 minutos!")

        addEvent(executeCPVPT, 180000)

        return true

end