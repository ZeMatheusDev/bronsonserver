function onLogin(cid)

	local rate = 1.5 -- 50%
	local config = {
	welvip = "voce tem "..((rate - 1)*100).."% de exp a mais agora!",
	not_vip = "Tornesse vip e ganhe "..((rate - 1)*100).."% a mais de experiencia!",
	vip = isPremium(cid)
	}
	
	if (config.vip == TRUE) then
	doPlayerSetExperienceRate(cid, rate)
	doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, config.welvip)
	else
	doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, config.not_vip)
	end
	return TRUE
	end