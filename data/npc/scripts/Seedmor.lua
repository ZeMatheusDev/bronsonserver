local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

shopModule:addBuyableItem({'Rejuvenation', 'rj'},			2272, 600, 1,	'Rejuvenation')
shopModule:addBuyableItem({'holy missile ', 'hm'},		2295, 520, 1,	'holy missile ')
shopModule:addBuyableItem({'sudden death', 'sd'},			2268, 350, 1,	'sudden death')
shopModule:addBuyableItem({'Diamond Dust', 'dd'},			2276, 520, 1,	'Diamond Dust')
shopModule:addBuyableItem({'great missile', 'gmm'},			2314, 200, 1,	'great missile')
shopModule:addBuyableItem({'firebomb', 'fb'},			2305, 150, 1,	'firebomb')
shopModule:addBuyableItem({'Dharmas Caos', 'dc'},			2263, 800, 1,	'Dharmas Caos')
shopModule:addBuyableItem({'Fire Missile', 'fm'},			2306, 520, 1,	'Fire Missile')
shopModule:addBuyableItem({'magic wall', 'mw'},			2293, 300, 1,	'magic wall')
shopModule:addBuyableItem({'paralyze', 'lyze'},			2278, 220, 1,	'paralyze')
shopModule:addBuyableItem({'ultimate healing', 'uh'},			2273, 350, 1,	'ultimate healing')
shopModule:addBuyableItem({'blank', 'bl'},			2260, 10, 1,	'blank')
shopModule:addBuyableItem({'avalanche', 'ava'},			2274, 150, 1,	'avalanche')
shopModule:addBuyableItem({'icicle', 'ici'},			2271, 100, 1,	'icicle')
shopModule:addBuyableItem({'explosion', 'xpl'},			2313, 150, 1,	'explosion')

npcHandler:addModule(FocusModule:new())
