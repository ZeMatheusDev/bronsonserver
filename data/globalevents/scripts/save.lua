local config = {
	broadcast = "yes"
}

config.broadcast = getBooleanFromString(config.broadcast)
local function executeSave(seconds)
	if(seconds == 0) then
            doBroadcastMessage("Salvando....")
		doSaveServer()
		return true
	end

	if(seconds == 120 or seconds == 30) then
		doBroadcastMessage("Salvando em  " .. seconds .. " segundos, Server ira travar por favor esperem.")
	end

	seconds = seconds - 30
	if(seconds >= 0) then
		addEvent(executeSave, 30 * 1000, seconds)
	end
end

function onThink(interval, lastExecution, thinkInterval)
	if(not config.broadcast) then
		doSaveServer()
		return true
	end

	executeSave(120)
	return true
end
