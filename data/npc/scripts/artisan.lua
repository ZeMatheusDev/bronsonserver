local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()				npcHandler:onThink()					end

local node1 = keywordHandler:addKeyword({'promo1'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Posso te promover por 10000 gold coins. Quer que eu promova voce?'})
	node1:addChildKeyword({'yes'}, StdModule.promotePlayer, {npcHandler = npcHandler, cost = 10000, level = 25, promotion = 1, text = 'Parabens! Voce foi promovido.'})
	node1:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then, come back when you are ready.', reset = true})

local node1 = keywordHandler:addKeyword({'promo2'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Posso te promover por 30000 gold coins. Quer que eu promova voce?'})
	node1:addChildKeyword({'yes'}, StdModule.promotePlayer, {npcHandler = npcHandler, cost = 20000, premium = true, level = 50, promotion = 2, text = 'Parabens! Voce foi promovido.'})
	node1:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then, come back when you are ready.', reset = true})

local node1 = keywordHandler:addKeyword({'promo3'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Posso te promover por 50000 gold coins. Quer que eu promova voce?'})
	node1:addChildKeyword({'yes'}, StdModule.promotePlayer, {npcHandler = npcHandler, cost = 30000, premium = true, level = 150, promotion = 3, text = 'Parabens! Voce foi promovido.'})
	node1:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alright then, come back when you are ready.', reset = true})

npcHandler:addModule(FocusModule:new())