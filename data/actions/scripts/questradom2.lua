function onUse(cid, item)
if item.uid == 8587 then
queststatus = getPlayerStorageValue(cid,8799)
if queststatus == -1 then
local random = math.random(1, 3)
local items = {
[1] = {id=2390,quant=1,word="Parab�ns"},
[2] = {id=7415,quant=1,word="Parab�ns"},
[3] = {id=7413,quant=1,word="Parab�ns"}
[4] = {id=8856,quant=1,word="Parab�ns"}
}
setPlayerStorageValue(cid,8799,1)
doPlayerAddItem(cid, items[random].id, items[random].quant)
doCreatureSay(cid, items[random].word, TALKTYPE_ORANGE_1)
doSendMagicEffect(getThingPos(cid), 29)
else
doPlayerSendTextMessage(cid,22,"Ops, voc� j� recebeu!")
end
end
end