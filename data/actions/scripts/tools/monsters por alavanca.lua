-- [( Script created by Doidin for XTibia.com )] --
function onUse(cid, item, fromPosition, item2, toPosition)

local monstername1 = "Elite Legionnaire" -- Nome dos monstros que ser�o sumonados ap�s o player clicar no item!
local monstername2 = "Elite Legionnaire" -- Nome dos monstros que ser�o sumonados ap�s o player clicar no item!
local monster1 = {x=682, y=1356, z=8} -- Coordenas de a onde o monstro ir� aparecer! (Dragon Lord)
local monster2 = {x=686, y=1363, z=8} -- Coordenas de a onde o monstro ir� aparecer! (Dragon Lord)
local monster3 = {x=692, y=1359, z=8} -- Coordenas de a onde o monstro ir� aparecer! (Dragon Lord)
local monster4 = {x=689, y=1353, z=8} -- Coordenas de a onde o monstro ir� aparecer! (Dragon)
local monster5 = {x=686, y=1353, z=8} -- Coordenas de a onde o monstro ir� aparecer! (Dragon)

function Summon()
doSummonCreature(monstername1,monster1)
doSummonCreature(monstername1,monster2)
doSummonCreature(monstername1,monster3)
doSummonCreature(monstername2,monster4)
doSummonCreature(monstername2,monster5)
doSendMagicEffect(monster1,36)
doSendMagicEffect(monster2,36)
doSendMagicEffect(monster3,36)
doSendMagicEffect(monster4,36)
doSendMagicEffect(monster5,36)
end

doCreatureSay(cid,"cuidado! nao puxe outra veis at� matar",TALKTYPE_ORANGE_1)
addEvent(Summon,100)
end