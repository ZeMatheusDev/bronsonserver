function onLogin(cid)

	if isPlayer(cid) then
	   if getPlayerVocation(cid) == 21 then -- id da vocation (1)
		   doPlayerSetTown(cid, 5) -- cidade aonde ira nascer
		   doPlayerSendTextMessage(cid, 27, "Voce Sempre Nascerá Em "..getTownName(getPlayerTown(cid)))
	   end 
	end
	   if getPlayerVocation(cid) == 25 then --id da Vocation (21)
		   doPlayerSetTown(cid, 7) -- cidade aonde ira nascer
		   doPlayerSendTextMessage(cid, 27, "Voce Sempre Nascerá Em "..getTownName(getPlayerTown(cid)))
		end 
	return true
	end