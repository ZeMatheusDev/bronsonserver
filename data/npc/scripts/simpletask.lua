local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end
function creatureSayCallback(cid, type, msg)
if(not npcHandler:isFocused(cid)) then
return false
end
local talkUser = NPCHANDLER_CONVbehavior == CONVERSATION_DEFAULT and 0 or cid
if (msgcontains(msg, 'task') or msgcontains(msg, 'TASK'))then
npcHandler:say("Me diga o nome do monstro que você deseja fazer a task!", cid)
talkState[talkUser] = 1
elseif talkState[talkUser] == 1 then
local msg = string.lower(msg)
if tasktabble[msg] then
if CheckTask(cid) ~= true then
local contagem = getPlayerStorageValue(cid, tasktabble[msg].storage)
if (contagem == -1) then contagem = 1 end
if not tonumber(contagem) then npcHandler:say('Desculpe, mas você já terminou a task do '..msg, cid) return true end
setPlayerStorageValue(cid, tasktabble[msg].storage_start, 1)
npcHandler:say("Parabéns, agora você está participando da missão task do "..msg..", falta matar "..string.sub(((contagem)-1)-tasktabble[msg].count, 2).." "..msg, cid)
talkState[talkUser] = 0
else
npcHandler:say('Desculpe, mas você já faz parte de uma task!', cid)
talkState[talkUser] = 0
end
else
npcHandler:say('digite o nome correto da missão task!', cid)
end
elseif (msgcontains(msg, 'receber') or msgcontains(msg, 'RECEBER')) then
if CheckTask(cid) then
for k, v in pairs(tasktabble) do
if getPlayerStorageValue(cid,v.storage_start) >= 1 then
local contagem = getPlayerStorageValue(cid, v.storage)
if (contagem == -1) then contagem = 1 end
if not tonumber(contagem) then npcHandler:say('você só pode receber os items uma única vez!', cid) return true end
if (((contagem)-1) >= v.count) then
doPlayerAddExp(cid, v.exp)
doAddItemsFromList(cid,v.reward)
setPlayerStorageValue(cid, v.storage, "Finished")
setPlayerStorageValue(cid, v.storage_start, 0)
npcHandler:say('Obrigado pela sua ajuda, você recebeu: '..getItemsFromList(v.reward)..' por ter completado a task do '..k, cid)
finisheAllTask(cid)
else
npcHandler:say('Desculpe,mas você só matou '..((contagem)-1)..' de '..v.count..' '..k, cid)
end
end
end
else
npcHandler:say("você não está em nenhuma missão task", cid)
end
elseif (msgcontains(msg, 'sair') or msgcontains(msg, 'SAIR')) then
if CheckTask(cid) then
talkState[talkUser] = 2
for k, v in pairs(tasktabble) do
if getPlayerStorageValue(cid,v.storage_start) >= 1 then
local contagem = getPlayerStorageValue(cid, v.storage)
if (contagem == -1) then contagem = 1 end
npcHandler:say('você está participando de uma missão task do '..k..' e já tem '..((contagem)-1)..' '..k..' mortos, deseja mesmo sair?', cid)
end
end
else
npcHandler:say("você não está em nenhuma missão task", cid)
end
elseif msgcontains(msg, 'yes') and talkState[talkUser] == 2 then
for k, v in pairs(tasktabble) do
if getPlayerStorageValue(cid,v.storage_start) >= 1 then
setPlayerStorageValue(cid, v.storage_start, 0)
end
end
npcHandler:say("Você foi retirado da task com sucesso!", cid)
elseif msg == "no" then  
selfSay("Tudo bem então", cid)  
talkState[talkUser] = 0  
npcHandler:releaseFocus(cid)  
end
return TRUE
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())