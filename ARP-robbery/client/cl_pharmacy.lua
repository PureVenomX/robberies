RX_CABINETS = {
    [1] = {
        pos = vector4(373.84176635742, -831.24163818359, 29.291414260864, 87.255439758301), --Back wall 1
        was_hit = false,
        type = "rx"
    },
    [2] = {
        pos = vector4(373.84924316406, -829.83941650391, 29.291414260864, 90.320808410645), --Back wall 2
        was_hit = false,
        type = "stims"
    },
    [3] = {
        pos = vector4(373.77291870117, -828.75012207031, 29.291391372681, 88.886215209961), --Back wall 3
        was_hit = false,
        type = "rx"
    },
    [4] = {
        pos = vector4(378.31616210938, -825.43865966797, 29.291418075562, 5.7623329162598), --Side wall 1
        was_hit = false,
        type = "rand"
    },
    [5] = {
        pos = vector4(383.14114379883, -825.43841552734, 29.291397094727, 1.7271630764008), --Side wall 2
        was_hit = false,
        type = "rand"
    }
}

HAS_ROBBED = false

ROBBING = false

local FRONT_DOOR_ID = 385
local BACK_DOOR_ID = 386

RegisterNetEvent("pharmacy:complete")
AddEventHandler("pharmacy:complete", function()
    HAS_ROBBED = true
end)


RegisterNetEvent("pharmacy:robbed")
AddEventHandler("pharmacy:robbed", function(newSet)
    RX_CABINETS = newSet
end)


local function loadParticle()
    if not HasNamedPtfxAssetLoaded("scr_jewelheist") then
        RequestNamedPtfxAsset("scr_jewelheist")
    end
    while not HasNamedPtfxAssetLoaded("scr_jewelheist") do
        Citizen.Wait(0)
    end
    SetPtfxAssetNextCall("scr_jewelheist")
end

local function loadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Citizen.Wait(5)
    end
end

local function loadAnimation()
    loadAnimDict( "missheist_jewel" )
    TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 2.0, 'robberyglassbreak', 0.5)
    TaskPlayAnim( PlayerPedId(), "missheist_jewel", "smash_case", 8.0, 1.0, -1, 2, 0, 0, 0, 0 )
    Citizen.Wait(2200)
end

local function DrawText3Ds(index)
    local location = RX_CABINETS[index]
    local debug_text = "Press [~q~E~s~] to break the glass ["..tostring(index).."]"
    local text = "Press [~q~E~s~] to break the glass"
    local onScreen, _x, _y = World3dToScreen2d(location.pos.x, location.pos.y, location.pos.z)

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


local function GiveItems(loot_type)
    if IsPedArmed(PlayerPedId(), 4 | 1) then
        TriggerServerEvent("pharmacy:request:loot", loot_type)
    end
end

local function BreakCabinet(location_index)
    ClearPedTasks(PlayerPedId())
    local plyPos = GetEntityCoords(PlayerPedId())
    TriggerEvent('ARP-pharmacy:alert')
    TriggerServerEvent("pharmacy:hasrobbed", RX_CABINETS, location_index)
    local loot_type = RX_CABINETS[location_index].type
    GiveItems(loot_type)
    RX_CABINETS[location_index].was_hit = true
    Citizen.Wait(500)
end

local function AttemptPharmacyRob(location_index)
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    if not IsPedArmed(PlayerPedId(), 4 | 1) then
        TriggerEvent("customNotification","You failed to break the glass - more force would help.", 2)
        return
    end

    TriggerEvent("ARP-dispatch:pharmrobbery")
    local was_hit = RX_CABINETS[location_index].was_hit
    if not IsPedRunning(PlayerPedId()) and not IsPedSprinting(PlayerPedId()) and not was_hit then
        local coords = RX_CABINETS[location_index].pos
        local player = GetPlayerPed(-1)
        SetEntityHeading(player, RX_CABINETS[location_index].pos.w)
        Citizen.Wait(1000)
        loadParticle()
        StartParticleFxLoopedAtCoord("scr_jewel_cab_smash", coords.x,coords.y, coords.z, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
        loadAnimation()
        BreakCabinet(location_index)
        ROBBING = true
    end
end

local function ResetPharmacy()
    for k, v in pairs(RX_CABINETS) do
		v.was_hit = false
	end
    TriggerServerEvent("ARP-doors:changeLock-status", "pharm_front", false)
    TriggerServerEvent("ARP-doors:changeLock-status", "pharm_back", false)
    HAS_ROBBED = false
end

RegisterNetEvent("pharmacy:reset")
AddEventHandler("pharmacy:reset", function()
    ResetPharmacy()
end)

RegisterNetEvent("pharm:success:panel")
AddEventHandler("pharm:success:panel", function()
    TriggerServerEvent("ARP-doors:changeLock-status", "pharm_front", false)
    TriggerServerEvent("ARP-doors:changeLock-status", "pharm_back", false)
    TriggerEvent("customNotification","Doors are unlocking", 2)
end)

RegisterNetEvent("pharm:fail:panel")
AddEventHandler("pharm:fail:panel", function()
    TriggerEvent("customNotification","Failed to unlock the doors!", 2)
end)

RegisterNetEvent("pharmacy:AttemptToLeave")
AddEventHandler("pharmacy:AttemptToLeave", function()
    if exports['ARP-inventory']:hasEnoughOfItem('hacklaptop', 1) then
        TriggerEvent("animation:repair")
        FreezeEntityPosition(PlayerPedId(), false)
        TriggerEvent("animation:PlayAnimation","cokecut")
        local finished = exports["ARP-taskbar"]:taskBar(9000,"Hacking In")
        FreezeEntityPosition(PlayerPedId(),true)

        if exports["police"]:CountPolice() <= 3 then
            TriggerEvent("pharm:success:panel")
            TriggerEvent("customNotification","Doors are unlocking", 2)
            return
        end

        if finished == 100 then
            FreezeEntityPosition(PlayerPedId(),false)
            exports['ARP-hacking']:OpenHackingGame(function(Success)
                if Success then
                    FreezeEntityPosition(ped, false)
                    TriggerEvent('DoLongHudText', "Hack successful", 1)
                    TriggerEvent("pharm:success:panel")
                else
                    TriggerEvent("inventory:removeItem", "hacklaptop", 1)
                    TriggerEvent("pharm:fail:panel")
                end
            end)
        end
    else
        TriggerEvent("customNotification","System has been updated, might need something else", 2)
    end
end)

--[[ Main Thread ]]
Citizen.CreateThread(function()
    while true do
        if not HAS_ROBBED then
            if (#(GetEntityCoords(PlayerPedId()) - vector3(378.81716918945, -828.26574707031, 29.291410446167)) < 50.0 ) then
                for index, location in pairs(RX_CABINETS) do
                    if (#(GetEntityCoords(PlayerPedId()) - vector3(location.pos.x, location.pos.y, location.pos.z)) < 0.2 ) then
                        if (not location.was_hit)  then
                            DrawText3Ds(index)
                            if IsControlJustPressed(1,38)  then
                                if exports["police"]:CountPolice() >= 2 then
                                    if true then
                                        AttemptPharmacyRob(index)
                                    end
                                else
                                    TriggerEvent("customNotification","Not enough cops on duty!", 2)
                                end
                            end
                        end
                    end
                end
                Citizen.Wait(1)
            else
                Citizen.Wait(6000)
            end
        else
            Citizen.Wait(2000)
        end
    end
end)


RegisterNetEvent('pharmacy:shop:open')
	AddEventHandler('pharmacy:shop:open', function()
	TriggerEvent("server-inventory-open", "rx_store", "Shop")
end)
