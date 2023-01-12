local powerStationsPrison = {
    [1] = {['x'] = 651.767578125, ['y'] =101.28688049316, ['z'] =80.73804473877, ["disabled"] = false},
    [2] = {['x'] = 658.86407470703, ['y'] =114.73619842529, ['z'] =80.923042297363, ["disabled"] = false},
    [3] = {['x'] = 697.91485595703, ['y'] =158.25569152832, ['z'] =80.940383911133, ["disabled"] = false},
    [4] = {['x'] = 711.79211425781, ['y'] =164.77572631836, ['z'] =80.754455566406, ["disabled"] = false},

}

Citizen.CreateThread(function()
    while true do
        local ped = PlayerPedId()
        for i=1, #powerStationsPrison do
            if #(vector3(powerStationsPrison[i].x, powerStationsPrison[i].y,powerStationsPrison[i].z) - GetEntityCoords(ped)) < 5.0 then
                found = true
                if not powerStationsPrison[i].disabled then
                    DrawMarker(27, powerStationsPrison[i].x, powerStationsPrison[i].y,powerStationsPrison[i].z - 0.9, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.4, 0.4, 0.4, 176, 4, 4, 255, false, false, 0, 0)
                else
                    DrawMarker(27, powerStationsPrison[i].x, powerStationsPrison[i].y,powerStationsPrison[i].z - 0.9, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.4, 0.4, 0.4, 165, 186, 7, 255, false, false, 0, 0)
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

RegisterNetEvent('ARP-jailbreak:power:attempt')
AddEventHandler('ARP-jailbreak:power:attempt', function()
    local ped = PlayerPedId()
    local IsNearStation = IsNearStation()
    local police = exports["police"]:CountPolice()
    if police >= 10 then
        if IsNearStation then
            for i=1, #powerStationsPrison do
                if #(vector3(powerStationsPrison[i].x, powerStationsPrison[i].y,powerStationsPrison[i].z) - GetEntityCoords(ped)) < 1.5 then
                    if not powerStationsPrison[i].disabled then
                        if exports["ARP-inventory"]:hasEnoughOfItem("thermitecharge",1,false) then
                            FreezeEntityPosition(ped, true)
                            TriggerEvent("thermitecharge:props")
                            exports['ARP-memory']:StartMinigame({
                                success = 'jailbreak:passed',
                                fail = 'jailbreak:failed'
                            })
                        else 
                            TriggerEvent("DoLongHudText", "You need something else....")
                        end
                        
                    else
                        TriggerEvent("DoLongHudText", "This grid is already disabled!", 2)
                    end
                end
            end
        end
    else
        TriggerEvent("DoLongHudText", "Not enough police in the city!", 2)
    end
end)
exploded = false
RegisterNetEvent("jailbreak:shutdownpowers", function()
    local IsPowerDisabled = IsPowerDisabled()
    if IsPowerDisabled then
        if firstexploision then
            local finished = exports["ARP-taskbar"]:taskBar(5000, "Detonating")
            if finished == 100 then
                TriggerEvent("DoLongHudText", "Leave The Area Now!", 2)
                Wait(5000)
                TriggerServerEvent("ARP-jailbreak:effects", x, y, z)
                
                local veh = GetClosestVehicle(x,y,z, 100.0, 0, 70)
                SetVehicleAlarm(veh, true)	
                SetVehicleAlarmTimeLeft(veh, 8000)
                
                Wait(8500)
                DeleteObject(prop)
                exploded = true
                TriggerEvent("ARP-jailbreak:clienteffects2")
                firstexploision = false
            end
        else
            TriggerEvent("DoLongHudText", "Setup your bomb first", 2)
        end
    else
        TriggerEvent("DoLongHudText", "Seems to risky, Try find a way to turn detonate the bomb", 2)
    end     
end)

firstdoor = false
RegisterNetEvent('ARP-jail:attempt:hack')
AddEventHandler('ARP-jail:attempt:hack', function()
    local ped = PlayerPedId()
    local IsPowerDisabled = IsPowerDisabled()
    local police = exports["police"]:CountPolice()
    if police >= 7 then
        if exploded  then
            if exports['ARP-inventory']:hasEnoughOfItem('thermite', 1) then
                TaskStartScenarioInPlace(PlayerPedId(), 'WORLD_HUMAN_STAND_MOBILE', -1, true)

                if exports["ARP-thermite"]:startGame(15,2,14,500) then
                    TriggerEvent('ARP-dispatch:jailbreak', -1)
                    TriggerEvent('inventory:removeItem',"thermite", 1)
                    TriggerEvent("attachItem","minigameThermite")

                    RequestAnimDict("weapon@w_sp_jerrycan")
                    while ( not HasAnimDictLoaded( "weapon@w_sp_jerrycan" ) ) do
                        Wait(10)
                    end
                    FreezeEntityPosition(ped, true)
                    Wait(100)
                    TaskPlayAnim(PlayerPedId(),"weapon@w_sp_jerrycan","fire",2.0, -8, -1,49, 0, 0, 0, 0)
                    Wait(5000)
                    TaskPlayAnim(PlayerPedId(),"weapon@w_sp_jerrycan","fire",2.0, -8, -1,49, 0, 0, 0, 0)
                    TriggerEvent("destroyProp")
                    FreezeEntityPosition(ped, false)
                    ClearPedTasks(PlayerPedId())
                   
                    TriggerServerEvent("ARP-doors:changeLock-status", 63, false)
                    CallbackUnlockFirstDoor()
                     
                else
                    local coords = GetEntityCoords(PlayerPedId())
                    TriggerEvent('DoLongHudText', "You notice fire, RUN!", 2)
                    CallbackUnlockFirstDoor3()
                    Wait(2000)
                    if math.random(1,100) > 85 then
                        exports['ARP-thermite']:startFireAtLocation(coords.x, coords.y, coords.z - 1, 30000)
                    end
                end		
                TriggerEvent('inventory:removeItem',"thermite", 1)
            else
                TriggerEvent('DoLongHudText', "You are missing something!", 2)
            end		
        else
            TriggerEvent("DoLongHudText", "Seems to risky, Try find a way to turn the power off.", 2)
        end
    else
        TriggerEvent("DoLongHudText", "Not enough police in the city!", 2)
    end
end)

RegisterNetEvent('ARP-jail:attempt:hack2')
AddEventHandler('ARP-jail:attempt:hack2', function()
    local ped = PlayerPedId()
    local IsPowerDisabled = IsPowerDisabled()
    local police = exports["police"]:CountPolice()
    if police >= 7 then
            if firstdoor then
                if exports['ARP-inventory']:hasEnoughOfItem('thermite', 1) then
                    TaskStartScenarioInPlace(PlayerPedId(), 'WORLD_HUMAN_STAND_MOBILE', -1, true)
                    TriggerEvent('ARP-dispatch:jailbreak', -1)
                    if exports["ARP-thermite"]:startGame(15,4,10,500) then
                        TriggerEvent('inventory:removeItem',"thermite", 1)
                        TriggerEvent("attachItem","minigameThermite")
                        RequestAnimDict("weapon@w_sp_jerrycan")
                        while ( not HasAnimDictLoaded( "weapon@w_sp_jerrycan" ) ) do
                            Wait(10)
                        end
                        FreezeEntityPosition(ped, true)
                        Wait(100)
                        TaskPlayAnim(PlayerPedId(),"weapon@w_sp_jerrycan","fire",2.0, -8, -1,49, 0, 0, 0, 0)
                        Wait(5000)
                        TaskPlayAnim(PlayerPedId(),"weapon@w_sp_jerrycan","fire",2.0, -8, -1,49, 0, 0, 0, 0)
                        TriggerEvent("destroyProp")
                        FreezeEntityPosition(ped, false)
                        ClearPedTasks(PlayerPedId())
                        
                        TriggerServerEvent("ARP-doors:changeLock-status", 64, false)
                        TriggerServerEvent("ARP-doors:changeLock-status", 83, false)
                        TriggerServerEvent("ARP-doors:changeLock-status", 85, false)
                        TriggerServerEvent("ARP-doors:changeLock-status", 86, false)
                        TriggerServerEvent("ARP-doors:changeLock-status", 87, false)
                        TriggerServerEvent("ARP-doors:changeLock-status", 89, false)


                        CallbackUnlockFirstDoor2()
                        TriggerServerEvent("ARP-jailbreak-leavejail-hoya")
                    else
                        local plyCoords = GetEntityCoords(PlayerPedId())
                        TriggerEvent('DoLongHudText', "You notice fire, RUN!", 2)
                        CallbackUnlockFirstDoor3()
                        Wait(2000)
                        if math.random(1,100) > 85 then
                            exports["ARP-thermite"]:startFireAtLocation(plyCoords["x"],plyCoords["y"],plyCoords["z"]-0.3,10000)   
                        end
                    end		
                    TriggerEvent('inventory:removeItem',"thermite", 1)
                else
                    TriggerEvent('DoLongHudText', "You dont have any thermite!", 2)
                end		
            else
                TriggerEvent('DoLongHudText', "You Dumb or what?!", 2)
            end	
    else
        TriggerEvent("DoLongHudText", "Not enough police in the city!", 2)
    end
end)
function anim(dict)  
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Citizen.Wait(5)
    end
end

RegisterNetEvent("ARP-jailbreak-final2")
AddEventHandler("ARP-jailbreak-final2", function()
    if exports['ARP-inventory']:hasEnoughOfItem('Securitykey', 1) then
        local dict = 'mp_prison_break'
        anim(dict)
        FreezeEntityPosition(PlayerPedId(),true)
        TaskPlayAnim(PlayerPedId(), dict, "hack_loop", 3.0, -8, -1, 63, 0, 0, 0, 0 )
        SetEntityHeading(PlayerPedId(), 185.59745788574)        
        local finished = exports["ARP-taskbar"]:taskBar(30000, "Hacking The System")
        if finished == 100 then
            TriggerServerEvent("ARP-jailbreak:unjail")
            TriggerEvent('inventory:removeItem',"securitykey", 1)
            FreezeEntityPosition(PlayerPedId(),false)

        end
        FreezeEntityPosition(PlayerPedId(),false)

    else
        TriggerEvent("DoLongHudText", "Grab your hacking device with your hombre", 2)
    end

end)

RegisterNetEvent("ARP-jailbreak-final")
AddEventHandler("ARP-jailbreak-final", function()
    TriggerServerEvent("ARP-jailbreak-leavejail-shit")
end)

function CallbackUnlockFirstDoor(pSuccess)
    local ped = PlayerPedId()
    FreezeEntityPosition(ped, true)
    local finished = exports["ARP-taskbar"]:taskBar(30000, "Unlocking Door")
    if finished == 100 then
        firstdoor = true
        TriggerEvent("DoLongHudText", "Door Unlocked!", 1)
        FreezeEntityPosition(ped, false)
    end
    FreezeEntityPosition(ped, false)
end

function CallbackUnlockFirstDoor2(pSuccess)
    local ped = PlayerPedId()
    FreezeEntityPosition(ped, true)
    local finished = exports["ARP-taskbar"]:taskBar(30000, "Unlocking Door")
    TriggerEvent('ARP-dispatch:jailbreak', -1)
    if finished == 100 then
        TriggerEvent( "player:receiveItem","securitykey", math.random(1,3))
        TriggerEvent("DoLongHudText", "Door Unlocked!", 1)
        FreezeEntityPosition(ped, false)
    end
    FreezeEntityPosition(ped, false)
end

function CallbackUnlockFirstDoor3(pSuccess)
    local ped = PlayerPedId()
    TriggerEvent("destroyProp")
    FreezeEntityPosition(ped, false)
    ClearPedTasks(PlayerPedId())
    TriggerEvent('DoLongHudText', 'You failed, loser!', 2)
end

RegisterNetEvent("jailbreak:passed", function()
    local station = GetNearestStation()
    FreezeEntityPosition(PlayerPedId(), false)
    TriggerServerEvent("ARP-jailbreak:updateStates", "station", station, true)
    firstexploision = true
end)

RegisterNetEvent("jailbreak:failed", function()
    FreezeEntityPosition(PlayerPedId(), false)
    exports['ARP_dispatch']:SendAlert("AlertGrid")
    TriggerEvent("DoLongHudText", "You Failed Loser!", 2)
end)

RegisterNetEvent('ARP-jailbreak2:updateStates')
AddEventHandler('ARP-jailbreak2:updateStates', function(type,id,state)
    if type == "station" then
        powerStationsPrison[id].disabled = state
    end
end)


RegisterNetEvent('thermitecharge:props')
AddEventHandler('thermitecharge:props', function()
	local p = PlayerPedId()
	RequestAnimDict('anim@heists@ornate_bank@thermal_charge')
    if HasAnimDictLoaded('anim@heists@ornate_bank@thermal_charge') then
        local fwd, _, _, pos = GetEntityMatrix(p)
        local np = (fwd * 0.8) + pos   
        SetEntityCoords(p, np.xy, np.z - 1)
        local rot, pos = GetEntityRotation(p), GetEntityCoords(p)
        SetPedComponentVariation(p, 5, -1, 0, 0)
        local b = CreateObject(GetHashKey("hei_p_m_bag_var22_arm_s"), pos.x, pos.y, pos.z,  true,  true, false)
        local sc = NetworkCreateSynchronisedScene(pos.x, pos.y, pos.z, rot.x, rot.y, rot.z, 2, 0, 0, 1065353216, 0, 1.3)
        SetEntityCollision(b, 0, 1)
        NetworkAddPedToSynchronisedScene(p, sc, "anim@heists@ornate_bank@thermal_charge", "thermal_charge", 1.5, -4.0, 1, 16, 1148846080, 0)
        NetworkAddEntityToSynchronisedScene(b, sc, "anim@heists@ornate_bank@thermal_charge", "bag_thermal_charge", 4.0, -8.0, 1)
        NetworkStartSynchronisedScene(sc)
        Citizen.Wait(1500)
        pos = GetEntityCoords(p)
        prop = CreateObject(GetHashKey("hei_prop_heist_thermite"), pos.x, pos.y, pos.z + 0.2, true, true, true)
        SetEntityCollision(prop, false, true)
        AttachEntityToEntity(prop, p, GetPedBoneIndex(p, 28422), 0, 0, 0, 0, 0, 200.0, true, true, false, true, 1, true)
        Citizen.Wait(4000)
        DeleteObject(b)
        SetPedComponentVariation(p, 5, 45, 0, 0)
        DetachEntity(prop, 1, 1)
        FreezeEntityPosition(prop, 1)
        SetEntityCollision(prop, 0, 1)
        pCoords = GetEntityCoords(prop)
    end
end)


RegisterNetEvent("ARP-jailbreak:clienteffects")
AddEventHandler("ARP-jailbreak:clienteffects", function(x, y, z)
	local ped = PlayerPedId()
    local coords = vector3(651.88031005859, 101.22057342529, 80.737586975098)
	local coords2 = vector3(658.68957519531, 114.80409240723, 80.922920227051)
	local coords3 = vector3(697.91485595703, 158.25569152832, 80.940383911133)
	local coords4 = vector3(711.79211425781, 164.77572631836, 80.754455566406)
    local coords5 = vector3(704.32379150391, 109.61221313477, 80.939956665039)
    local coords6 = vector3(714.19140625,    126.51073455811, 80.89274597168)
    local coords7 = vector3(704.01879882813, 101.78023529053, 80.928764343262)
    local coords8 = vector3(680.39422607422, 174.83526611328, 80.9501953125)
	RequestWeaponAsset(GetHashKey("WEAPON_RPG")) 
    while not HasWeaponAssetLoaded(GetHashKey("WEAPON_RPG")) do
        Wait(0)
    end
	ShootSingleBulletBetweenCoords( 
		coords.x,
        coords.y,
        coords.z, 
	    coords.x,
        coords.y,
        coords.z,  
		500,
		true,
		GetHashKey("WEAPON_RPG"),
		ped,
		true,
		true,
		-1.0
    )
	Citizen.Wait(1000)
	ShootSingleBulletBetweenCoords( 
		coords2.x,
        coords2.y,
        coords2.z, 
	    coords2.x,
        coords2.y,
        coords2.z,  
		500,
		true,
		GetHashKey("WEAPON_RPG"),
		ped,
		true,
		true,
		-1.0
    )
    Citizen.Wait(1000)
	ShootSingleBulletBetweenCoords( 
		coords3.x,
        coords3.y,
        coords3.z, 
	    coords3.x,
        coords3.y,
        coords3.z,  
		500,
		true,
		GetHashKey("WEAPON_RPG"),
		ped,
		true,
		true,
		-1.0
    )
    Citizen.Wait(1000)
	ShootSingleBulletBetweenCoords( 
		coords4.x,
        coords4.y,
        coords4.z, 
	    coords4.x,
        coords4.y,
        coords4.z,  
		500,
		true,
		GetHashKey("WEAPON_RPG"),
		ped,
		true,
		true,
		-1.0
    )
    Citizen.Wait(1000)
	ShootSingleBulletBetweenCoords( 
		coords5.x,
        coords5.y,
        coords5.z, 
	    coords5.x,
        coords5.y,
        coords5.z,  
		500,
		true,
		GetHashKey("WEAPON_RPG"),
		ped,
		true,
		true,
		-1.0
    )
    Citizen.Wait(1000)
	ShootSingleBulletBetweenCoords( 
		coords6.x,
        coords6.y,
        coords6.z, 
	    coords6.x,
        coords6.y,
        coords6.z,  
		500,
		true,
		GetHashKey("WEAPON_RPG"),
		ped,
		true,
		true,
		-1.0
    )
    Citizen.Wait(1000)
	ShootSingleBulletBetweenCoords( 
		coords7.x,
        coords7.y,
        coords7.z, 
	    coords7.x,
        coords7.y,
        coords7.z,  
		500,
		true,
		GetHashKey("WEAPON_RPG"),
		ped,
		true,
		true,
		-1.0
    )
    Citizen.Wait(1000)
	ShootSingleBulletBetweenCoords( 
		coords8.x,
        coords8.y,
        coords8.z, 
	    coords8.x,
        coords8.y,
        coords8.z,  
		500,
		true,
		GetHashKey("WEAPON_RPG"),
		ped,
		true,
		true,
		-1.0
    )    
end)



RegisterNetEvent("ARP-jailbreak:clienteffects2")
AddEventHandler("ARP-jailbreak:clienteffects2", function()
    TriggerServerEvent("erp:blackout")
	Citizen.Wait(60000)
    TriggerServerEvent("erp:blackout")
end)

-- RegisterCommand("ayow",function()
--     TriggerEvent("jailbreak:shutdownpowers")
-- end)

--functions--
function IsPowerDisabled()
    local amount = 0
    for i=1, #powerStationsPrison do
        if powerStationsPrison[i].disabled then
            amount = amount + 1
        end
    end
    if amount == #powerStationsPrison then
        return true
    end
    return false
end

function IsNearStation()
    for i=1, #powerStationsPrison do
        if #(vector3(powerStationsPrison[i].x, powerStationsPrison[i].y,powerStationsPrison[i].z) - GetEntityCoords(PlayerPedId())) < 1.5 then
            return true
        end
    end
    return false
end

function GetNearestStation()
    for i=1, #powerStationsPrison do
        if #(vector3(powerStationsPrison[i].x, powerStationsPrison[i].y,powerStationsPrison[i].z) - GetEntityCoords(PlayerPedId())) < 2.0 then
            return i
        end
    end
    return 0
end

Citizen.CreateThread(function()
    exports["ARP-target"]:AddBoxZone("bomb", vector3(718.21, 153.74, 80.75), 1, 1, {
        name="bomb",
        heading=330,
        --debugPoly=true,
        minZ=77.95,
        maxZ=81.95
	}, {
		options = {
			{
				event = "jailbreak:shutdownpowers",
				icon = "fas fa-bomb",
				label = "Detonate Bomb"
			}
		},
		job = {"all"},
		distance = 2.0
	})
    exports["ARP-target"]:AddBoxZone("jail", vector3(1846.16, 2604.72, 45.57), 0.5, 0.5, {
        name="jail",
        heading=0,
        --debugPoly=true,
        minZ=41.97,
        maxZ=45.97
	}, {
		options = {
			{
				event = "ARP-jail:attempt:hack",
				icon = "fas fa-arrow-alt-circle-down",
				label = "Enter the Door to leave the roof!"
			}
		},
		job = {"all"},
		distance = 2.0
	})

    exports["ARP-target"]:AddBoxZone("jail2", vector3(1819.5, 2604.71, 45.58), 0.5, 0.5, {
        name="jail2",
        heading=0,
        minZ=41.98,
        maxZ=45.98
	}, {
		options = {
			{
				event = "ARP-jail:attempt:hack2",
				icon = "fas fa-arrow-alt-circle-down",
				label = "Enter the Door to leave the roof!"
			}
		},
		job = {"all"},
		distance = 2.0
	})

    exports["ARP-target"]:AddBoxZone("jail_leave", vector3(1839.79, 2574.08, 46.01), 0.5, 0.5, {
        name="jail_leave",
        heading=0,
        minZ=45.81,
        maxZ=46.01
	}, {
		options = {
			{
				event = "ARP-jailbreak-final",
				icon = "fas fa-arrow-alt-circle-down",
				label = "Enter the Door to leave the roof!"
			}
		},
		job = {"all"},
		distance = 2.0
	})

    exports["ARP-target"]:AddBoxZone("jail_craft", vector3(1747.48, 2470.97, 45.74), 0.7, 0.7, {
        name="jail_craft",
        heading=30,
        minZ=42.54,
        maxZ=46.54
    }, 
    {
        options = {
            {
                event = "craft:prison:guns4",
                icon = "fas fa-hand-holding",
                label = "Let's Trade?"
            }
        },
        job = {"all"},
        distance = 2.0
    })

    exports["ARP-target"]:AddBoxZone("jail_job", vector3(1686.46, 2546.94, 45.56), 1, 1, {
        name="jail_job",
        heading=0,
        --debugPoly=true,
        minZ=42.36,
        maxZ=46.36
    }, 
    {
        options = {
            {
                event = "jail:deliver",
                icon = "fas fa-shopping-bag",
                label = "Deliver Some Food Box"
            },

            {
                event = "jail:electrical:job",
                icon = "fas fa-wrench",
                label = "Fix Electrical"
            }
        },
        job = {"all"},
        distance = 2.0
    })

    exports["ARP-target"]:AddBoxZone("jail_clean", vector3(1776.96, 2546.43, 45.67), 0.9, 0.7, {
        name="jail_clean",
        heading=50,
        minZ=42.47,
        maxZ=46.47
    }, 
    {
        options = {
            {
                event = "",
                icon = "fas fa-hand-sparkles",
                label = "Clean Tables & Chairs"
            }
        },
        job = {"all"},
        distance = 2.0
    })

	exports["ARP-target"]:AddBoxZone("Table1", vector3(1781.38, 2554.46, 45.67), 2.2, 1, {
        name="Table1",
        heading=270,
        --debugPoly=true,
        minZ=41.67,
        maxZ=45.67
    }, 
    {
        options = {
            {
                event = "clean:jail",
                icon = "fas fa-hand-holding",
                label = "Start Cleaning!"
            }
        },
        job = {"all"},
        distance = 2.0
    })

	exports["ARP-target"]:AddBoxZone("Table2", vector3(1781.27, 2550.8, 45.67), 2.2, 1, {
        name="Table2",
        heading=270,
        --debugPoly=true,
        minZ=41.67,
        maxZ=45.67
    }, 
    {
        options = {
            {
                event = "clean:jail2",
                icon = "fas fa-hand-holding",
                label = "Start Cleaning!"
            }
        },
        job = {"all"},
        distance = 2.0
    })

	exports["ARP-target"]:AddBoxZone("Table3", vector3(1781.42, 2547.35, 45.67), 2.2, 1, {
        name="Table3",
        heading=270,
        --debugPoly=true,
        minZ=41.67,
        maxZ=45.67
    }, 
    {
        options = {
            {
                event = "clean:jail3",
                icon = "fas fa-hand-holding",
                label = "Start Cleaning!"
            }
        },
        job = {"all"},
        distance = 2.0
    })

	exports["ARP-target"]:AddBoxZone("Table4", vector3(1787.31, 2547.33, 45.67), 2.2, 1, {
        name="Table4",
        heading=270,
        --debugPoly=true,
        minZ=41.67,
        maxZ=45.67
    }, 
    {
        options = {
            {
                event = "clean:jail4",
                icon = "fas fa-hand-holding",
                label = "Start Cleaning!"
            }
        },
        job = {"all"},
        distance = 2.0
    })

	exports["ARP-target"]:AddBoxZone("Table5", vector3(1787.21, 2550.91, 45.67), 2.2, 1, {
        name="Table5",
        heading=270,
        --debugPoly=true,
        minZ=41.67,
        maxZ=45.67
    }, 
    {
        options = {
            {
                event = "clean:jail5",
                icon = "fas fa-hand-holding",
                label = "Start Cleaning!"
            }
        },
        job = {"all"},
        distance = 2.0
    })

	exports["ARP-target"]:AddBoxZone("Table6", vector3(1787.11, 2554.5, 45.67), 2.2, 1, {
        name="Table6",
        heading=270,
        --debugPoly=true,
        minZ=44.47,
        maxZ=45.67
    }, 
    {
        options = {
            {
                event = "clean:jail6",
                icon = "fas fa-hand-holding",
                label = "Start Cleaning!"
            }
        },
        job = {"all"},
        distance = 2.0
    })

	exports["ARP-target"]:AddBoxZone("start_cleaning", vector3(1779.39, 2545.34, 45.67), 1, 1, {
        name="start cleaning",
        heading=0,
        minZ=42.47,
        maxZ=46.47
    }, 
    {
        options = {
            {
                event = "Start:clean:jail",
                icon = "fas fa-hand-holding",
                label = "Start Cleaning!"
            },

            {
                event = "Finish:clean:jail",
                icon = "fas fa-hand-holding",
                label = "Collect Your Rewards!"
            }


        },
        job = {"all"},
        distance = 2.0
    })

end)