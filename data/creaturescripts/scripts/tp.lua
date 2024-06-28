function onDeath(cid, corpse, killer)

local Ppos = { x = 1699, y = 824, z = 14 } -- posicao para onde ele vai ir


local monstName = "Gothmog"  -- nome do monstro
                
                 if isMonster(cid) then
                        if string.lower(getCreatureName(cid)) == string.lower(monstName) then
                           doTeleportThing(killer[1], Ppos)
                        end   
                 end 
        return TRUE
end