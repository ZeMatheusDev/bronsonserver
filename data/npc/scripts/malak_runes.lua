local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

shopModule:addBuyableItem({'great mana potion', 'gmp'},			7590, 520,	'great mana potion')
shopModule:addBuyableItem({'strong mana potion', 'smp'},		7589, 200,	'strong mana potion')
shopModule:addBuyableItem({'mana potion', 'mp'},			7620, 100,	'mana potion')

npcHandler:addModule(FocusModule:new())
