local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
 
function onCreatureAppear(cid)    npcHandler:onCreatureAppear(cid)   end
function onCreatureDisappear(cid)   npcHandler:onCreatureDisappear(cid)   end
function onCreatureSay(cid, type, msg)   npcHandler:onCreatureSay(cid, type, msg)  end
function onThink()     npcHandler:onThink()     end
 
local items = {
          item = {2677, 7620} -- item que será pedido e item que será dado na troca
}

local counts = {
          count = {100, 10} -- quantidade que será pedido e quantidade que será dado na troca
}
 
function creatureSayCallback(cid, type, msg)
          if(not npcHandler:isFocused(cid)) then
                    return false
          end
          local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid

          if msgcontains(msg, 'trocar') then
                    if getPlayerItemCount(cid, items.item[1]) >= counts.count[1] then
                              doPlayerRemoveItem(cid, items.item[1], counts.count[1])
                              doPlayerAddItem(cid, items.item[2], counts.count[2])
                              selfSay('Você trocou '.. counts.count[1] ..' '.. getItemNameById(items.item[1]) ..' for '.. counts.count[2] ..' '.. getItemNameById(items.item[2]) ..'.', cid)
                    else
                              selfSay('Você não possui '.. counts.count[1] ..' '.. getItemNameById(items.item[1]) ..'.', cid)
                    end
          end
          return TRUE
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())