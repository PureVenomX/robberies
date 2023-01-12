local lootSpots = {
    [1] = {["x"] = -103.054, ["y"] = 6475.795, ["z"] = 30.727, ["disabled"] = false, ["location"] = "inner"},
    [2] = {["x"] = -103.635, ["y"] = 6477.81, ["z"] = 30.727, ["disabled"] = false, ["location"] = "inner"},
    [3] = {["x"] = -105.525, ["y"] = 6478.377, ["z"] = 30.727, ["disabled"] = false, ["location"] = "inner"},
    [4] = {["x"] = -107.045, ["y"] = 6473.687, ["z"] = 30.727, ["disabled"] = false, ["location"] = "outer"},
    [5] = {["x"] = -107.610, ["y"] = 6475.632, ["z"] = 30.727, ["disabled"] = false, ["location"] = "outer"},
}

CL_FIREALARM_STATE = false

Citizen.CreateThread(function()
    while true do
        local ped = PlayerPedId()

        for i=1, #lootSpots do
            local dist = #(vector3(lootSpots[i].x, lootSpots[i].y,lootSpots[i].z) - GetEntityCoords(ped))
            if dist <= 1.5 then
                found = true
                if not lootSpots[i].disabled then
                    DrawMarker(27, lootSpots[i].x, lootSpots[i].y,lootSpots[i].z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.4, 0.4, 0.4, 176, 4, 4, 255, false, false, 0, 0)
                else
                    DrawMarker(27, lootSpots[i].x, lootSpots[i].y,lootSpots[i].z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.4, 0.4, 0.4, 165, 186, 7, 255, false, false, 0, 0)
                end
            end
        end

        if found then
            Citizen.Wait(0)
        else
            Citizen.Wait(1000)
        end
        found = false
    end
end)


RegisterNetEvent('ARP-paletorob:power:attempt')
AddEventHandler('ARP-paletorob:power:attempt', function()
    local ped = PlayerPedId()
    local IsNearLoot = IsNearLoot()
    local police = exports["police"]:CountPolice()
    if police >= 4 then
        if IsNearLoot then
            for i=1, #lootSpots do
                if #(vector3(lootSpots[i].x, lootSpots[i].y,lootSpots[i].z) - GetEntityCoords(ped)) <= 1.5 then
                    if not lootSpots[i].disabled then
                            if exports["ARP-inventory"]:hasEnoughOfItem("safecrackingkit", 1, false) then
                                TriggerEvent("animation:search:bank")
                                local finished = exports["ARP-taskbar"]:taskBar(math.random(15000, 20000), "Opening Box")
                                if finished == 100 then
                                    lockpicking = false
                                    local lootId, loc = GetNearestLootSpot()
                                    TriggerServerEvent("ARP-paletorob:updateStates", "loot", lootId, true)
                                    TriggerServerEvent("ARP-paletorob:give:items", loc)
                                else
                                    lockpicking = false
                                end
                            else
                                TriggerEvent("DoLongHudText", "You need something!", 2)
                            end
                        end
                    end
                end
            end
        
    else
        TriggerEvent("DoLongHudText", "Not enough police in the city!", 2)
    end
end)



function StartPaleto()
    local ply = PlayerPedId()
    local plyCoords = GetEntityCoords(ply)
    pos = GetEntityCoords(ply)
    ClearPedTasksImmediately(ply)
    Wait(0)
    loadDicts()
    Wait(0)
    while GetIsTaskActive(ply, 35) do
        Wait(0)
    end
    ClearPedTasksImmediately(ply)
    Wait(0)
    SetEntityHeading(ply, 117.78308105469)
    TriggerEvent("animation:PlayAnimation","cokecut")
end

RegisterNetEvent('ARP-paletorob:attempt:hack')
AddEventHandler('ARP-paletorob:attempt:hack', function()
    local ped = PlayerPedId()
    if #(vector3(-105.56522369385, 6470.560546875, 31.626699447632) - GetEntityCoords(ped)) > 1.5 then return end
    local police = exports["police"]:CountPolice()
    if police >= 4 then
        if exports['ARP-inventory']:hasEnoughOfItem('rcadrive', 1) then
            StartPaleto()
            exports['ARP_dispatch']:SendAlert("AlertPaleto")
            local card = exports["ARP-taskbar"]:taskBar(9000,"Connecting to the pc!")
            if card == 100 then
                exports['ARP-hacking']:OpenHackingGame(function(Success)
                    if success then
                        FreezeEntityPosition(ped, false)
                        TriggerEvent('DoLongHudText', "Hack successful", 1)
                        CallbackUnlockFirstDoor()
                    else
                        FreezeEntityPosition(ped, false)
                        TriggerEvent('inventory:removeItem', 'rcadrive', 1)
                        CallbackUnlockFirstDoor2()
                    end
                end)
            end
        else
            TriggerEvent("DoLongHudText", "Missing something!", 2)
        end
    else
        TriggerEvent("DoLongHudText", "Not enough police in the city!", 2)
    end
end)

RegisterNetEvent('ARP-robbery:client:fireAlarmState')
AddEventHandler('ARP-robbery:client:fireAlarmState', function(state)
    CL_FIREALARM_STATE = state
end)

RegisterNetEvent("paleto:firealerm")
AddEventHandler("paleto:firealerm", function()
    TriggerServerEvent("ARP-robbery:server:setFireAlarmState")
    if not CL_FIREALARM_STATE then
        TriggerServerEvent("ARP-robbery:server:getFireAlarmState")
        Citizen.Wait(100)
        TriggerEvent("animation:PlayAnimation","swatfwd")
        TriggerEvent('ultra-voltlab', 20, function(outcome,reason)
            if outcome == 1 then
                TriggerEvent("DoLongHudText", "Fire alarm pulled, gates are open!", 1)
            elseif  outcome == 2 then
                TriggerEvent("DoLongHudText", "YOU RAN OUT OF TIME!", 3)
            else
                TriggerServerEvent("ARP-robbery:server:setFireAlarmState")
                TriggerEvent("DoLongHudText", "You couldn't even get the firealarm to work!", 3)
            end
        end)
        else
            TriggerEvent("DoLongHudText", "This shit has already been pulled!", 3)
    end
end)

RegisterNetEvent('animation:search:bank')
AddEventHandler('animation:search:bank', function()
    local lPed = PlayerPedId()
    RequestAnimDict("mini@repair")
    while not HasAnimDictLoaded("mini@repair") do
        Citizen.Wait(0)
    end
    while lockpicking do

        if not IsEntityPlayingAnim(lPed, "mini@repair", "fixing_a_player", 3) then
            ClearPedSecondaryTask(lPed)
            TaskPlayAnim(lPed, "mini@repair", "fixing_a_player", 8.0, -8, -1, 16, 0, 0, 0, 0)
        end
        Citizen.Wait(1)
    end
    ClearPedTasks(lPed)
end)

function CallbackUnlockFirstDoor(pSuccess)
    local ped = PlayerPedId()
    FreezeEntityPosition(ped, true)
    local finished = exports["ARP-taskbar"]:taskBar(5000, "Unlocking Door")
    exports['ARP_dispatch']:SendAlert("AlertPaleto")
    FreezeEntityPosition(ped, false)
    if (finished == 100) then
        TriggerEvent("DoLongHudText", "Door Unlocked!", 3)
        TriggerServerEvent('ARP-paletorob:updateStates', "loots", true)
        TriggerServerEvent("ARP-paletorob:paleto:vaultdooropen", vault)
        TriggerServerEvent("ARP-doors:changeLock-status", 184, false)
        FreezeEntityPosition(ped, false)
    end
    FreezeEntityPosition(ped, false)
    TriggerEvent('inventory:removeItem', 'rcadrive', 1)
end

function CallbackUnlockFirstDoor2(pSuccess)
    local ped = PlayerPedId()
    FreezeEntityPosition(ped, false)
    TriggerEvent('inventory:removeItem', 'rcadrive', 1)
    TriggerEvent('DoLongHudText', 'You failed, loser!', 2)
end

RegisterNetEvent("ARP-paletorob:vaultdooropen")
AddEventHandler("ARP-paletorob:vaultdooropen", function()
    local count = 0
    repeat
        local vault = GetClosestObjectOfType(-105.6177,6472.0581,31.6267, 5.0, -1185205679, false, false, false)
        local heading = GetEntityHeading(vault) + 0.10
        SetEntityHeading(vault, heading)
        count = count + 1
        Wait(10)
    until count == 1100
end)

RegisterNetEvent("ARP-paletorob:vaultdoorclose")
AddEventHandler("ARP-paletorob:vaultdoorclose", function()
    local count = 0
    repeat
        local vault = GetClosestObjectOfType(-105.6177,6472.0581,31.6267, 5.0, -1185205679, false, false, false)
        local heading = GetEntityHeading(vault)
        SetEntityHeading(vault, heading)
        count = count + 1
        Wait(10)
    until count == 1100
end)

RegisterNetEvent('ARP-paletorob:updateStates')
AddEventHandler('ARP-paletorob:updateStates', function(type,id,state)
    if type == "loot" then 
        lootSpots[id].disabled = state
    end
end)

RegisterNetEvent('ARP-paletorob:resetBank')
AddEventHandler('ARP-paletorob:resetBank', function()
    for i=1, #lootSpots do
        lootSpots[i].disabled = false
    end
    CL_FIREALARM_STATE = false
    TriggerServerEvent("ARP-paletorob:paleto:vaultdoorclose", vault)
end)

RegisterNetEvent("paleto:passed", function()
    local station = GetNearestStation()
    TriggerServerEvent("ARP-paletorob:updateStates", "station", station, true)
    local x = 20
    while 0 ~= i do
        Citizen.Wait(0)
        SetArtificialLightsState(true)
        x = x - 1
    end
    FreezeEntityPosition(PlayerPedId(), false)
end)

RegisterNetEvent("paleto:failed", function()
    FreezeEntityPosition(PlayerPedId(), false)
    exports['ARP_dispatch']:SendAlert("AlertGrid")
    TriggerEvent("DoLongHudText", "You Failed Loser!", 2)
end)

function IsPowerDisabled()
    local amount = 0
    for i=1, #powerStations do
        if powerStations[i].disabled then
            amount = amount + 1
        end
    end
    if amount == #powerStations then
        local i = 2000
        while 0 ~= i do
            Citizen.Wait(0)
            SetArtificialLightsState(true)
            i = i - 1
        end
        return true
    end
    return false
end

RegisterCommand('pp', function()
    local i = 2000
    while 0 ~= i do
        Citizen.Wait(0)
        SetArtificialLightsState(true)
        i = i - 1
    end
end)

function IsNearStation()
    for i=1, #powerStations do
        if #(vector3(powerStations[i].x, powerStations[i].y,powerStations[i].z) - GetEntityCoords(PlayerPedId())) <= 1.5 then
            return true
        end
    end
    return false
end

function IsNearLoot()
    for i=1, #lootSpots do
        if #(vector3(lootSpots[i].x, lootSpots[i].y,lootSpots[i].z) - GetEntityCoords(PlayerPedId())) <= 1.5 then
            return true
        end
    end
    return false
end

function GetNearestStation()
    for i=1, #powerStations do
        if #(vector3(powerStations[i].x, powerStations[i].y,powerStations[i].z) - GetEntityCoords(PlayerPedId())) <= 2.0 then
            return i
        end
    end
    return 0
end

function GetNearestLootSpot()
    for i=1, #lootSpots do
        if #(vector3(lootSpots[i].x, lootSpots[i].y,lootSpots[i].z) - GetEntityCoords(PlayerPedId())) <= 2.0 then
            return i, lootSpots[i].location
        end
    end
    return 0
end