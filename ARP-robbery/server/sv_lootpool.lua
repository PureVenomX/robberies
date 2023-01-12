RegisterServerEvent("Fleeca:success:lockpick")
AddEventHandler("Fleeca:success:lockpick", function()
    local pSrc = source
    TriggerClientEvent('player:receiveItem', pSrc, 'cashstack', math.random(8, 15))

    if math.random(100) > 95 then
        TriggerEvent("player:receiveItem", pSrc, 'inkedmoneybag', math.random(5, 10))
    end

	if math.random(20) > 17 then
		local keys = {[1] = "securitygreen", [2] = "securitygreen"}
		TriggerEvent("player:receiveItem", keys[math.random(1, #keys)], 1)
	end

    if math.random(10) > 9 then
        TriggerClientEvent('player:receiveItem', pSrc, 'code2', 1)
    end

    if math.random(10) > 9 then
        TriggerClientEvent('player:receiveItem', pSrc, 'code3', 2)
    end
end)

RegisterServerEvent("Pacific:success:hacking")
AddEventHandler("Pacific:success:hacking", function()
    local pSrc = source
    TriggerClientEvent('player:receiveItem', pSrc, 'inkedmoneybag', math.random(10, 15))
    if math.random(20) > 16 then
        TriggerClientEvent('player:receiveItem', pSrc, 'gruppe-yellow', 1)
    end
end)