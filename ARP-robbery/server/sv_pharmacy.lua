local HasBeenHit = false
local HitCounter = 0
--needs a webhook--
local DISCORD_WEBHOOK5 = ""
local DISCORD_NAME5 = "Pharmacy Heist"

local STEAM_KEY = "0C007CC382AB06D1D99D9B45EC3924B1"
local DISCORD_IMAGE = "https://i.imgur.com/zviw6oW.png" -- default is FiveM logo

local FRONT_DOOR_ID = 385
local BACK_DOOR_ID = 386

RegisterServerEvent("pharmacy:hasrobbed")
AddEventHandler("pharmacy:hasrobbed", function(locations, num)
    PerformHttpRequest(DISCORD_WEBHOOK5, function(err, text, headers) end, 'POST', json.encode({username = DISCORD_NAME5, avatar_url = DISCORD_IMAGE}), { ['Content-Type'] = 'application/json' })
    pSrc = source
    locations[num].was_hit = true
    TriggerEvent("ARP-doors:changeLock-status", "pharm_front", true)
    TriggerEvent("ARP-doors:changeLock-status", "pharm_back", true)
    HitCounter = HitCounter + 1
    TriggerClientEvent("pharmacy:robbed", -1, locations)
    if HitCounter >= 5 then
        TriggerClientEvent("pharmacy:complete", pSrc)
        HitCounter = 0
    end
end)

RegisterServerEvent("pharmacy:request:loot")
AddEventHandler("pharmacy:request:loot", function(loot_type)
    local src = source

    -- Common Loot
    if loot_type == "rx" then
        TriggerClientEvent("player:receiveItem", src, "deludamol", math.random(5, 10))
        TriggerClientEvent("player:receiveItem", src, "oxy", math.random(5, 10))
        TriggerClientEvent("player:receiveItem", src, "drugx", math.random(5,10))
        TriggerClientEvent("player:receiveItem", src, "mvial", math.random(5, 10))
    end

    if loot_type == "stims" then
        TriggerClientEvent("player:receiveItem", src, "adrenaline", math.random(1, 4))
        TriggerClientEvent("player:receiveItem", src, "molly", math.random(5, 10))
        TriggerClientEvent("player:receiveItem", src, "drugx", math.random(5, 10))
        TriggerClientEvent("player:receiveItem", src, "mvial", math.random(5, 10))
    end

    -- High End
    if loot_type == "rand" then
        local type = math.random(1, 100)
        if type < 50 then
            TriggerClientEvent("player:receiveItem", src, "molly", math.random(5, 10))
            TriggerClientEvent("player:receiveItem", src, "oxy", math.random(5, 10))
            TriggerClientEvent("player:receiveItem", src, "tourniquet", math.random(3, 6))
            TriggerClientEvent("player:receiveItem", src, "drugx", math.random(5, 10))
            TriggerClientEvent("player:receiveItem", src, "mvial", math.random(1, 5))
            TriggerClientEvent("player:receiveItem", src, "key2", math.random(1, 2))
        elseif type > 50  then
            TriggerClientEvent("player:receiveItem", src, "deludamol", math.random(5, 10))
            TriggerClientEvent("player:receiveItem", src, "oxy", math.random(5, 10))
            TriggerClientEvent("player:receiveItem", src, "molly", math.random(5, 10))
            TriggerClientEvent("player:receiveItem", src, "drugx", math.random(1, 5))
            TriggerClientEvent("player:receiveItem", src, "mvial", math.random(5, 10))
        elseif type == 50  then
            TriggerClientEvent("player:receiveItem", src, "molly", 4)
            TriggerClientEvent("player:receiveItem", src, "1gmeth", 10)
            TriggerClientEvent("player:receiveItem", src, "morphinesyringe", 5)
            TriggerClientEvent("player:receiveItem", src, "drugx", 5)
            TriggerClientEvent("player:receiveItem", src, "mvial", 5)
        end
    end
end)

Citizen.CreateThread(function()
    Citizen.Wait(2000)
    TriggerClientEvent("pharmacy:reset", -1)
    while true do
        Citizen.Wait(3600000) -- Clears every 60 mins
        TriggerClientEvent("pharmacy:reset", -1)
        print("^1 "..GetCurrentResourceName().." Resetting Pharmacy ^0")
    end
end)