function onKill(cid, target)
local from,to = {x = 1250, y = 691, z = 6},{x = 1260, y = 724, z = 6}
			if isPlayer(cid) and isPlayer(target) and isInRange(getCreaturePosition(target), from, to) then
				doCreatureSetSkullType(target, 3)
			end
return true
end
