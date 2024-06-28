local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)                  npcHandler:onCreatureAppear(cid)                        end
function onCreatureDisappear(cid)               npcHandler:onCreatureDisappear(cid)                     end
function onCreatureSay(cid, type, msg)  npcHandler:onCreatureSay(cid, type, msg)        end
function onThink()                                              npcHandler:onThink()                                            end

function buyAddons(cid, message, keywords, parameters, node)
        --TODO: buyAddons function in modules.lua
        if(not npcHandler:isFocused(cid)) then
                return false
        end

        local addon = parameters.addon
        local cost = parameters.cost
        local premium = (parameters.premium ~= nil and parameters.premium)

        if isPlayerPremiumCallback == nil or (isPlayerPremiumCallback(cid) and premium) then
                if doPlayerRemoveMoney(cid, cost) then
                        doPlayerAddAddons(cid, addon)
                        npcHandler:say('Voce Agora Possui Todos addons!', cid)
                else
                        npcHandler:say('Desculpe,Voce nao tem dinheiro suficiente.', cid)
                end
        else
                npcHandler:say('Eu So Sirvo os cliente premium accounts.', cid)
        end

        keywordHandler:moveUp(1)
        return true
end

local node1 = keywordHandler:addKeyword({'first addon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Voce quer comprar os addons primeira definidas por 50k??'})
        node1:addChildKeyword({'yes'}, buyAddons, {addon = 1, cost = 50000, premium = true})
        node1:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, moveup = 1, text = 'Muito caro, hein?'})

local node2 = keywordHandler:addKeyword({'second addon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Voce Gostaria de comprar os addons segundo definidos por 100k?'})
        node2:addChildKeyword({'yes'}, buyAddons, {addon = 2, cost = 100000, premium = true})
        node2:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, moveup = 1, text = 'Muito caro, hein?'})

keywordHandler:addKeyword({'addon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Hello |PLAYERNAME| Eu Vendo {first addon} e {second addon} Deseja comprar Algum ?.'})

npcHandler:addModule(FocusModule:new())