local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

shopModule:addBuyableItem({'heavy magic missile', 'hmm'},		2311, 300, 20,	'heavy magic missile rune')
shopModule:addBuyableItem({'great fireball', 'gfb'},
shopModule:addBuyableItem({'Great Magic', 'gmm'},			2314, 1000, 20,	'spell rune')			2304, 500, 20,	'great fireball rune')
shopModule:addBuyableItem({'explo', 'xpl'},				2313, 800, 20,	'explosion rune')
shopModule:addBuyableItem({'ultimate healing', 'uh'},			2273, 700, 20,	'ultimate healing rune')
shopModule:addBuyableItem({'sudden death', 'sd'},			2268, 1000, 20,	'sudden death rune')
shopModule:addBuyableItem({'blank', 'rune'},				2260, 10,	'blank rune')

npcHandler:addModule(FocusModule:new())