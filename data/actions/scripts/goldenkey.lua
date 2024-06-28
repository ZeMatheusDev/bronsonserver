local quest = 2888
local id = 2091
local act = 666
function onUse(cid, item, fromPosition, itemEx, toPosition)
 if getPlayerStorageValue(cid,quest) == -1 then
  local chave = doCreateItemEx(2091, 1)
  doSetItemActionId(chave, act)
  doPlayerAddItemEx(cid, chave, 1)
  doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Você achou uma golden key.")
  setPlayerStorageValue(cid,quest,1)
 else
  doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Esta caixa está vazia.")
 end
 return true
end