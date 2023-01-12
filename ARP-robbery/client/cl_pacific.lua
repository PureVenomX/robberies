Citizen.CreateThread(function()
    Citizen.Wait(1)
    while true do
        local ped = PlayerPedId()
        local pos = GetEntityCoords(ped)
        local inRange = false


            if Config.BigBanks["pacific"]["isOpened"] then
                for k, v in pairs(Config.BigBanks["pacific"]["lockers"]) do
                    local lockerDist = GetDistanceBetweenCoords(pos, Config.BigBanks["pacific"]["lockers"][k].x, Config.BigBanks["pacific"]["lockers"][k].y, Config.BigBanks["pacific"]["lockers"][k].z)
                    if not Config.BigBanks["pacific"]["lockers"][k]["isBusy"] then
                        if not Config.BigBanks["pacific"]["lockers"][k]["isOpened"] then
						
                            if lockerDist < 5 then
                                inRange = true
                                DrawMarker(27,Config.BigBanks["pacific"]["lockers"][k].x, Config.BigBanks["pacific"]["lockers"][k].y, Config.BigBanks["pacific"]["lockers"][k].z-0.9, 0, 0, 0, 0, 0, 0, 0.60, 0.60, 0.3, 255,0,0, 60, 0, 0, 2, 0, 0, 0, 0)
								
                                if lockerDist < 1.0 then
                                    DrawText3Ds(Config.BigBanks["pacific"]["lockers"][k].x, Config.BigBanks["pacific"]["lockers"][k].y, Config.BigBanks["pacific"]["lockers"][k].z, 'Press ~g~E~s~ to crack the safe')   
                                    if IsControlJustPressed(0, Keys["E"]) then
                                        local police = exports["police"]:CountPolice()
                                            if police >= 4 then  
                                            OpenLocker("pacific", k)
                                        else
                                            TriggerEvent('DoLongHudText', "Not enough police (4 needed)", 2)
                                        end
                                    end
                                end
							end	
                        end
                    end
                end
            else
			    local dist1 = GetDistanceBetweenCoords(pos, Config.BigBanks["pacific"]["coords"][1]["x"], Config.BigBanks["pacific"]["coords"][1]["y"], Config.BigBanks["pacific"]["coords"][1]["z"])
                local dist2 = GetDistanceBetweenCoords(pos, Config.BigBanks["pacific"]["coords"][2]["x"], Config.BigBanks["pacific"]["coords"][2]["y"], Config.BigBanks["pacific"]["coords"][2]["z"])
                local dist3 = GetDistanceBetweenCoords(pos, Config.BigBanks["pacific"]["coords"][3]["x"], Config.BigBanks["pacific"]["coords"][3]["y"], Config.BigBanks["pacific"]["coords"][3]["z"])
				local dist4 = GetDistanceBetweenCoords(pos, Config.BigBanks["pacific"]["coords"][4]["x"], Config.BigBanks["pacific"]["coords"][4]["y"], Config.BigBanks["pacific"]["coords"][4]["z"])
				
				-- if dist1 < 5 then
                --     inRange = true
                --     DrawMarker(27,Config.BigBanks["pacific"]["coords"][1]["x"], Config.BigBanks["pacific"]["coords"][1]["y"], Config.BigBanks["pacific"]["coords"][1]["z"]-0.9, 0, 0, 0, 0, 0, 0, 0.60, 0.60, 0.3, 255,0,0, 60, 0, 0, 2, 0, 0, 0, 0)
                -- end

                -- if dist1 < 0.5 then
                --     DT1(Config.BigBanks["pacific"]["coords"][1]["x"], Config.BigBanks["pacific"]["coords"][1]["y"], Config.BigBanks["pacific"]["coords"][1]["z"]-0.9, " Use Lockpick")
                -- end

                -- if dist2 < 5 then
                --     inRange = true
                --     DrawMarker(27,Config.BigBanks["pacific"]["coords"][2]["x"], Config.BigBanks["pacific"]["coords"][2]["y"], Config.BigBanks["pacific"]["coords"][2]["z"]-0.9, 0, 0, 0, 0, 0, 0, 0.60, 0.60, 0.3, 255,0,0, 60, 0, 0, 2, 0, 0, 0, 0)
                -- end

                -- if dist2 < 0.5 then
                --     DT1(Config.BigBanks["pacific"]["coords"][2]["x"], Config.BigBanks["pacific"]["coords"][2]["y"], Config.BigBanks["pacific"]["coords"][2]["z"]-0.9, " Use GoldCard")
                -- end

                -- if dist3 < 5 then
                --     inRange = true
                --     DrawMarker(27,Config.BigBanks["pacific"]["coords"][3]["x"], Config.BigBanks["pacific"]["coords"][3]["y"], Config.BigBanks["pacific"]["coords"][3]["z"]-0.9, 0, 0, 0, 0, 0, 0, 0.60, 0.60, 0.3, 255,0,0, 60, 0, 0, 2, 0, 0, 0, 0)
                -- end

                -- if dist3 < 0.5 then
                --     DT1(Config.BigBanks["pacific"]["coords"][3]["x"], Config.BigBanks["pacific"]["coords"][3]["y"], Config.BigBanks["pacific"]["coords"][3]["z"]-0.9, " Use GoldCard")
                -- end
				
				-- if dist4 < 5 then
                --     inRange = true
                --     DrawMarker(27,Config.BigBanks["pacific"]["coords"][4]["x"], Config.BigBanks["pacific"]["coords"][4]["y"], Config.BigBanks["pacific"]["coords"][4]["z"]-0.9, 0, 0, 0, 0, 0, 0, 0.60, 0.60, 0.3, 255,0,0, 60, 0, 0, 2, 0, 0, 0, 0)
                -- end

                -- if dist4 < 0.5 then
                --     DT1(Config.BigBanks["pacific"]["coords"][4]["x"], Config.BigBanks["pacific"]["coords"][4]["y"], Config.BigBanks["pacific"]["coords"][4]["z"]-0.9, " Use GreenCard")
                -- end
            end
            if not inRange then
                Citizen.Wait(2500)
            end
      
        Citizen.Wait(1)
    end
end)


-- Citizen.CreateThread(function()
--     Citizen.Wait(1)
--     while true do
--         local ped = PlayerPedId()
--         local pos = GetEntityCoords(ped)
--         local inRange = false
        

--             if Config.BigBanks["pacific"]["isOpened"] then
--                 for k, v in pairs(Config.BigBanks["pacific"]["thermite"]) do
-- 					local dist = GetDistanceBetweenCoords(pos, Config.BigBanks["pacific"]["thermite"][1]["x"], Config.BigBanks["pacific"]["thermite"][1]["y"], Config.BigBanks["pacific"]["thermite"][1]["z"])
-- 					local dist2 = GetDistanceBetweenCoords(pos, Config.BigBanks["pacific"]["thermite"][2]["x"], Config.BigBanks["pacific"]["thermite"][2]["y"], Config.BigBanks["pacific"]["thermite"][2]["z"])
--                     if not Config.BigBanks["pacific"]["thermite"][k]["isBusy"] then
--                         if not Config.BigBanks["pacific"]["thermite"][k]["isOpened"] then
--                             if dist < 5 then
--                                 inRange = true
--                                 DrawMarker(27,Config.BigBanks["pacific"]["thermite"][1]["x"], Config.BigBanks["pacific"]["thermite"][1]["y"], Config.BigBanks["pacific"]["thermite"][1]["z"]-0.9, 0, 0, 0, 0, 0, 0, 0.60, 0.60, 0.3, 255,0,0, 60, 0, 0, 2, 0, 0, 0, 0)
-- 							end	
							
-- 							if dist < 0.5 then
--                                 DT1(Config.BigBanks["pacific"]["thermite"][1]["x"], Config.BigBanks["pacific"]["thermite"][1]["y"], Config.BigBanks["pacific"]["thermite"][1]["z"]-0.9, " Use Thermite")			
--                             end
							
							
-- 							if dist2 < 5 then
--                                 inRange = true
--                                 DrawMarker(27,Config.BigBanks["pacific"]["thermite"][2]["x"], Config.BigBanks["pacific"]["thermite"][2]["y"], Config.BigBanks["pacific"]["thermite"][2]["z"]-0.9, 0, 0, 0, 0, 0, 0, 0.60, 0.60, 0.3, 255,0,0, 60, 0, 0, 2, 0, 0, 0, 0)
-- 							end	

--                             if dist2 < 0.5 then
--                                 DT1(Config.BigBanks["pacific"]["thermite"][2]["x"], Config.BigBanks["pacific"]["thermite"][2]["y"], Config.BigBanks["pacific"]["thermite"][2]["z"]-0.9, " Use Thermite")								
--                             end
--                         end
--                     end
--                 end
--             end
--             if not inRange then
--                 Citizen.Wait(2500)
--             end
     
--         Citizen.Wait(1)
--     end
-- end)

function DT1(x,y,z,text)
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

RegisterNetEvent('ARP-robbery:UseBankLockPick')
AddEventHandler('ARP-robbery:UseBankLockPick', function()
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    local dist = GetDistanceBetweenCoords(pos, Config.BigBanks["pacific"]["coords"][1]["x"], Config.BigBanks["pacific"]["coords"][1]["y"],Config.BigBanks["pacific"]["coords"][1]["z"])
    if dist < 1.5 then
        TriggerServerEvent("isRobberyActive")
        if not isBusy then
            local police = exports["police"]:CountPolice()
            if police >= 4 then
                if not Config.BigBanks["pacific"]["isOpened"] then 
                    if exports['ARP-inventory']:hasEnoughOfItem('thermitecharge', 1) then
                        Wait(300)
                        thermiteEffect()
                    else
                        TriggerEvent('DoLongHudText', "You're missing thermite", 2)
                    end
                else
                    TriggerEvent('DoLongHudText', "Looks like the bank is already open.", 2)
                end
            else
                TriggerEvent('DoLongHudText', "Not enough police (4 needed)", 2)
            end
        else
            TriggerEvent('DoLongHudText', "The security lock is active, opening the door is currently not possible.", 2)
        end
    end 
end)

Citizen.CreateThread(function()
    RequestNamedPtfxAsset('scr_ornate_heist')
    HasNamedPtfxAssetLoaded('scr_ornate_heist') 
    Citizen.Wait(5)
end)

RegisterNetEvent('pacific:thermiteEffect')
AddEventHandler('pacific:thermiteEffect', function(entity)
    SetPtfxAssetNextCall("scr_ornate_heist")
    explosiveEffect = StartParticleFxLoopedOnEntity("scr_heist_ornate_thermal_burn", entity, 0.0, 2.0, 0.0, 0.0, 0.0, 0.0, 2.0, 0, 0, 0, 0)
    Citizen.Wait(10000)
    StopParticleFxLooped(explosiveEffect, 0)
end)

RegisterNetEvent("pacific:success:panel", function()
    local ped = PlayerPedId()
    TriggerEvent('DoLongHudText', "Success!", 1)
    TriggerEvent('inventory:removeItem', 'thermitecharge', 1)	
    TriggerEvent('ARP-dispatch:pacific', -1)
    TriggerServerEvent('thermite:effects', prop)
    TaskPlayAnim(ped, "anim@heists@ornate_bank@thermal_charge", "cover_eyes_intro", 8.0, 8.0, 1000, 36, 1, 0, 0, 0)
    TaskPlayAnim(ped, "anim@heists@ornate_bank@thermal_charge", "cover_eyes_loop", 8.0, 8.0, 6000, 49, 1, 0, 0, 0)
    FreezeEntityPosition(PlayerPedId(),false)
    Citizen.Wait(10000)
    ClearPedTasks(ped)
    NetworkStopSynchronisedScene(sc)
    DeleteObject(prop)
    seguridad = false
    TriggerServerEvent("ARP-doors:changeLock-status", 188, false)
    TriggerServerEvent("ARP-doors:changeLock-status", 192, false)
end)

RegisterNetEvent("pacific:fail:panel", function()
    local ped = PlayerPedId()
    local plyCoords = GetEntityCoords(PlayerPedId())
    TriggerEvent('DoLongHudText', "failed!", 1)
    TriggerEvent('inventory:removeItem', 'thermitecharge', 1)	
    TriggerEvent('ARP-dispatch:pacific', -1)
    ClearPedTasks(ped)
    NetworkStopSynchronisedScene(sc)
    DeleteObject(prop)
    seguridad = false
    FreezeEntityPosition(PlayerPedId(),false)
    exports["ARP-thermite"]:startFireAtLocation(plyCoords["x"],plyCoords["y"],plyCoords["z"]-0.3,10000)   
end)

RegisterNetEvent('ARP-robbery:UseBankThermiteOne')
AddEventHandler('ARP-robbery:UseBankThermiteOne', function(bankId, lockerId)
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
	local dist = GetDistanceBetweenCoords(pos, Config.BigBanks["pacific"]["thermite"][1]["x"], Config.BigBanks["pacific"]["thermite"][1]["y"], Config.BigBanks["pacific"]["thermite"][1]["z"])
	if bankId == closestBank then
    if dist < 1.5 then
        local police = exports["police"]:CountPolice()
        if police >= 4 then
			if exports['ARP-inventory']:hasEnoughOfItem('thermitecharge', 1) then
                Wait(300)
                thermiteEffect2()
            else
                TriggerEvent('DoLongHudText', "You dont have any thermite!", 2)
			end		
		else
            TriggerEvent('DoLongHudText', "Not enough police (4 needed)", 2)
        end	
	end
  end
end)  

RegisterNetEvent('ARP-robbery:UseBankThermiteTwo')
AddEventHandler('ARP-robbery:UseBankThermiteTwo', function(bankId, lockerId)
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
	local dist = GetDistanceBetweenCoords(pos, Config.BigBanks["pacific"]["thermite"][2]["x"], Config.BigBanks["pacific"]["thermite"][2]["y"], Config.BigBanks["pacific"]["thermite"][2]["z"])
    if dist < 1.5 then
        local police = exports["police"]:CountPolice()
        if police >= 4 then
			if exports['ARP-inventory']:hasEnoughOfItem('thermitecharge', 1) then
                Wait(300)
                thermiteEffect3()
            else
                TriggerEvent('DoLongHudText', "You dont have any thermite!", 2)
			end		
		else
            TriggerEvent('DoLongHudText', "Not enough police (4 needed)", 2)
        end	
	end
end)

function thermiteEffect()
	local p = PlayerPedId()
	RequestAnimDict('anim@heists@ornate_bank@thermal_charge')
    if HasAnimDictLoaded('anim@heists@ornate_bank@thermal_charge') then
        local fwd, _, _, pos = GetEntityMatrix(p)
        local np = (fwd * 0.8) + pos   
        SetEntityCoords(PlayerPedId(),257.12631225586, 219.46713256836, 106.28642272949 )
        SetEntityHeading(PlayerPedId(), 336.06008911133)
        FreezeEntityPosition(PlayerPedId(),true)
        --SetEntityCoords(p, np.xy, np.z - 1)
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
        exports['ARP-memory']:StartMinigame({
            success = 'pacific:success:panel',
            fail = 'pacific:fail:panel',
            maxFails = 2,
            maxSquares = 25,
        })
    end
end

function thermiteEffect2()
	local p = PlayerPedId()
	RequestAnimDict('anim@heists@ornate_bank@thermal_charge')
    if HasAnimDictLoaded('anim@heists@ornate_bank@thermal_charge') then
        local fwd, _, _, pos = GetEntityMatrix(p)
        local np = (fwd * 0.8) + pos   
        SetEntityCoords(PlayerPedId(),253.22175598145, 221.46678161621, 101.68340301514 )
        SetEntityHeading(PlayerPedId(), 159.8603515625)
        -- SetEntityCoords(playerPed, np.xy, np.z - 1)
        FreezeEntityPosition(PlayerPedId(),true)
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
        exports['ARP-memory']:StartMinigame({
            success = 'pacific:success:panel2',
            fail = 'pacific:fail:panel2',
            maxFails = 2,
            maxSquares = 25,
        })
    end
end

function thermiteEffect3()
	local p = PlayerPedId()
	RequestAnimDict('anim@heists@ornate_bank@thermal_charge')
    if HasAnimDictLoaded('anim@heists@ornate_bank@thermal_charge') then
        local fwd, _, _, pos = GetEntityMatrix(p)
        local np = (fwd * 0.8) + pos   
        SetEntityCoords(PlayerPedId(),260.76126098633, 215.9174041748, 101.68347167969)
        SetEntityHeading(PlayerPedId(), 249.42530822754)
        -- SetEntityCoords(playerPed, np.xy, np.z - 1)
        FreezeEntityPosition(PlayerPedId(),true)
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
        exports['ARP-memory']:StartMinigame({
            success = 'pacific:success:panel3',
            fail = 'pacific:fail:panel2',
            maxFails = 2,
            maxSquares = 25,
        })
    end
end


RegisterNetEvent("pacific:success:panel2", function()
    local ped = PlayerPedId()
    TriggerEvent('DoLongHudText', "Success!", 1)
    TriggerEvent('inventory:removeItem', 'thermitecharge', 1)	
    TriggerEvent('ARP-dispatch:pacific', -1)
    TriggerServerEvent('thermite:effects', prop)
    TaskPlayAnim(ped, "anim@heists@ornate_bank@thermal_charge", "cover_eyes_intro", 8.0, 8.0, 1000, 36, 1, 0, 0, 0)
    TaskPlayAnim(ped, "anim@heists@ornate_bank@thermal_charge", "cover_eyes_loop", 8.0, 8.0, 6000, 49, 1, 0, 0, 0)
    FreezeEntityPosition(PlayerPedId(),false)
    Citizen.Wait(10000)
    ClearPedTasks(ped)
    NetworkStopSynchronisedScene(sc)
    DeleteObject(prop)
    seguridad = false
    TriggerServerEvent("ARP-doors:changeLock-status", 190, false)

end)

RegisterNetEvent("pacific:fail:panel2", function()
    local ped = PlayerPedId()
    local plyCoords = GetEntityCoords(PlayerPedId())
    TriggerEvent('DoLongHudText', "failed!", 1)
    TriggerEvent('inventory:removeItem', 'thermitecharge', 1)	
    TriggerEvent('ARP-dispatch:pacific', -1)
    ClearPedTasks(ped)
    NetworkStopSynchronisedScene(sc)
    DeleteObject(prop)
    seguridad = false
    FreezeEntityPosition(PlayerPedId(),false)
    exports["ARP-thermite"]:startFireAtLocation(plyCoords["x"],plyCoords["y"],plyCoords["z"]-0.3,10000)   
end)

RegisterNetEvent("pacific:success:panel3", function()
    local ped = PlayerPedId()
    TriggerEvent('DoLongHudText', "Success!", 1)
    TriggerEvent('inventory:removeItem', 'thermitecharge', 1)	
    TriggerEvent('ARP-dispatch:pacific', -1)
    TriggerServerEvent('thermite:effects', prop)
    TaskPlayAnim(ped, "anim@heists@ornate_bank@thermal_charge", "cover_eyes_intro", 8.0, 8.0, 1000, 36, 1, 0, 0, 0)
    TaskPlayAnim(ped, "anim@heists@ornate_bank@thermal_charge", "cover_eyes_loop", 8.0, 8.0, 6000, 49, 1, 0, 0, 0)
    FreezeEntityPosition(PlayerPedId(),false)
    Citizen.Wait(10000)
    ClearPedTasks(ped)
    NetworkStopSynchronisedScene(sc)
    DeleteObject(prop)
    seguridad = false
    TriggerServerEvent("ARP-doors:changeLock-status", 191, false)
end)


RegisterNetEvent('ARP-robbery:UseBankCardA')
AddEventHandler('ARP-robbery:UseBankCardA', function()
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    local dist = GetDistanceBetweenCoords(pos, Config.BigBanks["pacific"]["coords"][2]["x"], Config.BigBanks["pacific"]["coords"][2]["y"],Config.BigBanks["pacific"]["coords"][2]["z"])
    if dist < 1.5 then
        TriggerServerEvent("isRobberyActive")
        if not isBusy then
            local dist = GetDistanceBetweenCoords(pos, Config.BigBanks["pacific"]["coords"][2]["x"], Config.BigBanks["pacific"]["coords"][2]["y"], Config.BigBanks["pacific"]["coords"][2]["z"])
            if dist < 1.5 then
                local police = exports["police"]:CountPolice()
                if police >= 4 then
                    if not Config.BigBanks["pacific"]["isOpened"] then
                        if exports['ARP-inventory']:hasEnoughOfItem('redlaptop', 1) and exports['ARP-inventory']:hasEnoughOfItem('rcadrive', 1) then
                            StartHeistPacific()
                            local card = exports["ARP-taskbar"]:taskBar(9000,"Hooking up equipment")
                            if card == 100 then
                                TriggerEvent('inventory:removeItem', 'rcadrive', 1)	
                                TriggerEvent("client:newStress",true,200)
                                exports['ARP-hacking']:OpenHackingGame(function(Success)
                                    if Success then
                                        TriggerEvent("pacific:success:hack")
                                    else
                                        TriggerEvent("pacific:fail:hack")
                                    end
                                end)
                            end  
                        
                        else
                            TriggerEvent("DoLongHudText", "You're missing stuff...", 2)
                        end
                        
                    else
                        TriggerEvent('DoLongHudText', "Looks like the bank is already open.", 2)
                    end
                else
                    TriggerEvent('DoLongHudText', "Not enough police (4 needed)", 2)
                end
            end
        else
            TriggerEvent('DoLongHudText', "The security lock is active, opening the door is currently not possible.", 2)
        end
    end	
end)

RegisterNetEvent("pacific:success:hack", function()
    TriggerEvent('DoLongHudText', "Success!", 1)
    TriggerEvent('ARP-dispatch:pacific', -1)
    TriggerServerEvent("ARP-doors:changeLock-status", 189, false)
    DeleteObject(laptop)
end)

RegisterNetEvent("pacific:fail:hack", function()
    TriggerServerEvent("inventory:deg:item", "redlaptop")
    TriggerEvent('DoLongHudText', "Failed", 2)
    DeleteObject(laptop)
end)

RegisterNetEvent("isRobberyActive", function(pBusy)
    isBusy = pBusy
end)

RegisterNetEvent('ARP-robbery:UseBankCardC')
AddEventHandler('ARP-robbery:UseBankCardC', function()
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    local dist = GetDistanceBetweenCoords(pos, Config.BigBanks["pacific"]["coords"][3]["x"], Config.BigBanks["pacific"]["coords"][3]["y"], Config.BigBanks["pacific"]["coords"][3]["z"])
	if dist < 1.5 then
        TriggerServerEvent("isRobberyActive")
            if not isBusy then
                local dist = GetDistanceBetweenCoords(pos, Config.BigBanks["pacific"]["coords"][3]["x"], Config.BigBanks["pacific"]["coords"][3]["y"], Config.BigBanks["pacific"]["coords"][3]["z"])
                if dist < 1.5 then
                    local police = exports["police"]:CountPolice()
                    if police >= 4 then
                        if not Config.BigBanks["pacific"]["isOpened"] then 
                            if exports['ARP-inventory']:hasEnoughOfItem('goldlaptop', 1) and exports['ARP-inventory']:hasEnoughOfItem('gcadrive', 1) then
                            StartHeistPacific2()
                            local card = exports["ARP-taskbar"]:taskBar(9000,"Hooking up equipment")
                            if card == 100 then
                                TriggerEvent('inventory:removeItem', 'gcadrive', 1)	
                                TriggerEvent("client:newStress",true,200)
                                exports['ARP-hacking']:OpenHackingGame(function(Success)
                                    if Success then
                                        TriggerEvent("pacific:success:hack2")
                                    else
                                        TriggerEvent("pacific:fail:hack2")
                                    end
                                end)
                            end  
                        else
                            TriggerEvent("DoLongHudText", "You're missing stuff...", 2)
                        end
                        else
                            TriggerEvent('DoLongHudText', "Looks like the bank is already open.", 2)
                        end
                    else
                        TriggerEvent('DoLongHudText', "Not enough police (4 needed)", 2)
                    end
                else
                    TriggerEvent('DoLongHudText', "The security lock is active, opening the door is currently not possible.", 2)
                end
            end
		
    end 
end)

RegisterNetEvent("pacific:success:hack2", function()
    TriggerEvent('DoLongHudText', "Success!", 1)
    TriggerEvent('ARP-dispatch:pacific', -1)
    TriggerServerEvent('ARP-robbery:server:setBankState', "pacific", true)
    DeleteObject(laptop)
end)

RegisterNetEvent("pacific:fail:hack2", function()
    TriggerServerEvent("inventory:deg:item", "hacklaptop")
    TriggerEvent('DoLongHudText', "Failed", 2)
    DeleteObject(laptop)
end)

function StartHeistPacific()
    local ply = PlayerPedId()
    local plyCoords = GetEntityCoords(ply)
    pos = GetEntityCoords(ply)
    ClearPedTasksImmediately(ply)
    Wait(0)
    TaskGoStraightToCoord(ply, pos.x, pos.y, pos.z-0.9, 2.0, -1, 0.0)
    loadDicts()
    Wait(0)
    while GetIsTaskActive(ply, 35) do
        Wait(0)
    end
    ClearPedTasksImmediately(ply)
    Wait(0)
    SetEntityHeading(ply, 235.99516296387)
    Wait(0)
    TaskPlayAnimAdvanced(ply, "anim@heists@ornate_bank@hack", "hack_enter",pos.x, pos.y, pos.z -0.9, 0, 0, 0, 1.0, 0.0, 8300, 0, 0.3, false, false, false)
    Wait(0)
    SetEntityHeading(ply, 235.99516296387)
    while IsEntityPlayingAnim(ply, "anim@heists@ornate_bank@hack", "hack_enter", 3) do
        Wait(0)
    end
    laptop = CreateObject(`hei_prop_hst_laptop`, GetOffsetFromEntityInWorldCoords(ply, 0.2, 0.6, 0.0), 1, 1, 0)
    Wait(0)
    SetEntityRotation(laptop, GetEntityRotation(ply, 2), 2, true)
    PlaceObjectOnGroundProperly(laptop)
    Wait(0)
    TaskPlayAnim(ply, "anim@heists@ornate_bank@hack", "hack_loop", 1.0, 0.0, -1, 1, 0, false, false, false)
end

function StartHeistPacific2()
    local ply = PlayerPedId()
    local plyCoords = GetEntityCoords(ply)
    pos = GetEntityCoords(ply)
    ClearPedTasksImmediately(ply)
    Wait(0)
    TaskGoStraightToCoord(ply, pos.x, pos.y, pos.z-0.9, 2.0, -1, 0.0)
    loadDicts()
    Wait(0)
    while GetIsTaskActive(ply, 35) do
        Wait(0)
    end
    ClearPedTasksImmediately(ply)
    Wait(0)
    SetEntityHeading(ply, 65.774612426758)
    Wait(0)
    TaskPlayAnimAdvanced(ply, "anim@heists@ornate_bank@hack", "hack_enter",pos.x, pos.y, pos.z -0.9, 0, 0, 0, 1.0, 0.0, 8300, 0, 0.3, false, false, false)
    Wait(0)
    SetEntityHeading(ply, 65.774612426758)
    while IsEntityPlayingAnim(ply, "anim@heists@ornate_bank@hack", "hack_enter", 3) do
        Wait(0)
    end
    laptop = CreateObject(`hei_prop_hst_laptop`, GetOffsetFromEntityInWorldCoords(ply, 0.2, 0.6, 0.0), 1, 1, 0)
    Wait(0)
    SetEntityRotation(laptop, GetEntityRotation(ply, 2), 2, true)
    PlaceObjectOnGroundProperly(laptop)
    Wait(0)
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

function OpenPacificDoor()
    local object = GetClosestObjectOfType(Config.BigBanks["pacific"]["coords"][4]["x"], Config.BigBanks["pacific"]["coords"][4]["y"], Config.BigBanks["pacific"]["coords"][4]["z"], 20.0, Config.BigBanks["pacific"]["object"], false, false, false)
    local timeOut = 10
    local entHeading = Config.BigBanks["pacific"]["heading"].closed

    if object ~= 0 then
        Citizen.CreateThread(function()
            while true do

                if entHeading > Config.BigBanks["pacific"]["heading"].open then
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
