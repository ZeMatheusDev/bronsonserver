--- Script By RookWar ---
function onThink(interval, lastExecution)
pos = {x = 1006, y = 621, z = 12} -- Coordenadas do teleport
pos1 = {x = 1623, y = 856, z = 14} -- /\
pos2 = {x = 158, y = 51, z = 4} -- /\
pos3 = {x = 158, y = 47, z = 7} -- /\
doSendAnimatedText(pos, 'esta bugada', 140) -- Ira mandar Texto animado na pos
doSendAnimatedText(pos1, 'esta bugado', 140) -- /\, porém na pos1
doSendAnimatedText(pos2, 'Welcome', 130) -- /\, porem na pos2
doSendAnimatedText(pos3, 'Treiners', 130) -- /\, porem na pos3
