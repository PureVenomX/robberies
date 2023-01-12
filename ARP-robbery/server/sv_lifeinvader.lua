RegisterServerEvent("life-invader:hasrobbed")
AddEventHandler("life-invader:hasrobbed", function(locations, num)
    PerformHttpRequest(DISCORD_WEBHOOK5, function(err, text, headers) end, 'POST', json.encode({username = DISCORD_NAME5, avatar_url = DISCORD_IMAGE}), { ['Content-Type'] = 'application/json' })
    pSrc = source
    locations[num].was_hit = true
    HitCounter = HitCounter + 1
    if HitCounter >= 5 then
        TriggerClientEvent("life-invader:complete", pSrc)
        HitCounter = 0
    end
end)

RegisterServerEvent("life-invader:request:loot")
AddEventHandler("life-invader:request:loot", function(loot_type)
    local src = source
    math.randomseed(GetGameTimer())

    -- Common Loot
    if loot_type == "desk" then
        local chance =  math.random(1, 100)

        local wallet = math.random(1,3)
        if wallet == 2 then 
            TriggerClientEvent("player:receiveItem", src, "wallet", 1)
        else
        TriggerClientEvent("player:receiveItem", src, "ethernet", 1)

        end


        if chance == 96 then
            TriggerClientEvent("player:receiveItem", src, "redlaptop", 1)
        end
        -- USBS
        if chance > 15 and chance < 25 then
            TriggerClientEvent("player:receiveItem", src, "fcadrive", 1)
        elseif chance >= 25 and chance <= 35 then
            TriggerClientEvent("player:receiveItem", src, "rcadrive", 1)
        elseif chance >= 55 and chance <= 65 then
            TriggerClientEvent("player:receiveItem", src, "empty-fob", 1)
            TriggerClientEvent("player:receiveItem", src, "fcadrive", 1)
        elseif chance >= 65 and chance <= 75 then
            TriggerClientEvent("player:receiveItem", src, "deludamol",  math.random(1, 4))
        elseif chance >= 75 then
            TriggerClientEvent("player:receiveItem", src, "drugx", math.random(1, 2))
            TriggerClientEvent("player:receiveItem", src, "fcadrive", 1)
        end
    end

    if loot_type == "svdesk" then
        local m =  math.random(1, 1000)
        TriggerClientEvent("player:receiveItem", src, "ethernet", 1)
        if m <= 990 and m >= 100 then
            TriggerClientEvent("player:receiveItem", src, "hacklaptop", 1)
            TriggerClientEvent("player:receiveItem", src, "rcadrive", 1)
        elseif m == 992 then
            TriggerClientEvent("player:receiveItem", src, "goldlaptop", 1)
        else
            TriggerClientEvent("player:receiveItem", src, "redlaptop", 1)
        end
    end

    if loot_type == "cage" then
        local x = math.random(1, 10)
        TriggerClientEvent("player:receiveItem", src, "rcadrive", 1)
        TriggerClientEvent("player:receiveItem", src, "bobcat-employee-card", math.random(1,2))
        if x <= 9 then
            TriggerClientEvent("player:receiveItem", src, "redlaptop", math.random(1,2))
        elseif x == 10 then
            TriggerClientEvent("player:receiveItem", src, "goldlaptop", math.random(1,2))
        end
        if x == 4 or x >= 8 then
            TriggerClientEvent("player:receiveItem", src, "lifeinvader-janitor", math.random(0, 2))
        end
    end

    -- High End
    if loot_type == "janitor" then
        local type = math.random(1, 100)
        if type < 50 then
            TriggerClientEvent("player:receiveItem", src, "rcadrive", 1)
            TriggerClientEvent("player:receiveItem", src, "redlaptop", 1)
            TriggerClientEvent("player:receiveItem", src, "key3", 1)
        elseif type > 50  then
            TriggerClientEvent("player:receiveItem", src, "redlaptop", 2)
            TriggerClientEvent("player:receiveItem", src, "goldlaptop", 1)
        elseif type == 50  then
            TriggerClientEvent("player:receiveItem", src, "goldlaptop", 3)
        end
    end
end)

Citizen.CreateThread(function()
    Citizen.Wait(2000)
    TriggerClientEvent("life-invader:reset", -1)
    while true do
        Citizen.Wait(3600000) -- Clears every 60 mins
        TriggerClientEvent("life-invader:reset", -1)
        print("^1 "..GetCurrentResourceName().." Resetting Life-invader ^0")
    end
end)