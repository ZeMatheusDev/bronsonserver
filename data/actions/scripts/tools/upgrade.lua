--- Perfect refine system by Mock the bear (MTB). 
--- Email: mock_otnet@hotmail.com 
local gain = { 
gainArmor='&p+1',loseArmor='&p-1', 
gainShield='&s+#',loseShield='&s-(#+1)', 
gainAttack='&a+(1*(#))',loseAttack='&a-(2*(#+1))', 
gainDefense='&d+(1*(#))',loseDefense='&d-(2*(#+1))', 
chance='30/((#*(1/(@/2)))*(@/2))', -- Eu fiz essa equa��o para variar de +0 a +7 o item 
--- Essa equa��o deve retornar em % a chance do item se refinar (0-30) 30 = sempre, 0 = nunca 
maxlvl = 8, 
blocked_ids = {2488,8881} 
} 
-- &a = weapon attack 
-- &d = weapon defense 
-- &s = shield defense 
-- &p = armor defense 
-- # = nivel do item 
-- @ = max level 
if not setItemName then 
function setItemName(uid,name) 
return doItemSetAttribute(uid,'name',name) 
end 
function setItemArmor(uid,name) 
return doItemSetAttribute(uid,'armor',name) 
end 
function setItemDefense(uid,name) 
return doItemSetAttribute(uid,'defense',name) 
end 
function setItemAttack(uid,name) 
return doItemSetAttribute(uid,'attack',name) 
end 
function getItemAttack(uid) 
return getItemAttribute(uid,'attack') 
end 
function getItemDefense(uid) 
return getItemAttribute(uid,'defense') 
end 
function getItemArmor(uid) 
if type(uid) == 'number' then 
return getItemAttribute(uid,'armor') 
else 
return getItemInfo(uid.itemid).armor 
end 
end 
end 
function isArmor(uid) -- Function by Mock the bear. 
if (getItemArmor(uid) and getItemArmor(uid) ~= 0 and not getItemInfo(uid.itemid,'attack') and not getItemInfo(uid.itemid,'defense') and getItemWeaponType(uid.uid) == 0) then 
return true 
end 
return false 
end 
function isWeapon(uid) -- Function by Mock the bear. 
uid = uid or 0 
local f = getItemWeaponType(uid) 
if f == 1 or f == 2 or f == 3 then 
return TRUE 
end 
return FALSE 
end 
function isShield(uid) -- Function by Mock the bear. 
uid = uid or 0 
if getItemWeaponType(uid) == 4 then 
return TRUE 
end 
return FALSE 
end 
 
function getWeaponLevel(uid) -- Function by Mock the bear. 
uid = uid or 0 
local name = getItemName(uid) 
local lvl = string.match(name,'+(%d)') 
return tonumber(lvl) or 0 
end 
function doTransform(s,i) -- Function by Mock the bear. 
local c = string.gsub(s,'@',gain.maxlvl) 
local c = string.gsub(c,'&a',getItemAttack(i.uid) or getItemInfo(i.itemid).attack) 
local c = string.gsub(c,'&d',getItemDefense(i.uid) or getItemInfo(i.itemid).defense) 
local c = string.gsub(c,'&s',getItemDefense(i.uid) or getItemInfo(i.itemid).defense) 
local c = string.gsub(c,'&p',getItemArmor(i.uid) or getItemInfo(i.itemid).armor) 
local c = string.gsub(c,'#',getWeaponLevel(i.uid)) 
local q,err = loadstring('return '..c) 
assert(q,err) 
return assert(q()) 
end 
local asdeflol = {17, 18, 19, 20} -- voca��es que refinam 
function onUse(cid, item, fromPosition, itemEx, toPosition) 
if not isInArray(asdeflol, getPlayerVocation(cid)) then 
return doPlayerSendTextMessage(cid, 24,"Somente weaponsmiths podem usar") 
end 
toPosition.stackpos = 255 
if isInArray(gain.blocked_ids, itemEx.itemid) == TRUE 
or getItemWeaponType(itemEx.uid) > 4 
or (getItemWeaponType(itemEx.uid) == 0 
and isArmor(itemEx) == FALSE) 
or itemEx.itemid == 0 then 
doPlayerSendTextMessage(cid, 24,"Voc� n�o pode refinar este item.") 
return TRUE 
end 
if isCreature(itemEx.uid) == TRUE then 
return FALSE 
end 
local level = getWeaponLevel(itemEx.uid) 
local chance = doTransform(gain.chance,itemEx) 
if chance >= math.random(0,50) or item.actionid >= 1000 or (item.actionid == 500 and math.random(0,100) <= 25) then 
if level+1 > gain.maxlvl then 
doSendMagicEffect(toPosition, 2) 
return doPlayerSendTextMessage(cid, 24,"O seu item ja est� no maximo.") 
else 
setItemName(itemEx.uid, getItemNameById(itemEx.itemid)..' +'..(level+1)..'. Foi Refinado Por '..getCreatureName(cid)) 
doPlayerSendTextMessage(cid, 20,"Seu item foi refinado para +"..(level+1)..".") 
doSendMagicEffect(toPosition, 26) 
if isArmor(itemEx) == TRUE then 
local get = doTransform(gain.gainArmor,itemEx) 
setItemArmor(itemEx.uid,get) 
elseif isWeapon(itemEx.uid) == TRUE then 
setItemAttack(itemEx.uid, doTransform(gain.gainAttack,itemEx)) 
setItemDefense(itemEx.uid, doTransform(gain.gainDefense,itemEx)) 
elseif isShield(itemEx.uid) == TRUE then 
setItemDefense(itemEx.uid, doTransform(gain.gainShield,itemEx)) 
end 
end 
else 
 
if level == 0 then 
doPlayerSendTextMessage(cid, 24,"No effect.") 
doSendMagicEffect(toPosition, 2) 
elseif level == gain.maxlvl then 
doSendMagicEffect(toPosition, 2) 
return doPlayerSendTextMessage(cid, 24,"O item est� no n�vel m�ximo, voc� n�o pode atualiz�-lo.") 
elseif level > 0 then 
if level >= 1 then 
doTransformItem(itemEx.uid, 2256) 
doPlayerSendTextMessage(cid, 20,"Voc� falhou.") 
doSendMagicEffect(getThingPos(cid), 3) 
end 
if isArmor(itemEx) == TRUE then 
setItemArmor(itemEx.uid,doTransform(gain.loseArmor ,itemEx)) 
elseif isWeapon(itemEx.uid) == TRUE then 
setItemAttack(itemEx.uid, doTransform(gain.loseAttack,itemEx)) 
setItemDefense(itemEx.uid, doTransform(gain.loseDefense,itemEx)) 
elseif isShield(itemEx.uid) == TRUE then 
setItemDefense(itemEx.uid, doTransform(gain.loseShield,itemEx)) 
end 
end 
doSendMagicEffect(toPosition, 9) 
end 
doRemoveItem(item.uid,1) 
return TRUE 
end