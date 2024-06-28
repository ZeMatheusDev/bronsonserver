function executeClean()
	doCleanMap()
	doBroadcastMessage("O Mapa Foi Limpo.")
	return true
end

function onThink(interval, lastExecution, thinkInterval)
	doBroadcastMessage("Por Favor Peguem Seus Loots Vamos Dar Clean")
	addEvent(executeClean, 600000)
	return true
end
