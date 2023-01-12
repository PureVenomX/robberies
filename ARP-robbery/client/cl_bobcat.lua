local DoorLocations = {
    ["FRONT_DOOR"] = { x = 915.07647705078, y = -2121.8354492188, z = 31.23097038269},
    ["INSIDE_DOOR"] = { x = 908.95642089844, y = -2120.5373535156, z = 31.230325698853},
    ["DOUBLE_DOOR_INSIDE"] = { x = 905.23059082031, y = -2121.0258789063, z = 31.230323791504},
}

local ped_can_open_vault = false
local can_loot = false
local can_third_door = false
local door_ped = 0

function loadAnimDict(dict) 
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Citizen.Wait(5)
    end
end

function GetDoorVector3(location)
    if DoorLocations[location] ~= nil then
        return vector3(DoorLocations[location]["x"], DoorLocations[location]["y"], DoorLocations[location]["z"])
    else
        print('Bobcat: GetDoorVector3 failed for '..location)
        return false
    end
end

function GetDoorLocation(location)
    if DoorLocations[location] ~= nil then
        return DoorLocations[location]
    else
        print('Bobcat: GetDoorLocation failed for '..location)
        return false
    end
end

function IsNearBobcatDoor(location)
    if DoorLocations[location] ~= nil then
        return #(GetEntityCoords(PlayerPedId()) - GetDoorVector3(location)) <= 3
    end
end

function ResetDoor()
    CreateModelSwap(888.12, -2129.87, 29.23, 7.5, GetHashKey("des_vaultdoor001_end"),
    GetHashKey("des_vaultdoor001_start"), 1)
end

RegisterNetEvent('ARP-bobcat:reset')
AddEventHandler('ARP-bobcat:reset', function()
	ResetDoor()
end)

function BlowDoor()
    CreateModelSwap(888.12, -2129.87, 29.23, 7.5, GetHashKey("des_vaultdoor001_start"),
    GetHashKey("des_vaultdoor001_end"), 1)
end

RegisterNetEvent('ARP-bobcat:bombabumbe')
AddEventHandler('ARP-bobcat:bombabumbe', function()
	BlowDoor()
end)


function BobcatFrontDoorsHack()
    RequestAnimDict("anim@heists@ornate_bank@thermal_charge")
    RequestModel("hei_p_m_bag_var22_arm_s")
    RequestNamedPtfxAsset("scr_ornate_heist")
    while not HasAnimDictLoaded("anim@heists@ornate_bank@thermal_charge") and not HasModelLoaded("hei_p_m_bag_var22_arm_s") and not HasNamedPtfxAssetLoaded("scr_ornate_heist") do
        Citizen.Wait(50)
    end
    local ped = PlayerPedId()

    SetEntityHeading(ped, 170.52)
    Citizen.Wait(100)
    local rotx, roty, rotz = table.unpack(vec3(GetEntityRotation(PlayerPedId())))
    local bagscene = NetworkCreateSynchronisedScene(915.14666748047, -2121.8432617188, 31.23099899292, rotx, roty, rotz + 1.1, 2, false, false, 1065353216, 0, 1.3)
    local bag = CreateObject(GetHashKey("hei_p_m_bag_var22_arm_s"), 915.14666748047, -2121.8432617188, 31.23099899292,  true,  true, false)

    SetEntityCollision(bag, false, true)
    NetworkAddPedToSynchronisedScene(ped, bagscene, "anim@heists@ornate_bank@thermal_charge", "thermal_charge", 1.2, -4.0, 1, 16, 1148846080, 0)
    NetworkAddEntityToSynchronisedScene(bag, bagscene, "anim@heists@ornate_bank@thermal_charge", "bag_thermal_charge", 4.0, -8.0, 1)
    SetPedComponentVariation(ped, 5, 0, 0, 0)
    NetworkStartSynchronisedScene(bagscene)
    Citizen.Wait(1500)
    local x, y, z = table.unpack(GetEntityCoords(ped))
    local bomba = CreateObject(GetHashKey("hei_prop_heist_thermite"), x, y, z + 0.3,  true,  true, true)

    SetEntityCollision(bomba, false, true)
    AttachEntityToEntity(bomba, ped, GetPedBoneIndex(ped, 28422), 0, 0, 0, 0, 0, 200.0, true, true, false, true, 1, true)
    Citizen.Wait(2000)
    DeleteObject(bag)
    SetPedComponentVariation(ped, 5, 45, 0, 0)
    DetachEntity(bomba, 1, 1)
    FreezeEntityPosition(bomba, true)
    TriggerServerEvent("ARP-bobcat:effectoutsideserver", method)
    SetPtfxAssetNextCall("scr_ornate_heist")
    local effect = StartParticleFxLoopedAtCoord("scr_heist_ornate_thermal_burn", ptfx, 0.0, 0.0, 0.0, 1.0, false, false, false, false)

    NetworkStopSynchronisedScene(bagscene)
    TaskPlayAnim(ped, "anim@heists@ornate_bank@thermal_charge", "cover_eyes_intro", 8.0, 8.0, 1000, 36, 1, 0, 0, 0)
    TaskPlayAnim(ped, "anim@heists@ornate_bank@thermal_charge", "cover_eyes_loop", 8.0, 8.0, 3000, 49, 1, 0, 0, 0)
    Citizen.Wait(5000)
    ClearPedTasks(ped)
    DeleteObject(bomba)
    StopParticleFxLooped(effect, 0)
    -- TriggerEvent("bobcat:check:hit")
end

function BobcatInsideDoorAnimation() 
    RequestAnimDict("anim@heists@ornate_bank@thermal_charge")
    RequestModel("hei_p_m_bag_var22_arm_s")
    RequestNamedPtfxAsset("scr_ornate_heist")
    while not HasAnimDictLoaded("anim@heists@ornate_bank@thermal_charge") and not HasModelLoaded("hei_p_m_bag_var22_arm_s") and not HasNamedPtfxAssetLoaded("scr_ornate_heist") do
        Citizen.Wait(50)
    end
    local ped = PlayerPedId()

    SetEntityHeading(ped, 170.52)
    Citizen.Wait(100)
    local rotx, roty, rotz = table.unpack(vec3(GetEntityRotation(PlayerPedId())))
    local bagscene = NetworkCreateSynchronisedScene(908.5, -2120.63, 31.23, rotx, roty, rotz + 1.1, 2, false, false, 1065353216, 0, 1.3)
    local bag = CreateObject(GetHashKey("hei_p_m_bag_var22_arm_s"), 908.5, -2120.63, 31.23,  true,  true, false)

    SetEntityCollision(bag, false, true)
    NetworkAddPedToSynchronisedScene(ped, bagscene, "anim@heists@ornate_bank@thermal_charge", "thermal_charge", 1.2, -4.0, 1, 16, 1148846080, 0)
    NetworkAddEntityToSynchronisedScene(bag, bagscene, "anim@heists@ornate_bank@thermal_charge", "bag_thermal_charge", 4.0, -8.0, 1)
    SetPedComponentVariation(ped, 5, 0, 0, 0)
    NetworkStartSynchronisedScene(bagscene)
    Citizen.Wait(1500)
    local x, y, z = table.unpack(GetEntityCoords(ped))
    local bomba = CreateObject(GetHashKey("hei_prop_heist_thermite"), x, y, z + 0.4,  true,  true, true)

    SetEntityCollision(bomba, false, true)
    AttachEntityToEntity(bomba, ped, GetPedBoneIndex(ped, 28422), 0, 0, 0, 0, 0, 200.0, true, true, false, true, 1, true)
    Citizen.Wait(2000)
    DeleteObject(bag)
    SetPedComponentVariation(ped, 5, 45, 0, 0)
    DetachEntity(bomba, 1, 1)
    FreezeEntityPosition(bomba, true)
    TriggerServerEvent("ARP-bobcat:effectinsideserver", method)
    SetPtfxAssetNextCall("scr_ornate_heist")
    local effect = StartParticleFxLoopedAtCoord("scr_heist_ornate_thermal_burn", ptfx, 0.0, 0.0, 0.0, 1.0, false, false, false, false)

    NetworkStopSynchronisedScene(bagscene)
    TaskPlayAnim(ped, "anim@heists@ornate_bank@thermal_charge", "cover_eyes_intro", 8.0, 8.0, 1000, 36, 1, 0, 0, 0)
    TaskPlayAnim(ped, "anim@heists@ornate_bank@thermal_charge", "cover_eyes_loop", 8.0, 8.0, 3000, 49, 1, 0, 0, 0)
    Citizen.Wait(5000)
    ClearPedTasks(ped)
    DeleteObject(bomba)
    StopParticleFxLooped(effect, 0)
	-- TriggerEvent("bobcat:second:door:hit")
end

---- Front Door ----
function FrontDoorsResult(success, timeremaining)
    if success then
        TriggerEvent('mhacking:hide')
        TriggerEvent("animation:cancel")
        BobcatFrontDoorsHack()
        TriggerServerEvent("ARP-doors:changeLock-status", "bobcat_outside_one", false)
        TriggerServerEvent("ARP-doors:changeLock-status", "bobcat_outside_two", false)
        TriggerServerEvent("first:door:sv")
        TriggerEvent("inventory:removeItem", "thermitecharge", 1)
        FreezeEntityPosition(PlayerPedId(),false)
    else
        TriggerEvent('mhacking:hide')
        TriggerEvent("animation:cancel")
        TriggerEvent('DoLongHudText', "This thermite is shot!", 2)
        TriggerEvent("inventory:removeItem", "thermitecharge", 1)
        FreezeEntityPosition(PlayerPedId(),false)
    end
end

RegisterNetEvent("bobcat:check:hit",function()
    TriggerServerEvent("first:door:triggered")
end)

RegisterNetEvent("bobcat:first:door")
AddEventHandler("bobcat:first:door", function()
    if exports["police"]:CountPolice() >= 6 then
        if exports["ARP-inventory"]:hasEnoughOfItem("bobcat-employee-card", 1) then 
            if exports['ARP-inventory']:hasEnoughOfItem("thermitecharge", 1) then
                FreezeEntityPosition(PlayerPedId(),true)
                TriggerEvent("mhacking:show")
                TriggerEvent("mhacking:start",3,20, FrontDoorsResult) -- TODO Reduce to 12
                TriggerServerEvent("bobcat:log1")
            else
                TriggerEvent("DoLongHudText", "Your missing something!", 2) 
            end
        end
    else
        TriggerEvent("DoLongHudText", "Not enough officers to do this!", 2)    
    end
end)
---- End Front Door ----

------ Inside Door ------
function InsideDoorResult(success, timeremaining)
    if success then
        TriggerEvent('mhacking:hide')
        TriggerEvent("animation:cancel")
        BobcatInsideDoorAnimation()
        TriggerServerEvent("ARP-doors:changeLock-status", "bobcat_inside_single", false)
        TriggerEvent('ARP-dispatch:bobcatheist')
        TriggerEvent("inventory:removeItem", "thermitecharge", 1)
        TriggerServerEvent("second:door:sv")
        FreezeEntityPosition(PlayerPedId(),false)
    else
        TriggerEvent('mhacking:hide')
        TriggerEvent("animation:cancel")
        TriggerEvent('DoLongHudText', "This thermite is shot!", 2)
        TriggerEvent("inventory:removeItem", "thermitecharge", 1)
        FreezeEntityPosition(PlayerPedId(),false)
    end
end

RegisterNetEvent("bobcat:second:door:hit",function()
    TriggerServerEvent("second:door:triggered")
end)

RegisterNetEvent("bobcat:inside:door")
AddEventHandler("bobcat:inside:door", function()
    if exports["police"]:CountPolice() >= 6 then
        if exports["ARP-inventory"]:hasEnoughOfItem("bobcat-employee-card", 1) then 
            if exports['ARP-inventory']:hasEnoughOfItem("thermitecharge", 1) then
                FreezeEntityPosition(PlayerPedId(),true)
                TriggerEvent("mhacking:show")
                TriggerEvent("mhacking:start",3,20, InsideDoorResult) -- TODO Reduce to 12
            else
                TriggerEvent("DoLongHudText", "Your missing something!", 2) 
            end
        end
    else
        TriggerEvent("DoLongHudText", "Not enough officers to do this!", 2)    
    end
end)
------ End Inside Door ------

-------Third-door ------
RegisterNetEvent("bobcat:third:door")
AddEventHandler("bobcat:third:door", function()
    if exports["police"]:CountPolice() >= 6 then
        if exports["ARP-inventory"]:hasEnoughOfItem("bobcat-employee-card",1) then
            local dict = 'mp_prison_break'
                loadAnimDict(dict)
                TaskPlayAnim(PlayerPedId(), dict, "hack_loop", 3.0, -8, -1, 63, 0, 0, 0, 0 )
                local bobcat = exports["ARP-taskbar"]:taskBar(3000,"Accessing Personal Systems")
                if bobcat == 100 then
                TriggerEvent("utk_fingerprint:Start", 3, 6, 1.5, function(outcome, reason)
                    if outcome == true then

                        TriggerServerEvent("ARP-doors:changeLock-status", "bobcat_inside_big_one", false)
                        TriggerServerEvent("ARP-doors:changeLock-status", "bobcat_inside_big_two", false)
                        TriggerEvent("inventory:removeItem", "bobcat-employee-card", 1)
                        TriggerEvent("DoLongHudText", "We are in!", 3)
                        TriggerEvent('ARP-dispatch:bobcatheist')
                        TriggerServerEvent("third:door:sv")
                        ped_can_open_vault = true
                        FreezeEntityPosition(PlayerPedId(),false)
                    elseif outcome == false then
                        TriggerEvent("inventory:removeItem", "bobcat-employee-card", 1)
                        TriggerEvent("DoLongHudText", "Access denied!", 2)
                        TriggerEvent('ARP-dispatch:bobcatheist')
                        FreezeEntityPosition(PlayerPedId(),false)
                    end
                end)
            end
        else
            TriggerEvent("DoLongHudText", "Your missing something!", 2) 
        end
    else
        TriggerEvent("DoLongHudText", "Not enough officers to do this!", 2)    
    end
end)

RegisterNetEvent("bobcat:fail:panel", function()
    TriggerEvent('DoLongHudText', "Failed!", 2)
end)

RegisterNetEvent("bobcat2:success:panel", function()
    TriggerEvent('DoLongHudText', "Success!", 3)
    TriggerServerEvent("ARP-doors:changeLock-status", "bobcat_inside_one", false)
end)

RegisterNetEvent("ARP-bobcat:effectoutside")
AddEventHandler("ARP-bobcat:effectoutside", function(method)
    local ptfx

    RequestNamedPtfxAsset("scr_ornate_heist")
    while not HasNamedPtfxAssetLoaded("scr_ornate_heist") do
        Citizen.Wait(1)
    end
        ptfx = vector3(880.49, -2263.60, 32.441)
    SetPtfxAssetNextCall("scr_ornate_heist")
    local effect = StartParticleFxLoopedAtCoord("scr_heist_ornate_thermal_burn", ptfx, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
    Citizen.Wait(4000)
    print("Did It Work")
    StopParticleFxLooped(effect, 0)
end)

RegisterNetEvent("ARP-bobcat:effectinside")
AddEventHandler("ARP-bobcat:effectinside", function(method)
    local ptfx

    RequestNamedPtfxAsset("scr_ornate_heist")
    while not HasNamedPtfxAssetLoaded("scr_ornate_heist") do
        Citizen.Wait(1)
    end
        ptfx = vector3(880.49, -2263.60, 32.441)
    SetPtfxAssetNextCall("scr_ornate_heist")
    local effect = StartParticleFxLoopedAtCoord("scr_heist_ornate_thermal_burn", ptfx, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
    Citizen.Wait(4000)
    print("Did It Work")
    StopParticleFxLooped(effect, 0)
end)

RegisterNetEvent('ARP-bobcat:third:hack:unlock')
AddEventHandler('ARP-bobcat:third:hack:unlock', function(state)
    can_third_door = state
end)

RegisterNetEvent('ARP-bobcat:crates:unlock')
AddEventHandler('ARP-bobcat:crates:unlock', function(state)
    can_loot = state
end)

RegisterNetEvent('ARP-bobcat:bobcatcreateped')
AddEventHandler('ARP-bobcat:bobcatcreateped', function()
    local playerped = PlayerPedId()
    local hash = GetHashKey('s_m_m_marine_01')
 	RequestModel(hash)
    while not HasModelLoaded(hash) do
        Citizen.Wait(0)
    end
    AddRelationshipGroup("Guards")
    bobcatped1 = CreatePed(30, hash, 896.17297363281, -2125.5402832031, 31.230323791504, 322.95431518555, true, false)
	SetPedArmour(bobcatped1, 500)
	SetPedAsEnemy(bobcatped1, true)
	SetPedRelationshipGroupHash(bobcatped1, "Guards")
	GiveWeaponToPed(bobcatped1, GetHashKey('WEAPON_CARBINERIFLE'), math.random(20, 100), false, false)
	TaskCombatPed(bobcatped1, GetPlayerPed(-1), 0, 16)
	SetPedAccuracy(bobcatped1, 100)
	SetPedDropsWeaponsWhenDead(bobcatped1, false)
		
	bobcatped2 = CreatePed(30, hash, 898.45703125, -2131.4345703125, 31.230323791504, 0.85816478729248, true, false)
	SetPedArmour(bobcatped2, 500)
	SetPedAsEnemy(bobcatped2, true)
	SetPedRelationshipGroupHash(bobcatped2, "Guards")
	GiveWeaponToPed(bobcatped2, GetHashKey('WEAPON_CARBINERIFLE'), math.random(20, 100), false, false)
	TaskCombatPed(bobcatped2, GetPlayerPed(-1), 0, 16)
	SetPedAccuracy(bobcatped2, 100)
	SetPedDropsWeaponsWhenDead(bobcatped2, false)

	bobcatped3 = CreatePed(30, hash, 895.53363037109, -2135.2546386719, 31.230323791504, 343.345703125, true, false)
	SetPedArmour(bobcatped3, 500)
	SetPedAsEnemy(bobcatped3, true)
	SetPedRelationshipGroupHash(bobcatped3, "Guards")
	GiveWeaponToPed(bobcatped3, GetHashKey('WEAPON_CARBINERIFLE'), math.random(20, 100), false, false)
	TaskCombatPed(bobcatped3, GetPlayerPed(-1), 0, 16)
	SetPedAccuracy(bobcatped3, 100)
	SetPedDropsWeaponsWhenDead(bobcatped3, false)

	bobcatped4 = CreatePed(30, hash, 890.36505126953, -2136.1862792969, 31.230323791504, 317.05654907227, true, false)
	SetPedArmour(bobcatped4, 500)
	SetPedAsEnemy(bobcatped4, true)
	SetPedRelationshipGroupHash(bobcatped4, "Guards")
	GiveWeaponToPed(bobcatped4, GetHashKey('WEAPON_CARBINERIFLE'), math.random(20, 100), false, false)
	TaskCombatPed(bobcatped4, GetPlayerPed(-1), 0, 16)
	SetPedAccuracy(bobcatped4, 100)
	SetPedDropsWeaponsWhenDead(bobcatped4, false)

	bobcatped5 = CreatePed(30, hash, 885.94232177734, -2130.8876953125, 31.230312347412, 257.259765625, true, false)
	SetPedArmour(bobcatped5, 500)
	SetPedAsEnemy(bobcatped5, true)
	SetPedRelationshipGroupHash(bobcatped5, "Guards")
	GiveWeaponToPed(bobcatped5, GetHashKey('WEAPON_CARBINERIFLE'), math.random(20, 100), false, false)
	TaskCombatPed(bobcatped5, GetPlayerPed(-1), 0, 16)
	SetPedAccuracy(bobcatped5, 100)
	SetPedDropsWeaponsWhenDead(bobcatped5, false)

	bobcatped6 = CreatePed(30, hash, 879.79364013672, -2134.1467285156, 31.230312347412, 272.99249267578, true, false)
	SetPedArmour(bobcatped6, 500)
	SetPedAsEnemy(bobcatped6, true)
	SetPedRelationshipGroupHash(bobcatped6, "Guards")
	GiveWeaponToPed(bobcatped6, GetHashKey('WEAPON_CARBINERIFLE'), math.random(20, 100), false, false)
	TaskCombatPed(bobcatped6, GetPlayerPed(-1), 0, 16)
	SetPedAccuracy(bobcatped6, 100)
	SetPedDropsWeaponsWhenDead(bobcatped6, false)

	bobcatped7 = CreatePed(30, hash, 879.31072998047, -2122.2915039063, 31.230318069458, 186.3370513916, true, false)
	SetPedArmour(bobcatped7, 500)
	SetPedAsEnemy(bobcatped7, true)
	SetPedRelationshipGroupHash(bobcatped7, "Guards")
	GiveWeaponToPed(bobcatped7, GetHashKey('WEAPON_CARBINERIFLE'), math.random(20, 100), false, false)
	TaskCombatPed(bobcatped7, GetPlayerPed(-1), 0, 16)
	SetPedAccuracy(bobcatped7, 100)
	SetPedDropsWeaponsWhenDead(bobcatped7, false)

	bobcatped8 = CreatePed(30, hash, 877.67651367188, -2111.8645019531, 31.230327606201, 184.19636535645, true, false)
	SetPedArmour(bobcatped8, 500)
	SetPedAsEnemy(bobcatped8, true)
	SetPedRelationshipGroupHash(bobcatped8, "Guards")
	GiveWeaponToPed(bobcatped8, GetHashKey('WEAPON_CARBINERIFLE'), math.random(20, 100), false, false)
	TaskCombatPed(bobcatped8, GetPlayerPed(-1), 0, 16)
	SetPedAccuracy(bobcatped8, 100)
	SetPedDropsWeaponsWhenDead(bobcatped8, false)
end)


-- Hostage Ped
Citizen.CreateThread(function()
    local hash = GetHashKey("mp_s_m_armoured_01")
    while not HasModelLoaded(hash) do
        RequestModel(hash)
        Wait(20)
    end
    door_ped = CreatePed("PED_TYPE_CIVFEMALE", "mp_s_m_armoured_01", 885.48352050781, -2108.2854003906, 30.230325698853, 125.14464569092, false, false)
    local dict = 'random@arrests@busted'
    loadAnimDict(dict)
    SetBlockingOfNonTemporaryEvents(door_ped, true)
    SetPedDiesWhenInjured(door_ped, false)
    SetPedCanPlayAmbientAnims(door_ped, true)
    SetPedCanRagdollFromPlayerImpact(door_ped, false)
    SetEntityInvincible(door_ped, true)
    TaskPlayAnim(door_ped, dict, 'idle_a', 8.0, 8.0, -1, 33, 0, 0, 0, 0)
    FreezeEntityPosition(door_ped, true)
end)

RegisterNetEvent("ARP-bobcat:yup:requestblast")
AddEventHandler("ARP-bobcat:yup:requestblast", function()
    if ped_can_open_vault then
        TriggerServerEvent("ARP-bobcat:bobcat:securitygreenguy")
    else
        TriggerEvent("DoLongHudText", "Dont touch me!",2)
    end
end)

RegisterNetEvent('ARP-bobcat:requestblast')
AddEventHandler('ARP-bobcat:requestblast', function()
    FreezeEntityPosition(door_ped, false)
    SetEntityInvincible(door_ped, false) 

	ClearPedTasks(door_ped)
	TaskGoStraightToCoord(door_ped, 881.88128662109, -2111.7780761719, 31.230323791504, 150.0, -1, 178.5701751709, 0)
	Citizen.Wait(5000)
	TaskGoStraightToCoord(door_ped, 879.8359375, -2132.4226074219, 31.230325698853, 150.0, -1, 273.61831665039, 0)
	Citizen.Wait(13000)
    TriggerServerEvent("ARP-bobcat:bobcat:pedgoboom")
end)

RegisterNetEvent('ARP-bobcat:pedbomb')
AddEventHandler('ARP-bobcat:pedbomb', function()
	TaskGoStraightToCoord(door_ped, 889.0, -2130.6, 31.2300, 150.0, -1, 0.7961, 0)
    local dict = 'anim@heists@ornate_bank@thermal_charge'
    loadAnimDict(dict) 
	Citizen.Wait(7500)
    TaskPlayAnim(door_ped, dict, 'throw_h_fb_backward', 8.0, 8.0, -1, 33, 0, 0, 0, 0)
	Citizen.Wait(1000)
    AddExplosion(888.3440, -2130.4658, 31.2300, 31, 150000.0, true, false, 4.0)
    TriggerServerEvent("ARP-bobcat:bobcat:vaultdoor")
    TriggerEvent('ARP-dispatch:bobcatheist')
end)


-- [[ Spot Triggers ]]
RegisterNetEvent('ARP-bobcat:loot:attempt')
AddEventHandler('ARP-bobcat:loot:attempt', function()
    local pos = GetEntityCoords(PlayerPedId())
    TriggerServerEvent("bobcat:crate:check", pos)
end)

RegisterNetEvent('ARP-bobcat:loot:attempt:result')
AddEventHandler('ARP-bobcat:loot:attempt:result', function(crate, index)
    if not can_loot then
        TriggerEvent("DoLongHudText", "Howd you get in here!", 3) 
        return
    end

    if not crate.was_hit then
        TriggerEvent("animation:PlayAnimation","cokecut")
        TriggerServerEvent("bobcat:loot:box", index)
        Citizen.Wait(2000)
		TriggerEvent("animation:PlayAnimation","cancel")
        TriggerServerEvent("bobcat:log2")
    else
        TriggerEvent("DoLongHudText", "This is empty!", 2) 
    end
end)


RegisterNetEvent('bobcat:staff:door')
AddEventHandler('bobcat:staff:door', function()
    if exports["ARP-inventory"]:hasEnoughOfItem("bobcat-staff-key",1,false) then
        DoScreenFadeOut(1)
        Citizen.Wait(100)
        TriggerEvent("dooranim")
        TriggerEvent('InteractSound_CL:PlayOnOne', 'DoorOpen', 0.8)
        SetEntityCoords(PlayerPedId(), 904.9136, -2119.686, 31.38022)
        SetEntityHeading(PlayerPedId(), 174.99992370605)
        DoScreenFadeIn(1000)

        math.randomseed(GetGameTimer())
        local chance = math.random(1,50)
        if chance >= 40 then
            TriggerEvent("inventory:removeItem", "bobcat-staff-key", 1)
            TriggerEvent("DoLongHudText", "The keys broke!", 3) 
        end
    end
end)