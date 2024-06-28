local config = {
    days = 1,
    removeOnUse = true,
    maxDays = 360
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(getPlayerPremiumDays(cid) > config.maxDays) then
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You can not buy more than " .. config.days + config.maxDays .. " days of Premium Account.")
		doSendMagicEffect(getPlayerPosition(cid), CONST_ME_POFF)
		return TRUE
	end
	doPlayerAddPremiumDays(cid, config.days)
	doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Voce ganhou " .. config.days .. " dia de premium.")

    doRemoveItem(item.uid, 1)

	return TRUE
end