function onUse(cid, item, frompos, item2, topos)


local pausa = 30000 

local door = {x=687, y=1239, z=8, stackpos=1} 
local ddoor = getThingfromPos(door) 


local open_door = 5734 

local itemU = 24005 

local verify = 0 



if item2.uid == itemU then
if ddoor.itemid ~= verify then
doTransformItem(ddoor.uid,open_door)
addEvent(close,pausa,door)
end
else
doPlayerSendCancel(cid,"Esta chave nao pode ser usado aqui") 
end
return 1
end

function close(door)


local to_close_door = 5733 


local the_close_door = getThingfromPos(door)
doTransformItem(the_close_door.uid,to_close_door)
end