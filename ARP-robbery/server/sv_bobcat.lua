--needs a webhook--
local webhook = '' -- Your Discord webhook for logs
local name = "Bobcat"

RegisterNetEvent('bobcat:log1')
AddEventHandler('bobcat:log', function()
	local player = GetPlayerName(source)
	local content = {
        {
        	["color"] = '8663711',
            ["title"] = "** Bobcat Security **",
            ["description"] = "**".. player .."** started the bobcat robbery",
            ["footer"] = {
                ["text"] = "ARP",
            },
        }
    }
  	PerformHttpRequest(webhook, function(err, text, headers) print(err, text, headers) end, 'POST', json.encode({username = name, embeds = content}), { ['Content-Type'] = 'application/json' })	
end)

RegisterNetEvent('bobcat:log2')
AddEventHandler('bobcat:log', function()
	local player = GetPlayerName(source)
	local content = {
        {
        	["color"] = '8663711',
            ["title"] = "** Bobcat Security **",
            ["description"] = "**".. player .."** succesfully got weapons",
            ["footer"] = {
                ["text"] = "ARP",
            },
        }
    }
  	PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({username = name, embeds = content}), { ['Content-Type'] = 'application/json' })	
end)

RegisterNetEvent('bobcat:log3')
AddEventHandler('bobcat:log', function()
	local player = GetPlayerName(source)
	local content = {
        {
        	["color"] = '8663711',
            ["title"] = "** Bobcat Security **",
            ["description"] = "**".. player .."** TRIED STEALING WEAPONS!",
            ["footer"] = {
                ["text"] = "ARP",
            },
        }
    }
  	PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({username = name, embeds = content}), { ['Content-Type'] = 'application/json' })	
end)

local firstdoor = true
local second_door = false
local third_door = false

RegisterServerEvent("ARP-bobcat:effectoutsideserver")
AddEventHandler("ARP-bobcat:effectoutsideserver", function(method)
    TriggerClientEvent("ARP-bobcat:effectoutside", -1, method)
end)

RegisterServerEvent("ARP-bobcat:effectinsideserver")
AddEventHandler("ARP-bobcat:effectinsideserver", function(method)
    TriggerClientEvent("ARP-bobcat:effectinside", -1, method)
end)

RegisterServerEvent("ARP-bobcat:bobcat:vaultdoor")
AddEventHandler("ARP-bobcat:bobcat:vaultdoor", function()
    TriggerClientEvent("ARP-bobcat:bombabumbe", -1)
end)

RegisterServerEvent("ARP-bobcat:bobcat:pedgoboom")
AddEventHandler("ARP-bobcat:bobcat:pedgoboom", function()
    TriggerClientEvent("ARP-bobcat:pedbomb", -1)
end)

RegisterServerEvent("ARP-bobcat:bobcat:securitygreenguy")
AddEventHandler("ARP-bobcat:bobcat:securitygreenguy", function()
    TriggerClientEvent("ARP-bobcat:requestblast", -1)
end)

RegisterServerEvent("first:door:sv")
AddEventHandler("first:door:sv", function(pAuto)
    if not pAuto then 
        firstdoor = not firstdoor
    else
        firstdoor = not firstdoor
    end
end)

RegisterServerEvent("first:door:triggered")
AddEventHandler("first:door:triggered", function()
    local pSrc = source
    if firstdoor then
        TriggerClientEvent("bobcat:first:door", pSrc, true)
        second_door = true
    else
        TriggerClientEvent("DoLongHudText", pSrc, "This has been hit", 2)
    end
end)


RegisterServerEvent("second:door:sv")
AddEventHandler("second:door:sv", function(pAuto)
    if not pAuto then 
        second_door = not second_door
    else
        second_door = not second_door
    end
end)

RegisterServerEvent("second:door:triggered")
AddEventHandler("second:door:triggered", function()
    local pSrc = source
    if second_door then
        TriggerClientEvent("bobcat:inside:door", pSrc, true)
        TriggerClientEvent("ARP-bobcat:third:hack:unlock", -1, true)
    else
        TriggerClientEvent("DoLongHudText", pSrc, "This has been hit", 2)
    end
end)

RegisterServerEvent("third:door:sv")
AddEventHandler("third:door:sv", function(pAuto)
    local pSrc = source

    TriggerClientEvent("ARP-bobcat:bobcatcreateped", pSrc)
    TriggerClientEvent("ARP-bobcat:crates:unlock", -1, true)
    third_door = true
end)

-- [[ Loot boxes ]]
local loot_crates = {
    [1] = {
        pos = vector3(890.44842529297, -2128.2224121094, 31.230043411255),
        type = 1, -- regular
        hit = false
    },
    [2] = {
        pos = vector3(887.35461425781, -2125.3486328125, 31.23027038574),
        type = 1, -- regular
        hit = false
    },
    [3] = {
        pos = vector3(888.68859863281, -2121.87109375, 31.230321884155),
        type = 2, -- ammo
        hit = false
    },
    [4] = {
        pos = vector3(886.11010742188, -2127.890625, 32.182075500488),
        type = 3, -- high
        hit = false
    },
}

RegisterNetEvent('bobcat:crate:check')
AddEventHandler('bobcat:crate:check', function(player_pos)
    for index, crate in pairs(loot_crates) do
        if #(player_pos - crate.pos) < 2.20 then
            TriggerClientEvent("ARP-bobcat:loot:attempt:result", source, crate, index)
        end
    end
end)

-- [[ Loot Tables and functions ]]
local loot = {
    [1] = '-134995899', -- Mac-10
    [2] = '-942620673', -- Uzi
    [3] = '-771403250', -- Heavy Pistol
    [4] = '-1075685676', -- Beretta M9
    [5] = 'c4bomb', -- C4
}

local ammo_loot = {
    [1] = 'pistolammo',
    [2] = 'subammo',
    [3] = 'rifleammo',
    [4] = 'shotgunammo',
}

local high_value_loot = {
    [1] = '-275439685', -- Sawn-off shotgun
    [2] = '615608432', -- Molotov
    [3] = 'ak47', -- Ak-47
    [4] = 'm70', -- M70
    [5] = 'weapon_uzi_foldstock',
    [6] = 'weapon_uzi_extended',
    [7] = 'craftkey',
}

RegisterNetEvent("bobcat:loot:box", function (index)

    if not third_door then
        return
    end

    -- retention check
    if loot_crates[index].was_hit then
        return 
    end

    math.randomseed(GetGameTimer())
    local reward = false
    local type = loot_crates[index].type

    if type == 1 then -- normal
        local amount = math.random(2, 3)
        if amount == 2 then
            reward = loot[math.random(1, #loot)]
            TriggerClientEvent("player:receiveItem", source, reward, 1)
            
            reward = loot[math.random(1, #loot)]
            TriggerClientEvent("player:receiveItem", source, reward, 1)
        elseif amount == 3 then
            reward = loot[math.random(1, #loot)]
            TriggerClientEvent("player:receiveItem", source, reward, 1)

            reward = loot[math.random(1, #loot)]
            TriggerClientEvent("player:receiveItem", source, reward, 1)

            reward = loot[math.random(1, #loot)]
            TriggerClientEvent("player:receiveItem", source, reward, 1)
        end

    elseif type == 2 then -- ammo
        reward = ammo_loot[math.random(1, #ammo_loot)]
        TriggerClientEvent("player:receiveItem", source, reward, math.random(1,4))

        reward = ammo_loot[math.random(1, #ammo_loot)]
        TriggerClientEvent("player:receiveItem", source, reward, math.random(1,4))

        reward = ammo_loot[math.random(1, #ammo_loot)]
        TriggerClientEvent("player:receiveItem", source, reward, math.random(1,4))
    elseif type == 3 then -- high
        reward = high_value_loot[math.random(1, #high_value_loot)]
        TriggerClientEvent("player:receiveItem", source, reward, 1)
    end
    loot_crates[index].was_hit = true
end)

function Reset()
    TriggerClientEvent("ARP-bobcat:reset", -1)
        
    firstdoor = true
    second_door = false
    third_door = false
    TriggerClientEvent("ARP-bobcat:crates:unlock", -1, false)
    TriggerClientEvent("ARP-bobcat:third:hack:unlock", -1, false)
    
    TriggerEvent("ARP-doors:changeLock-status", "bobcat_outside_one", true)
    TriggerEvent("ARP-doors:changeLock-status", "bobcat_outside_two", true)
    TriggerEvent("ARP-doors:changeLock-status", "bobcat_inside_single", true)
    TriggerEvent("ARP-doors:changeLock-status", "bobcat_inside_big_one", true)
    TriggerEvent("ARP-doors:changeLock-status", "bobcat_inside_big_two", true)

    for k, v in pairs(loot_crates) do
        v.was_hit = false
    end
end

-- Main Thread
Citizen.CreateThread(function()
    local four_hours = 900000 * 16
    Citizen.Wait(four_hours)
    print('^1[ARP-robbery] Resetting Bobcat Heist')
    Reset()
end)

