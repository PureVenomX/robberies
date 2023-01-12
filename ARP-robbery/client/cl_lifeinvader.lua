local DoorLocations = {
    ["RL_DOOR"] = { x = -1083.2283935547, y = -259.62145996094, z = 37.763313293457},
    ["FR_DOOR"] = { x = -1063.5177001953, y = -241.51522827148, z = 39.733150482178},
    ["SERVER_DOOR"] = {x = -1055.2108154297, y = -236.46099853516, z = 44.021129608154},
    ["MIDDLE_DOOR"] = {x = -1063.5177001953, y = -241.51522827148, z = 39.733150482178},
    ["JANITOR_DOOR"] = {x = -1051.9141845703, y = -236.69848632813, z = 39.733180999756},
}


LOOT_LOCATIONS = {
    [1] = {
        pos = vector4(-1059.6796875, -248.22201538086, 44.021068572998, 102.86806488037), -- Desk 1
        was_hit = false,
        type = "desk"
    },
    [2] = {
        pos = vector4(-1060.1787109375, -245.62631225586, 44.021068572998, 311.42034912109), -- Desk 2
        was_hit = false,
        type = "desk"
    },
    [3] = {
        pos = vector4(-1056.1740722656, -245.43244934082, 44.021072387695, 284.58056640625), -- Desk 3
        was_hit = false,
        type = "desk"
    },
    [4] = {
        pos = vector4(-1057.587890625, -244.25422668457, 44.021068572998, 106.47452545166), -- Desk 4
        was_hit = false,
        type = "desk"
    },
    [5] = {
        pos = vector4(-1055.4569091797, -242.76826477051, 44.021068572998, 213.26173400879), -- Desk 5
        was_hit = false,
        type = "desk"
    },
    [6] = {
        pos = vector4(-1053.1628417969, -243.59519958496, 44.021068572998, 276.15707397461), -- Desk 7
        was_hit = false,
        type = "desk"
    },
    [7] = {
        pos = vector4(-1050.2666015625, -240.35795593262, 44.021076202393, 56.800491333008), -- Desk 8
        was_hit = false,
        type = "desk"
    },
    [8] = {
        pos = vector4(-1050.2435302734, -242.76187133789, 44.021049499512, 115.47518920898), -- Desk 9
        was_hit = false,
        type = "desk"
    },
    [9] = {
        pos = vector4(-1056.8823242188, -233.16342163086, 44.021156311035, 314.56079101563), -- Server Room Desk 1
        was_hit = false,
        type = "svdesk"
    },
    [10] = {
        pos = vector4(-1053.6779785156, -230.54170227051, 44.020957946777, 228.37678527832), -- Server Room Desk 2
        was_hit = false,
        type = "svdesk"
    },
    [11] = {
        pos = vector4(-1055.4532470703, -231.01351928711, 44.020969390869, 25.337385177612), -- Server Room Cage
        was_hit = false,
        type = "cage"
    },
    [12] = {
        pos = vector4(-1047.3212890625, -236.80731201172, 38.259689331055, 27.642248153687), -- Janitor Boxes 1
        was_hit = false,
        type = "janitor"
    },
    [13] = {
        pos = vector4(-1044.8486328125, -234.92356872559, 37.964962005615, 10.567861557007), -- Janitor Boxes 2
        was_hit = false,
        type = "janitor"
    },
}

JANITOR_DOOR_STATUS = true
SERVER_DOOR_STATUS = true
FRONT_DOOR_STATUS = false

RegisterNetEvent("life-invader:cage")
AddEventHandler("life-invader:cage", function()
    local ped = PlayerPedId()
    local police = exports["police"]:CountPolice()
    if police >= 3 then
        if #(vector3(-1055.3179931641, -230.82859802246, 44.021026611328) - GetEntityCoords(ped)) < 1.5 then
            if exports["ARP-inventory"]:hasEnoughOfItem("thermitecharge", 1, false) then
                TriggerEvent("thermitecharge:props")
                exports['ARP-memory']:StartMinigame({
                    success = 'life-invader:cage-door-passed',
                    fail = 'life-invader:f-door-failed'
                })
            else
                TriggerEvent("DoLongHudText", "You need something else....")
            end

        end
    else
        TriggerEvent("DoLongHudText", "Not enough police in the city!", 2)
    end
end)

RegisterNetEvent("life-invader:front-door")
AddEventHandler("life-invader:front-door", function()
    local ped = PlayerPedId()
    local police = exports["police"]:CountPolice()
    if police >= 3  then
        if #(vector3(-1081.5257568359, -259.93078613281, 37.808296203613) - GetEntityCoords(ped)) < 1.5 then
            -- replace with swipe card
            if exports["ARP-inventory"]:hasEnoughOfItem("lifeinvader-manager", 1, false) or
                     exports["ARP-inventory"]:hasEnoughOfItem("lifeinvader-employee", 1, false) or
                     exports["ARP-inventory"]:hasEnoughOfItem("lifeinvader-janitor", 1, false) then
                TriggerEvent("animation:PlayAnimation", "nervous")
                TriggerEvent("ARP-dispatch:lifeinvaderobbery")
                exports['ARP-memory']:StartMinigame({
                    success = 'life-invader:f-door-passed',
                    fail = 'life-invader:f-door-failed'
                })
            else
                TriggerEvent("DoLongHudText", "You need something else....")
            end

        end
    else
        TriggerEvent("DoLongHudText", "Not enough police in the city!", 2)
    end
end)

RegisterNetEvent("life-invader:server-door")
AddEventHandler("life-invader:server-door", function()
    local ped = PlayerPedId()
    local police = exports["police"]:CountPolice()
    if police >= 3 then
        if #(vector3(-1055.2108154297, -236.46099853516, 44.021129608154) - GetEntityCoords(ped)) < 1.5 then
            -- replace with swipe card
            if exports["ARP-inventory"]:hasEnoughOfItem("lifeinvader-janitor", 1, false) or
                exports["ARP-inventory"]:hasEnoughOfItem("lifeinvader-manager", 1, false) then
                TriggerEvent("animation:PlayAnimation", "nervous")
                TriggerEvent("ARP-dispatch:lifeinvaderobbery")
                exports['ARP-memory']:StartMinigame({
                    success = 'life-invader-s-door-passed',
                    fail = 'life-invader-s-door-failed'
                })
            else
                TriggerEvent("DoLongHudText", "You need something else....")
            end

        end
    else
        TriggerEvent("DoLongHudText", "Not enough police in the city!", 2)
    end
end)

RegisterNetEvent("life-invader:middle-door")
AddEventHandler("life-invader:middle-door", function()
    local ped = PlayerPedId()
    local police = exports["police"]:CountPolice()
    if police >= 3 then
        if #(vector3(-1063.5177001953, -241.51522827148, 39.733150482178) - GetEntityCoords(ped)) < 1.5 then
            -- replace with swipe card
            if exports["ARP-inventory"]:hasEnoughOfItem("lifeinvader-manager", 1, false) or
                    exports["ARP-inventory"]:hasEnoughOfItem("lifeinvader-employee", 1, false) or
                    exports["ARP-inventory"]:hasEnoughOfItem("lifeinvader-janitor", 1, false) then
                TriggerEvent("animation:PlayAnimation", "nervous")
                TriggerEvent("ARP-dispatch:lifeinvaderobbery")
                exports['ARP-memory']:StartMinigame({
                    success = 'life-invader-m-door-passed',
                    fail = 'life-invader-m-door-failed'
                })
            else
                TriggerEvent("DoLongHudText", "You need something else....")
            end

        end
    else
        TriggerEvent("DoLongHudText", "Not enough police in the city!", 2)
    end
end)

RegisterNetEvent("life-invader:janitor-door")
AddEventHandler("life-invader:janitor-door", function()
    local ped = PlayerPedId()
    local police = exports["police"]:CountPolice()
    if police >= 3 then
        if #(vector3(-1051.9141845703, -236.69848632813, 39.733180999756) - GetEntityCoords(ped)) < 1.5 then
            -- replace with swipe card
            if exports["ARP-inventory"]:hasEnoughOfItem("lifeinvader-janitor", 1, false) then
                TriggerEvent("animation:PlayAnimation", "nervous")
                exports['ARP-memory']:StartMinigame({
                    success = 'life-invader-j-door-passed',
                    fail = 'life-invader:j-door-failed'
                })
            else
                TriggerEvent("DoLongHudText", "You need something else....")
            end

        end
    else
        TriggerEvent("DoLongHudText", "Not enough police in the city!", 2)
    end
end)

RegisterNetEvent("life-invader:cage-door-passed", function()
    TriggerEvent('DoLongHudText', "Success!", 3)
    TriggerServerEvent("life-invader:request:loot", "cage")
    TriggerEvent("inventory:removeItem", "thermite", 1)
end)

RegisterNetEvent("life-invader:f-door-passed", function()
    TriggerEvent('DoLongHudText', "Success!", 3)
    FRONT_DOOR_STATUS = false
    TriggerServerEvent("ARP-doors:changeLock-status", "Life Invader Back Right", false)
    TriggerServerEvent("ARP-doors:changeLock-status", "Life Invader Back Left", false)
end)

RegisterNetEvent("life-invader-s-door-passed", function()
    TriggerEvent('DoLongHudText', "Success!", 3)
    SERVER_DOOR_STATUS = false
    TriggerServerEvent("ARP-doors:changeLock-status", "Life Invader Server 1", false)
    TriggerServerEvent("ARP-doors:changeLock-status", "Life Invader Server 2", false)
    TriggerEvent("inventory:removeItem", "lifeinvader-janitor", 1)
end)

RegisterNetEvent("life-invader-m-door-passed", function()
    TriggerEvent('DoLongHudText', "Success!", 3)
    TriggerServerEvent("ARP-doors:changeLock-status", "Life Invader Middle", false)
    TriggerEvent("inventory:removeItem", "lifeinvader-manager", 1)

end)

RegisterNetEvent("life-invader-j-door-passed", function()
    TriggerEvent('DoLongHudText', "Success!", 3)
    JANITOR_DOOR_STATUS = false
    TriggerServerEvent("ARP-doors:changeLock-status", "Life Invader Janitor", false)
end)

RegisterNetEvent("life-invader:server-room:steal", function()
    TriggerEvent('life-invader:cage')
end)

RegisterNetEvent('life-invader:teleport:sneak-out')
AddEventHandler('life-invader:teleport:sneak-out', function()
    DoScreenFadeOut(1)
    Citizen.Wait(100)
    TriggerEvent("dooranim")
    TriggerEvent('InteractSound_CL:PlayOnOne', 'elevator', 0.8)
    SetEntityCoords(PlayerPedId(), -1041.7009277344, -240.92250061035, 37.955280303955)
    SetEntityHeading(PlayerPedId(),  211.55703735352)
    DoScreenFadeIn(1000)
    DoScreenFadeIn(1000)
    Citizen.Wait(1000)
end)

local function GiveItems(loot_type)
    TriggerServerEvent("life-invader:request:loot", loot_type)
end

local function RobDesk(location_index)
    Citizen.Wait(1500)
    ClearPedTasks(PlayerPedId())
    local plyPos = GetEntityCoords(PlayerPedId())
    TriggerEvent('life-invade:alert')
    TriggerServerEvent("life-invade:hasrobbed", LOOT_LOCATIONS, location_index)
    local loot_type = LOOT_LOCATIONS[location_index].type
    GiveItems(loot_type)
    LOOT_LOCATIONS[location_index].was_hit = true
end

local function AttemptLifeInvaderRob(location_index)
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    local was_hit = LOOT_LOCATIONS[location_index].was_hit
    Citizen.Wait(1)
    if not IsPedRunning(PlayerPedId()) and not IsPedSprinting(PlayerPedId()) and not was_hit then
        local coords = LOOT_LOCATIONS[location_index].pos
        local player = GetPlayerPed(-1)
        SetEntityHeading(player, LOOT_LOCATIONS[location_index].pos.w)
        TriggerEvent("animation:PlayAnimation", "cokecut")
        Citizen.Wait(1000)
        RobDesk(location_index)
    end
end






function GetDoorVector3(location)
    if DoorLocations[location] ~= nil then
        return vector3(DoorLocations[location]["x"], DoorLocations[location]["y"], DoorLocations[location]["z"])
    else
        print('Life-invader: GetDoorVector3 failed for '..location)
        return false
    end
end

function GetDoorLocation(location)
    if DoorLocations[location] ~= nil then
        return DoorLocations[location]
    else
        print('Life-invader: GetDoorLocation failed for '..location)
        return false
    end
end

function IsNearLifeDoor(location)
    if DoorLocations[location] ~= nil then
        return #(GetEntityCoords(PlayerPedId()) - GetDoorVector3(location)) <= 5
    end
end

local function DrawText3Ds(x, y, z, msg)
    local text = "Press [~q~E~s~]"..msg
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)

    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)

    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 370
    DrawRect(_x, _y + 0.0125, 0.015 + factor, 0.03, 41, 11, 41, 68)
end

local function ResetLifeInvader()
    for k, v in pairs(LOOT_LOCATIONS) do
        v.was_hit = false
    end
    TriggerServerEvent("ARP-doors:changeLock-status", "Life Invader Main Right", true)
    TriggerServerEvent("ARP-doors:changeLock-status", "Life Invader Main Left", true)
    TriggerServerEvent("ARP-doors:changeLock-status", "Life Invader Middle", true)
    TriggerServerEvent("ARP-doors:changeLock-status", "Life Invader Janitor", true)
    TriggerServerEvent("ARP-doors:changeLock-status", "Life Invader Server 1", true)
    TriggerServerEvent("ARP-doors:changeLock-status", "Life Invader Server 2", true)
    HAS_ROBBED = false
end

RegisterNetEvent("life-invader:reset")
AddEventHandler("life-invader:reset", function()
    ResetLifeInvader()
end)


--[[ Main Thread ]]
Citizen.CreateThread(function()
    while true do
        if (#(GetEntityCoords(PlayerPedId()) - vector3(-1042.4034423828, -239.94717407227, 37.964962005615)) < 1 ) then
            DrawText3Ds(-1042.4034423828, -239.94717407227, 37.964962005615, "to sneak out")
            if IsControlJustPressed(1,38)  then
                if not JANITOR_DOOR_STATUS then
                    TriggerEvent('life-invader:teleport:sneak-out')
                else
                    TriggerEvent("DoLongHudText", "Need to unlock the janitor door", 2)
                end
            end
        elseif (#(GetEntityCoords(PlayerPedId()) - vector3(-1055.3122558594, -230.92810058594, 44.021011352539)) < 1 ) then
            DrawText3Ds(-1054.9274902344, -230.66018676758, 44.020942687988, "to blow the cage")
            if IsControlJustPressed(1,38)  then
                if not SERVER_DOOR_STATUS then
                    TriggerEvent('life-invader:server-room:steal')
                else
                    TriggerEvent("DoLongHudText", "Need to unlock the server door", 2)
                end
            end
        elseif not FRONT_DOOR_STATUS then
            if (#(GetEntityCoords(PlayerPedId()) - vector3(-1057.5059814453, -244.41213989258, 44.021068572998)) < 50.0 ) then
                for index, location in pairs(LOOT_LOCATIONS) do
                    if (#(GetEntityCoords(PlayerPedId()) - vector3(location.pos.x, location.pos.y, location.pos.z)) < 0.5 ) then
                        if (not location.was_hit)  then
                            DrawText3Ds(location.pos.x, location.pos.y, location.pos.z, "to steal their shit")
                            if IsControlJustPressed(1,38)  then
                                if  exports["police"]:CountPolice() >= 0 then
                                    AttemptLifeInvaderRob(index)
                                else
                                    TriggerEvent("customNotification","Not enough cops on duty!", 2)
                                end
                            end
                        end
                    end
                end
            else
                Citizen.Wait(6000)
            end
        else
            Citizen.Wait(2000)
        end
        Citizen.Wait(0)
    end
end)
