RegisterServerEvent("ARP-paletorob:updateStates")
AddEventHandler("ARP-paletorob:updateStates", function(pType, pId, pState)
    TriggerClientEvent("ARP-paletorob:updateStates", -1, pType, pId, pState)
end)

RegisterServerEvent("ARP-paletorob:give:items")
AddEventHandler("ARP-paletorob:give:items", function(loc)
    local pSrc = source
    if loc == 'outer' then
        TriggerClientEvent('player:receiveItem', pSrc, 'markedbills', math.random(10, 20))
    else
        TriggerClientEvent('player:receiveItem', pSrc, 'markedbills', math.random(20, 35))
    end

    if math.random(10) == 1 then
        TriggerClientEvent('player:receiveItem', pSrc, 'code1', 1)
    end

    if math.random(20) > 5 then
        TriggerClientEvent('player:receiveItem', pSrc, 'mk2usbdevice', 1)
    end
end)

RegisterServerEvent("ARP-paletorob:paleto:vaultdooropen")
AddEventHandler("ARP-paletorob:paleto:vaultdooropen", function()
    TriggerClientEvent("ARP-paletorob:vaultdooropen", -1)
end)

RegisterServerEvent("ARP-paletorob:paleto:vaultdoorclose")
AddEventHandler("ARP-paletorob:paleto:vaultdoorclose", function()
    TriggerClientEvent("ARP-paletorob:vaultdoorclose", -1)
end)

Citizen.CreateThread(function()
    while true do 
        Citizen.Wait(1800000) -- Clears every 30 mins
        TriggerClientEvent("ARP-paletorob:resetBank", -1)
        TriggerEvent("ARP-doors:changeLock-status", 184, true)
		print("^1[ARP-robbery] Resetting Paleto Robbery^0")
    end
end)