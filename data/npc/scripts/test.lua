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

local falas = {
[1] = { -- druid
hi = 'Hello, mage of the skies. blablabla {yes} ?',
yes = 'ok mage! kkkkk',
no = 'ok then mage',
bye = 'Good bye '.. getCreatureName(cid) ..'.'
},
[2] = { -- sorc
hi = 'Hello my forest enchanter blablabla {yes} ?',
yes = 'ok forest enchanter! kkkkk',
no = 'ok then forest gamp',
bye = 'Good bye '.. getCreatureName(cid) ..'.'
},
[3] = { -- paladin
hi = 'Hey! Super shooter blablabla {yes} ?',
yes = 'ok Super shooter! kkkkk',
no = 'ok then super shooter',
bye = 'Good bye '.. getCreatureName(cid) ..'.'
},
[4] = { -- knight
hi = 'Aye, guardian blablabla {yes} ?',
yes = 'ok guardian! kkkkk',
no = 'ok then gaydian',
bye = 'Good bye '.. getCreatureName(cid) ..'.'
}
}



if(msgcontains(msg, 'hi') or msgcontains(msg, 'HI')) then
if not falas[getPlayerVocation(cid)] then
selfSay('desculpe,não falo com você!', cid)
talkState[talkUser] = 0
npcHandler:releaseFocus(cid)
else
selfSay(falas[getPlayerVocation(cid)].hi, cid)
talkState[talkUser] = 1
end
elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 1) then
selfSay(falas[getPlayerVocation(cid)].yes, cid)
talkState[talkUser] = 2
elseif msg == 'no' and talkState[talkUser] >= 1 then  
selfSay(falas[getPlayerVocation(cid)].no, cid)  
talkState[talkUser] = 0  
npcHandler:releaseFocus(cid)
elseif msg == 'bye' then  
selfSay(falas[getPlayerVocation(cid)].bye, cid)  
talkState[talkUser] = 0  
npcHandler:releaseFocus(cid)  
end
return TRUE
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())