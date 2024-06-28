function onUse(cid, item, frompos, item2, topos)

-------- Pausa --------

local pausa = 20000 -------- Cordenadas --------

local door = {x=687, y=1266, z=8, stackpos=1}
local ddoor = getThingfromPos(door)

-------- ITEM --------

local open_door = 5734

local itemU = 24004

local verify = 0 --- NÃO MEXA AQUI

-------- PRIMEIRO SISTEMA --------


if item2.uid == itemU then
if ddoor.itemid ~= verify then
doTransformItem(ddoor.uid,open_door)
addEvent(close,pausa,door)
end
else
doPlayerSendCancel(cid,"Essa key não pode ser usada aqui")
end
return 1
end

function close(door)
-------- ITEM --------

local to_close_door = 5733

------- SEGUNDO SISTEMA --------

local the_close_door = getThingfromPos(door)
doTransformItem(the_close_door.uid,to_close_door)
end