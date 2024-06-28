local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

shopModule:addBuyableItem({'slingshot', 'slip'},			5907, 100, 1,	'slingshot')
shopModule:addBuyableItem({'crossbow', 'cros'},		2455, 50, 1,	'crossbow ')
shopModule:addBuyableItem({'bow', 'bow'},			2456, 20, 1,	'bow')
shopModule:addBuyableItem({'sniper arrows', 'sa'},			7364, 100, 100,	'sniper arrow')
shopModule:addBuyableItem({'shiver arrows', 'sar'},			7839, 1000, 50,	'shiver arrow')
shopModule:addBuyableItem({'onyx arrows', 'oa'},			7365, 100, 100,	'onyx arrow')
shopModule:addBuyableItem({'infernal bolts', 'ib'},			6529, 100, 100,	'infernal bolts')
shopModule:addBuyableItem({'flash arrows', 'fa'},			7838, 100, 100,	'flash arrows')
shopModule:addBuyableItem({'bolts', 'bo'},		2543, 100, 100,	'bolt')
shopModule:addBuyableItem({'arrows', 'ar'},			2544, 100, 100,	'arrow')
shopModule:addBuyableItem({'throwing knives', 'tk'},			2410, 100, 100,	'throwing knives')
shopModule:addBuyableItem({'crystal arrow', 'ca'},			2352, 2000, 1,	'crystal arrow')

npcHandler:addModule(FocusModule:new())
