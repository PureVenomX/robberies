Citizen.CreateThread(function()    
    TriggerServerEvent("robbery:get:config")
    ResetBankDoors()
end)

RegisterNetEvent("robbery:get:config", function(pConfig)
    Config = pConfig
end)

-- Code
local closestBank = nil
local inRange
local laptop = 0

Citizen.CreateThread(function()
    Citizen.Wait(1)
    while true do
        local ped = PlayerPedId()
        local pos = GetEntityCoords(ped)
        local dist
            inRange = false
            for k, v in pairs(Config.SmallBanks) do
                dist = GetDistanceBetweenCoords(pos, Config.SmallBanks[k]["coords"]["x"], Config.SmallBanks[k]["coords"]["y"], Config.SmallBanks[k]["coords"]["z"])
                if dist < 15 then
                    closestBank = k
                    inRange = true
                end
            end
            if not inRange then
                Citizen.Wait(1000)
                closestBank = nil
            end
        Citizen.Wait(3)
    end
end)

Citizen.CreateThread(function()
    Citizen.Wait(1)
    while true do
        local ped = PlayerPedId()
        local pos = GetEntityCoords(ped)
        if closestBank ~= nil then
            if not Config.SmallBanks[closestBank]["isOpened"] then
                local dist = GetDistanceBetweenCoords(pos, Config.SmallBanks[closestBank].coords.x, Config.SmallBanks[closestBank].coords.y, Config.SmallBanks[closestBank].coords.z)
            end
            if Config.SmallBanks[closestBank]["isOpened"] then
                for k, v in pairs(Config.SmallBanks[closestBank]["lockers"]) do
                    local dist = GetDistanceBetweenCoords(pos, Config.SmallBanks[closestBank]["lockers"][k].x, Config.SmallBanks[closestBank]["lockers"][k].y, Config.SmallBanks[closestBank]["lockers"][k].z)
                    if not Config.SmallBanks[closestBank]["lockers"][k]["isBusy"] then
                        if not Config.SmallBanks[closestBank]["lockers"][k]["isOpened"] then
                            if dist < 5 then

                                DrawMarker(27,Config.SmallBanks[closestBank]["lockers"][k].x, Config.SmallBanks[closestBank]["lockers"][k].y, Config.SmallBanks[closestBank]["lockers"][k].z-0.9, 0, 0, 0, 0, 0, 0, 0.60, 0.60, 0.3, 255,0,0, 60, 0, 0, 2, 0, 0, 0, 0)

                                if dist < 0.5 then
                                    DrawText3Ds(Config.SmallBanks[closestBank]["lockers"][k].x, Config.SmallBanks[closestBank]["lockers"][k].y, Config.SmallBanks[closestBank]["lockers"][k].z, '[E] - Lockpick')									
                                    if IsControlJustPressed(0, Keys["E"]) then
                                        OpenLocker(closestBank, k)
                                    end   
                                end
                            end
                        end
                    end
                end
            end
        else
            Citizen.Wait(2500)
        end
        Citizen.Wait(1)
    end
end)

function DrawText3Ds(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 370
    DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 41, 11, 41, 68)
end

RegisterNetEvent("isRobberyActive:fleeca")
AddEventHandler("isRobberyActive:fleeca", function(pBusy)
    isBusy = pBusy
end)

RegisterNetEvent('ARP-robbery:red')
AddEventHandler('ARP-robbery:red', function()
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
	local police = exports["police"]:CountPolice()
    if closestBank ~= nil then
        TriggerServerEvent("isRobberyActive")
        Citizen.Wait(500)
        if not isBusy then
            if closestBank ~= nil then
                local dist = GetDistanceBetweenCoords(pos, Config.SmallBanks[closestBank].coords.x, Config.SmallBanks[closestBank].coords.y, Config.SmallBanks[closestBank].coords.z)
                if dist < 1.5 then				
                    if not Config.SmallBanks[closestBank]["isOpened"] then 
                        if exports['ARP-inventory']:hasEnoughOfItem('redlaptop', 1) and exports['ARP-inventory']:hasEnoughOfItem('ethernet', 1) then
                            if police >= 3 then
                                TriggerEvent("ARP-dispatch:fleecarobbery")
                                StartHeistFleecaPanel()
                                local card = exports["ARP-taskbar"]:taskBar(9000,"Hooking up equipment")
                                if card == 100 then
                                    exports['ARP-hacking']:OpenHackingGame(function(Success)
                                        if Success then
                                            FreezeEntityPosition(ped, false)
                                            TriggerEvent('DoLongHudText', "Hack successful", 1)
                                            TriggerEvent('fleeca:success:panel')
                                        else
                                            FreezeEntityPosition(ped, false)
                                            TriggerEvent('fleeca:fail:panel')
                                        end
                                    end)
                                end  
                            else
                                TriggerEvent("DoLongHudText", "Not enough cops online.", 2)
                            end
                        else
                            TriggerEvent("DoLongHudText", "You're missing stuff...", 2)
                        end	
                    else
                        TriggerEvent('DoLongHudText', "The bank is already open.", 2)
                    end
              
                end
            end
        else
            TriggerEvent('DoLongHudText', "The security lock is active, opening the door is currently not possible.", 2)
        end
    end
end)

RegisterNetEvent('ARP-robbery:client:setBankState')
AddEventHandler('ARP-robbery:client:setBankState', function(bankId, state)
    if bankId == "pacific" then
        Config.BigBanks["pacific"]["isOpened"] = state
        if state then
            OpenPacificDoor()
        end
    else
        Config.SmallBanks[bankId]["isOpened"] = state
        if state then
            OpenBankDoor(bankId)
        end
    end
end)

RegisterNetEvent('ARP-robbery:client:enableAllBankSecurity')
AddEventHandler('ARP-robbery:client:enableAllBankSecurity', function()
    for k, v in pairs(Config.SmallBanks) do
        Config.SmallBanks[k]["alarm"] = true
    end
end)

RegisterNetEvent('ARP-robbery:client:disableAllBankSecurity')
AddEventHandler('ARP-robbery:client:disableAllBankSecurity', function()
    for k, v in pairs(Config.SmallBanks) do
        Config.SmallBanks[k]["alarm"] = false
    end
end)

RegisterNetEvent('ARP-robbery:client:BankSecurity')
AddEventHandler('ARP-robbery:client:BankSecurity', function(key, status)
    Config.SmallBanks[key]["alarm"] = status
end)

function StartHeistFleecaPanel()
    local ply = PlayerPedId()
    local plyCoords = GetEntityCoords(ply)
    ClearPedTasksImmediately(ply)
    loadDicts()

    --[[ TaskGoStraightToCoord(ply, Config.SmallBanks[closestBank].coords.x, Config.SmallBanks[closestBank].coords.y, Config.SmallBanks[closestBank].coords.z-0.9, 2.0, -1, 0.0)
    Wait(0)
    while GetIsTaskActive(ply, 35) do
        Wait(0)
    end
    ClearPedTasksImmediately(ply)
    Wait(0)
    ]]
    SetEntityHeading(ply, Config.SmallBanks[closestBank].player_heading)

    TaskPlayAnimAdvanced(ply, "anim@heists@ornate_bank@hack", "hack_enter", Config.SmallBanks[closestBank].coords.x, Config.SmallBanks[closestBank].coords.y, Config.SmallBanks[closestBank].coords.z -0.9, 0, 0, 0, 1.0, 0.0, 8300, 0, 0.3, false, false, false)

    SetEntityHeading(ply, Config.SmallBanks[closestBank].player_heading)
    while IsEntityPlayingAnim(ply, "anim@heists@ornate_bank@hack", "hack_enter", 3) do
        Wait(100)
    end

    SetEntityRotation(laptop, GetEntityRotation(ply, 2), 2, true)
    PlaceObjectOnGroundProperly(laptop)
    TaskPlayAnim(ply, "anim@heists@ornate_bank@hack", "hack_loop", 1.0, 0.0, -1, 1, 0, false, false, false)
end

function loadDicts()
    RequestAnimDict("anim@heists@ornate_bank@hack")
    RequestModel("hei_prop_hst_laptop")
    RequestModel("hei_p_m_bag_var22_arm_s")
    RequestModel("hei_prop_heist_card_hack_02")
    while not HasAnimDictLoaded("anim@heists@ornate_bank@hack")
        or not HasModelLoaded("hei_prop_hst_laptop")
        or not HasModelLoaded("hei_p_m_bag_var22_arm_s")
        or not HasModelLoaded("hei_prop_heist_card_hack_02") do
        Wait(0)
    end
end

function OpenBankDoor(bankId)
    local object = GetClosestObjectOfType(Config.SmallBanks[bankId]["coords"]["x"], Config.SmallBanks[bankId]["coords"]["y"], Config.SmallBanks[bankId]["coords"]["z"], 5.0, Config.SmallBanks[bankId]["object"], false, false, false)
    local timeOut = 10
    local entHeading = Config.SmallBanks[bankId]["heading"].closed
    if object ~= 0 then
        Citizen.CreateThread(function()
            while true do
                if entHeading ~= Config.SmallBanks[bankId]["heading"].open then
                    SetEntityHeading(object, entHeading - 10)
                    entHeading = entHeading - 0.5
                else
                    break
                end
                Citizen.Wait(10)
            end
        end)
    end
end

function ResetBankDoors()
    for k, v in pairs(Config.SmallBanks) do
        local object = GetClosestObjectOfType(Config.SmallBanks[k]["coords"]["x"], Config.SmallBanks[k]["coords"]["y"], Config.SmallBanks[k]["coords"]["z"], 5.0, Config.SmallBanks[k]["object"], false, false, false)
        if not Config.SmallBanks[k]["isOpened"] then
            SetEntityHeading(object, Config.SmallBanks[k]["heading"].closed)
        else
            SetEntityHeading(object, Config.SmallBanks[k]["heading"].open)
        end
    end
    if not Config.BigBanks["pacific"]["isOpened"] then
        local pacificObject = GetClosestObjectOfType(Config.BigBanks["pacific"]["coords"][4]["x"], Config.BigBanks["pacific"]["coords"][4]["y"], Config.BigBanks["pacific"]["coords"][4]["z"], 20.0, Config.BigBanks["pacific"]["object"], false, false, false)
        SetEntityHeading(pacificObject, Config.BigBanks["pacific"]["heading"].closed)
        TriggerServerEvent("ARP-doors:changeLock-status", 188, true)
        TriggerServerEvent("ARP-doors:changeLock-status", 189, true)
        TriggerServerEvent("ARP-doors:changeLock-status", 190, true)
        TriggerServerEvent("ARP-doors:changeLock-status", 191, true)
        TriggerServerEvent("ARP-doors:changeLock-status", 192, true)
    else
        local pacificObject = GetClosestObjectOfType(Config.BigBanks["pacific"]["coords"][4]["x"], Config.BigBanks["pacific"]["coords"][4]["y"], Config.BigBanks["pacific"]["coords"][4]["z"], 20.0, Config.BigBanks["pacific"]["object"], false, false, false)
        SetEntityHeading(pacificObject, Config.BigBanks["pacific"]["heading"].open)
    end
end

RegisterNetEvent('ARP-robbery:client:setLockerState')
AddEventHandler('ARP-robbery:client:setLockerState', function(bankId, lockerId, state, bool)
    if bankId == "pacific" then	
        Config.BigBanks["pacific"]["lockers"][lockerId][state] = bool
    else
        Config.SmallBanks[bankId]["lockers"][lockerId][state] = bool
    end
end)

RegisterNetEvent('ARP-robbery:client:ResetFleecaLockers')
AddEventHandler('ARP-robbery:client:ResetFleecaLockers', function(BankId)
    Config.SmallBanks[BankId]["isOpened"] = false
    for k,_ in pairs(Config.SmallBanks[BankId]["lockers"]) do
        Config.SmallBanks[BankId]["lockers"][k]["isOpened"] = false
        Config.SmallBanks[BankId]["lockers"][k]["isBusy"] = false
    end
end)

local lockpicking = false
RegisterNetEvent('animation:repair')
AddEventHandler('animation:repair', function()
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

AddEventHandler('onResourceStop', function(resource)
    if resource == GetCurrentResourceName() then
        ResetBankDoors()
    end
end)

function loadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Citizen.Wait(5)
    end
end 

function OpenLocker(bankId, lockerId)
    local pos = GetEntityCoords(PlayerPedId())
    TriggerServerEvent('ARP-robbery:server:setLockerState', bankId, lockerId, 'isBusy', true)
    if bankId == "pacific" then
        if exports['ARP-inventory']:hasEnoughOfItem('thermite', 1) then
            local pos = GetEntityCoords(PlayerPedId(), true)
            if exports["ARP-thermite"]:startGame(15,2,10,500) then
                TriggerEvent("attachItem","minigameThermite")
                RequestAnimDict("weapon@w_sp_jerrycan")
                while ( not HasAnimDictLoaded( "weapon@w_sp_jerrycan" ) ) do
                    Wait(10)
                end
                FreezeEntityPosition(PlayerPedId(), true)
                Wait(100)
                TaskPlayAnim(PlayerPedId(),"weapon@w_sp_jerrycan","fire",2.0, -8, -1,49, 0, 0, 0, 0)
                Wait(5000)
                TaskPlayAnim(PlayerPedId(),"weapon@w_sp_jerrycan","fire",2.0, -8, -1,49, 0, 0, 0, 0)
                TriggerEvent("destroyProp")
                FreezeEntityPosition(PlayerPedId(), false)
                ClearPedTasks(PlayerPedId())
                TriggerServerEvent('ARP-robbery:server:setLockerState', bankId, lockerId, 'isOpened', true)
                TriggerServerEvent('ARP-robbery:server:setLockerState', bankId, lockerId, 'isBusy', false)
                TriggerServerEvent("Pacific:success:hacking")
            else
                local plyCoords = GetEntityCoords(PlayerPedId())
                TriggerEvent('DoLongHudText', "You notice fire, RUN!", 2)
                Wait(2000)
                if math.random(1,100) > 85 then
                    exports["ARP-thermite"]:startFireAtLocation(plyCoords["x"],plyCoords["y"],plyCoords["z"]-0.3,10000)   
                end
                TriggerEvent('inventory:removeItem',"thermite", 1)
                TriggerEvent("Evidence:StateSet",16,2200)
            end
        else
            TriggerEvent('DoLongHudText', "You dont have any thermite!", 2)
            TriggerServerEvent('ARP-robbery:server:setLockerState', bankId, lockerId, 'isBusy', false)
        end
    else
        if exports['ARP-inventory']:hasEnoughOfItem('safecrackingkit', 1) then
            local finished = exports["ARP-lockpicking"]:lockpick(100,5,2,10)
            if finished == 100 then
                FreezeEntityPosition(PlayerPedId(), true)
                lockpicking = true
                TriggerEvent("animation:repair")
                FreezeEntityPosition(PlayerPedId(), false)
                local finished = exports["ARP-taskbar"]:taskBar(1000,"Opening")
                if finished == 100 then
                    lockpicking = false
                    TriggerEvent("fleeca:success")
                    FreezeEntityPosition(PlayerPedId(), false)
                    TriggerServerEvent('ARP-robbery:server:setLockerState', bankId, lockerId, 'isOpened', true)
                    TriggerServerEvent('ARP-robbery:server:setLockerState', bankId, lockerId, 'isBusy', false)
                    TriggerServerEvent("Fleeca:success:lockpick")
                else
                    lockpicking = false
                    FreezeEntityPosition(PlayerPedId(), false)
                    TriggerServerEvent('ARP-robbery:server:setLockerState', bankId, lockerId, 'isOpened', false)
                    TriggerServerEvent('ARP-robbery:server:setLockerState', bankId, lockerId, 'isBusy', false)
                end
            else
                TriggerEvent("fleeca:fail")
                TriggerEvent("DoLongHudText", "You failed to breach into the vault box", 2)
                local pSecondChance = math.random(1, 10)
                if pSecondChance >= 5 then
                    TriggerEvent("DoLongHudText", "You got another shot!")
                    TriggerServerEvent('ARP-robbery:server:setLockerState', bankId, lockerId, 'isOpened', false)
                    TriggerServerEvent('ARP-robbery:server:setLockerState', bankId, lockerId, 'isBusy', false)
                end
            end
        else
            TriggerEvent('DoLongHudText', "You need a lockpick for this!", 2)
			TriggerServerEvent('ARP-robbery:server:setLockerState', bankId, lockerId, 'isBusy', false)
		end
    end
end

RegisterNetEvent("fleeca:success:panel", function()
    ClearPedTasksImmediately(PlayerPedId())

    FreezeEntityPosition(PlayerPedId(), false)
    TriggerEvent('DoLongHudText', "Hack successful, should take a few minutes for the door to open", 1)
    Citizen.Wait(60000)
    TriggerEvent('ARP-dispatch:fleecarobbery')
    TriggerServerEvent('ARP-robbery:server:setBankState', closestBank, true)
    DeleteObject(laptop)
end)

RegisterNetEvent("fleeca:fail", function()
    FreezeEntityPosition(PlayerPedId(), false)
    TriggerEvent("DoLongHudText", "Failed", 2)
    TriggerEvent("inventory:removeItem", "safecrackingkit", 1)
end)

RegisterNetEvent("fleeca:fail:panel", function()
    FreezeEntityPosition(PlayerPedId(), false)
    TriggerEvent("inventory:removeItem", "redlaptop", 1)
    TriggerEvent('DoLongHudText', "Failed", 2)
    DeleteObject(laptop)
end)