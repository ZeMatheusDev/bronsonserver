local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)			npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()					npcHandler:onThink()					end

local tabela = {31, 32, 33, 34, 35, 36, 37}
local c = 0

function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	end

	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
	
	if(msgcontains(msg, 'promover')) then
		for x=1,#tabela do
			if getPlayerVocation(cid) == tabela[x] then
				if getPlayerLevel(cid) >= 30 then
					if (getPlayerPromotionLevel(cid) < 1) then
						npcHandler:say('Eu posso te promover por 5000 gold coins. Voce quer ser promovido?', cid)
						talkState[talkUser] = 1
						
					elseif (getPlayerPromotionLevel(cid) == 1) and getPlayerLevel(cid) >= 50 then
						npcHandler:say('Eu posso te promover por 10000 gold coins. Voce quer ser promovido?', cid)
						talkState[talkUser] = 1
						
					elseif (getPlayerPromotionLevel(cid) == 2) and getPlayerLevel(cid) >= 75 then
						npcHandler:say('Eu posso te promover por 500000 gold coins. Voce quer ser promovido?', cid)
						talkState[talkUser] = 1

					elseif (getPlayerPromotionLevel(cid) == 3) and getPlayerLevel(cid) >= 101 then
						npcHandler:say('Eu posso te promover por 100000 gold coins. Voce quer ser promovido?', cid)
						talkState[talkUser] = 1
						
					elseif (getPlayerPromotionLevel(cid) == 4) and getPlayerLevel(cid) >= 150 then
						npcHandler:say('Eu posso te promover por 200000 gold coins. Voce quer ser promovido?', cid)
						talkState[talkUser] = 1
						
					elseif (getPlayerPromotionLevel(cid) == 5) and getPlayerLevel(cid) >= 400 then
						npcHandler:say('Eu posso te promover por 1000000 gold coins. Voce quer ser promovido?', cid)
						talkState[talkUser] = 1

					elseif (getPlayerPromotionLevel(cid) == 6) then
						npcHandler:say('Voce ja e promovido!', cid)
						
					else
						npcHandler:say('Voce nao tem level suficiente para se promover.', cid)
					end
				else
					npcHandler:say('Me desculpe, mas eu so posso promover quando estiver level 30.', cid)
				end
				c = 1
				break
			end
		end
		if c == 0 then
			npcHandler:say("Eu promovo apenas orcs.", cid)
		end
		
	elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 1) then
		if(getPlayerPromotionLevel(cid) < 1) then
			if(not doPlayerRemoveMoney(cid, 5000)) then
				npcHandler:say('Voce nao tem dinheiro!', cid)
			else
				setPlayerPromotionLevel(cid, 1)
				npcHandler:say('Parabens, voce foi promovido.', cid)
			end
			talkState[talkUser] = 0
			
		elseif(getPlayerPromotionLevel(cid) == 1) then
				if(not doPlayerRemoveMoney(cid, 10000)) then
					npcHandler:say('Voce nao tem dinheiro!', cid)
				else
					setPlayerPromotionLevel(cid, 2)
					npcHandler:say('Parabens, voce foi promovido.', cid)
				end
			talkState[talkUser] = 0

		elseif(getPlayerPromotionLevel(cid) == 2) then
				if(not doPlayerRemoveMoney(cid, 50000)) then
					npcHandler:say('Voce nao tem dinheiro!', cid)
				else
					setPlayerPromotionLevel(cid, 3)
					npcHandler:say('Parabens, voce foi promovido.', cid)
				end
			talkState[talkUser] = 0

		elseif(getPlayerPromotionLevel(cid) == 3) then
				if(not doPlayerRemoveMoney(cid, 100000)) then
					npcHandler:say('Voce nao tem dinheiro!', cid)
				else
					setPlayerPromotionLevel(cid, 4)
					npcHandler:say('Parabens, voce foi promovido.', cid)
			end
			talkState[talkUser] = 0
			
		elseif(getPlayerPromotionLevel(cid) == 4) then
				if(not doPlayerRemoveMoney(cid, 150000)) then
					npcHandler:say('Voce nao tem dinheiro!', cid)
				else
					setPlayerPromotionLevel(cid, 5)
					npcHandler:say('Parabens, voce foi promovido.', cid)
			end
			talkState[talkUser] = 0

		elseif(getPlayerPromotionLevel(cid) == 5) then
				if(not doPlayerRemoveMoney(cid, 1000000)) then
					npcHandler:say('Voce nao tem dinheiro!', cid)
				else
					setPlayerPromotionLevel(cid, 6)
					npcHandler:say('Parabens, voce foi promovido.', cid)
			end
			talkState[talkUser] = 0

		end
	
	elseif(msgcontains(msg, 'no')) then
		npcHandler:say('Ok, volte quando estiver preparado.', cid)
		talkState[talkUser] = 0
		
	end

	return true
end

function msgcontains(message, keyword)
	if(type(keyword) == "table") then
		return table.isStrIn(keyword, message)
	end

	local a, b = message:lower():find(keyword:lower())
	if(a ~= nil and b ~= nil) then
		return true
	end

	return false
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
