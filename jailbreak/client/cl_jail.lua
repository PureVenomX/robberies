-- cells
local inmate = 0

relogging = false
cellcoords = {
	[1] =  { ['x'] = 1767.51,['y'] = 2501.11,['z'] = 45.74,['h'] = 204.71, ['info'] = ' cell1' },
	[2] =  { ['x'] = 1764.36,['y'] = 2499.36,['z'] = 45.74,['h'] = 207.85, ['info'] = ' cell2' },
	[3] =  { ['x'] = 1761.36,['y'] = 2497.51,['z'] = 45.74,['h'] = 207.15, ['info'] = ' cell3' },
	[4] =  { ['x'] = 1754.86,['y'] = 2493.84,['z'] = 45.74,['h'] = 205.74, ['info'] = ' cell4' },
	[5] =  { ['x'] = 1751.80,['y'] = 2492.15,['z'] = 45.74,['h'] = 206.55, ['info'] = ' cell5' },
	[6] =  { ['x'] = 1748.64,['y'] = 2490.20,['z'] = 45.74,['h'] = 206.33, ['info'] = ' cell6' },
	[7] =  { ['x'] = 1767.41,['y'] = 2501.24,['z'] = 49.69,['h'] = 207.21, ['info'] = ' cell7' },
	[8] =  { ['x'] = 1764.36,['y'] = 2499.36,['z'] = 49.69,['h'] = 208.36, ['info'] = ' cell8' },
	[9] =  { ['x'] = 1761.12,['y'] = 2497.48,['z'] = 49.69,['h'] = 206.73, ['info'] = ' cell9' },
	[10] =  { ['x'] = 1757.91,['y'] = 2495.86,['z'] = 49.69,['h'] = 206.64, ['info'] = ' cell10' },
	[11] =  { ['x'] = 1754.99,['y'] = 2493.45,['z'] = 49.69,['h'] = 208.24, ['info'] = ' cell11' },
	[12] =  { ['x'] = 1751.80,['y'] = 2491.96,['z'] = 49.69,['h'] = 206.15, ['info'] = ' cell12' },
	[13] =  { ['x'] = 1748.56,['y'] = 2490.29,['z'] = 49.69,['h'] = 208.05, ['info'] = ' cell13' },
	[14] =  { ['x'] = 1758.39,['y'] = 2472.74,['z'] = 45.74,['h'] = 23.78, ['info'] = ' cell14' },
	[15] =  { ['x'] = 1761.93,['y'] = 2474.47,['z'] = 45.74,['h'] = 30.24, ['info'] = ' cell15' },
	[16] =  { ['x'] = 1764.69,['y'] = 2476.38,['z'] = 45.74,['h'] = 24.76, ['info'] = ' cell16' },
	[17] =  { ['x'] = 1767.89,['y'] = 2478.00,['z'] = 45.74,['h'] = 25.67, ['info'] = ' cell17' },
	[18] =  { ['x'] = 1771.33,['y'] = 2479.21,['z'] = 45.74,['h'] = 28.29, ['info'] = ' cell18' },
	[19] =  { ['x'] = 1774.02,['y'] = 2481.92,['z'] = 45.74,['h'] = 26.00, ['info'] = ' cell19' },
	[20] =  { ['x'] = 1777.48,['y'] = 2483.28,['z'] = 45.74,['h'] = 29.45, ['info'] = ' cell20' },
    [21] =  { ['x'] = 1758.37,['y'] = 2472.39,['z'] = 49.69,['h'] = 24.41, ['info'] = ' cell21' },
	[22] =  { ['x'] = 1761.51,['y'] = 2474.34,['z'] = 49.69,['h'] = 25.00, ['info'] = ' cell22' },
	[23] =  { ['x'] = 1764.59,['y'] = 2476.47,['z'] = 49.69,['h'] = 23.82, ['info'] = ' cell23' },
	[24] =  { ['x'] = 1767.82,['y'] = 2478.02,['z'] = 49.69,['h'] = 24.80, ['info'] = ' cell24' },
	[25] =  { ['x'] = 1770.96,['y'] = 2479.93,['z'] = 49.69,['h'] = 23.98, ['info'] = ' cell25' },
	[26] =  { ['x'] = 1774.02,['y'] = 2481.83,['z'] = 49.69,['h'] = 28.32, ['info'] = ' cell26' },
	[27] =  { ['x'] = 1777.33,['y'] = 2483.65,['z'] = 49.69,['h'] = 26.54, ['info'] = ' cell27' },
    }

-- repair weld

repaircoords = {
    [1] = { ["x"] = 1753.8284912109, ["y"] = 2504.8176269531, ["z"] = 45.564975738525},
    [2] = { ["x"] = 1718.6436767578, ["y"] = 2502.1604003906, ["z"] = 45.564846038818},
    [3] = { ["x"] = 1631.4572753906, ["y"] = 2492.0971679688, ["z"] = 45.56485748291},
    [4] = { ["x"] = 1629.6904296875, ["y"] = 2526.970703125, ["z"] = 45.56485748291},
    [5] = { ["x"] = 1609.3913574219, ["y"] = 2566.1154785156, ["z"] = 45.56485748291},
    [6] = { ["x"] = 1628.7711181641, ["y"] = 2563.4670410156, ["z"] = 45.56485748291},
    [7] = { ["x"] = 1635.0708007813, ["y"] = 2556.4716796875, ["z"] = 45.56485748291},
    [8] = { ["x"] = 1651.6926269531, ["y"] = 2563.5822753906, ["z"] = 45.56485748291},
    [9] = { ["x"] = 1683.7580566406, ["y"] = 2554.1909179688, ["z"] = 45.564846038818},
    [10] = { ["x"] = 1718.64453125, ["y"] = 2528.6357421875, ["z"] = 45.564849853516},
    [11] = { ["x"] = 1686.2364501953, ["y"] = 2533.1533203125, ["z"] = 45.564861297607},
    [12] = { ["x"] = 1705.2362060547, ["y"] = 2482.1740722656, ["z"] = 45.564918518066}
}



eatenRecently = false
cleanedRecently = false
repairedRecently = false
local mycell = 1

cleancoords = {
-- dirty trays
    [1] =  { ['x'] = 1789.07,['y'] = 2550.47,['z'] = 45.68 },
    [2] =  { ['x'] = 1789.28,['y'] = 2545.07,['z'] = 45.68 },
    [3] =  { ['x'] = 1784.35,['y'] = 2545.45,['z'] = 45.68 },
    [4] =  { ['x'] = 1778.94,['y'] = 2545.58,['z'] = 45.68 },
    [5] =  { ['x'] = 1779.43,['y'] = 2548.09,['z'] = 45.68 },
    [6] =  { ['x'] = 1777.72,['y'] = 2554.5,['z'] = 45.68 },
    [7] =  { ['x'] = 1786.38,['y'] = 2565.15,['z'] = 45.68 },
    [8] =  { ['x'] = 1783.28,['y'] = 2564.0,['z'] = 45.68 },
    [9] =  { ['x'] = 1778.37,['y'] = 2565.08,['z'] = 45.68 },
    [10] =  { ['x'] = 1777.75,['y'] = 2560.08,['z'] = 45.68 },
    [11] =  { ['x'] = 1786.38,['y'] = 2560.39,['z'] = 45.68 },
}

foodTrays = {
    [1] = "prop_food_cb_tray_01",
    [2] = "prop_food_cb_tray_02",
    [3] = "prop_food_cb_tray_03",
    [4] = "prop_food_cb_tray_04",
    [5] = "prop_food_cb_tray_05",
    [6] = "prop_food_cb_tray_06",
    [7] = "prop_food_bs_tray_01",
    [8] = "prop_food_bs_tray_02",
    [9] = "prop_food_bs_tray_03",
    [10] = "prop_food_bs_tray_04",
    [11] = "prop_food_bs_tray_05",
    [12] = "prop_food_bs_tray_06",
    [13] = "prop_food_tray_01",
    [14] = "prop_food_tray_02",
    [15] = "prop_food_tray_03",
    [16] = "prop_food_tray_04",
    [17] = "prop_food_tray_05",
    [18] = "prop_food_tray_06"
}

eatTask = {
    ["x"] = 1783.91,
    ["y"] = 2545.77,
    ["z"] = 45.6
}

finishCleanTask = {
    ["x"] = 1782.98,
    ["y"] = 2560.88,
    ["z"] = 45.67
}

function deleteClosestTray()
--foodTrays

    local closestDist = 9999.9
    local ped = PlayerPedId()
    local closesttray
    local obj
    local curDist
    for i=1,#foodTrays do
        obj = GetClosestObjectOfType(GetEntityCoords(ped).x, GetEntityCoords(ped).y, GetEntityCoords(ped).z, 3.0, GetHashKey(foodTrays[i]), false, true ,true)
        curDist = #(GetEntityCoords(PlayerPedId(), 0) - GetEntityCoords(obj))
        if curDist < closestDist then
            closestDist = curDist
            closesttray = obj
        
        end
    end
    SetEntityVisible(closesttray, false)
 
end


imjailed = false
curTaskType = "None"
jobProcess = false
lockdown = false

secondOfDay = 19801
RegisterNetEvent('kTimeSync')
AddEventHandler("kTimeSync", function( data )
    secondOfDay = data
end)


RegisterNetEvent("jailbreak:reclaimitems")
AddEventHandler("jailbreak:reclaimitems", function()
    TriggerServerEvent("server-jail-item", 'ply-'..exports["ARP_manager"]:isPed("cid"), false)
    TriggerEvent("DoLongHudText", "You have re-claimed your possessions.")
end)

Citizen.CreateThread(function()
    while true do
        playerCoords = GetEntityCoords(PlayerPedId())
        Citizen.Wait(1000)
    end
end)


function drink()
    ClearPedSecondaryTask(PlayerPedId())
    loadAnimDict( "mp_player_intdrink" ) 

    TaskPlayAnim( PlayerPedId(), "mp_player_intdrink", "loop_bottle", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
    Citizen.Wait(5000)

    endanimation()
end

function endanimation()
    ClearPedSecondaryTask(PlayerPedId())
end

function loadAnimDict( dict )
    while ( not HasAnimDictLoaded( dict ) ) do
        RequestAnimDict( dict )
        Citizen.Wait( 5 )
    end
end



-- function DisplayHelpText(str)
--     SetTextComponentFormat("STRING")
--     AddTextComponentString(str)
--     DisplayHelpTextFromStringLabel(0, 0, 1, -1)
-- end

-- function drawTxt(x,y ,width,height,scale, text, r,g,b,a, outline)
--     SetTextFont(0)
--     SetTextProportional(0)
--     SetTextScale(scale, scale)
--     SetTextColour(r, g, b, a)
--     SetTextDropShadow(0, 0, 0, 0,255)
--     SetTextEdge(1, 0, 0, 0, 255)
--     SetTextDropShadow()
--     if(outline)then
--         SetTextOutline()
--     end
--     SetTextEntry("STRING")
--     AddTextComponentString(text)
--     DrawText(x - width/2, y - height/2 + 0.005)
-- end


Controlkey = {["generalUse"] = {38,"E"},["generalUseThird"] = {47,"G"} ,["housingMain"] = {74,"H"}} 
RegisterNetEvent('event:control:update')
AddEventHandler('event:control:update', function(table)
    Controlkey["generalUse"] = table["generalUse"]
    Controlkey["generalUseThird"] = table["generalUseThird"]
    Controlkey["housingMain"] = table["housingMain"]
end)

--------------------------------------
----- Below related To JailBreak -----
--------------------------------------
local jailbreak = false


local smokeTable = {}
local prisonerTable = {}
local copTable = {}

local smokeLocations = {
    {1709.9931640625,2691.6640625,45.572238922119},
    {1715.095703125,2688.6574707031,45.571224212646},
    {1703.8051757813,2689.1862792969,45.571407318115},
    {1721.8214111328,2685.5402832031,45.56489944458},
    {1697.8100585938,2683.208984375,45.564933776855},

    {1662.4675292969,2669.0375976563,45.564895629883},
    {1656.9019775391,2668.3435058594,45.564895629883},
    {1652.5489501953,2665.0114746094,45.564895629883},
    {1650.9392089844,2659.8876953125,45.564926147461},
    {1650.7983398438,2653.5249023438,45.564926147461},

    {1758.0987548828,2673.1220703125,45.564872741699},
    {1765.3293457031,2673.1318359375,45.564872741699},
    {1770.9254150391,2670.3132324219,45.564872741699},
    {1774.1247558594,2665.9516601563,45.564872741699},
    {1776.4498291016,2661.21875,45.564872741699},

    {1754.9405517578,2651.4887695313,45.564918518066},
    {1759.7680664063,2649.8244628906,45.584705352783},
    {1768.2872314453,2649.865234375,45.581718444824},
    {1718.4710693359,2649.6398925781,45.564933776855},
    {1714.5267333984,2625.9748535156,45.564888000488},
    {1708.4614257813,2624.4741210938,45.564888000488},

}

local SpawnLocations = {
    [1] = {["name"] = "prisoner", ["pos"] = {1776.3377685547,2666.0100097656,45.564937591553}},
    [2] = {["name"] = "prisoner", ["pos"] = {1772.5654296875,2675.6342773438,45.564918518066}},
    [3] = {["name"] = "prisoner", ["pos"] = {1762.251953125,2676.0573730469,45.564918518066}},
    [4] = {["name"] = "prisoner", ["pos"] = {1719.8916015625,2686.947265625,45.565704345703}},
    [5] = {["name"] = "prisoner", ["pos"] = {1711.4210205078,2693.9387207031,45.583290100098}},
    [6] = {["name"] = "prisoner", ["pos"] = {1701.1168212891,2687.2568359375,45.564990997314}},
    [7] = {["name"] = "prisoner", ["pos"] = {1663.0439453125,2671.5556640625,45.602420806885}},
    [8] = {["name"] = "prisoner", ["pos"] = {1652.5731201172,2667.578125,45.564937591553}},
    [9] = {["name"] = "prisoner", ["pos"] = {1651.0554199219,2656.02734375,45.564937591553}},

    [10] = {["name"] = "cop", ["pos"] = {1690.3841552734,2623.3342285156,45.564903259277}},
    [11] = {["name"] = "cop", ["pos"] = {1711.5394287109,2622.4599609375,45.564895629883}},
    [12] = {["name"] = "cop", ["pos"] = {1719.8424072266,2623.2243652344,45.564895629883}},
    [13] = {["name"] = "cop", ["pos"] = {1770.4345703125,2646.404296875,45.564914703369}},
    [14] = {["name"] = "cop", ["pos"] = {1753.9340820313,2649.5444335938,45.564918518066}},
}

local models = {
    ["prisoner"] = "S_M_Y_Prisoner_01",
    ["cop"] = "S_M_Y_Cop_01",
}


local missionState = {
    ["prisoner"] = "MISSION5",
    ["cop"] = "COP"
}

randomWeapon = {
[1] = "WEAPON_UNARMED",
[2] = "WEAPON_KNIFE",
[3] = "WEAPON_NIGHTSTICK",
[4] = "WEAPON_HAMMER",
[5] = "WEAPON_BAT",
[6] = "WEAPON_GOLFCLUB",
[7] = "WEAPON_CROWBAR",
[8] = "WEAPON_BOTTLE",
[9] = "WEAPON_DAGGER",
[10] = "WEAPON_KNUCKLE",
[11] = "WEAPON_HATCHET",
[12] = "WEAPON_MACHETE",
[13] = "WEAPON_SWITCHBLADE",
[14] = "WEAPON_REVOLVER",
[15] = "WEAPON_BATTLEAXE",
[16] = "WEAPON_POOLCUE",
[17] = "WEAPON_WRENCH"
}

randomWeaponCop = {
[1] = "WEAPON_PISTOL",
[2] = "WEAPON_COMBATPISTOL",
[3] = "WEAPON_APPISTOL",
[4] = "WEAPON_ASSAULTSMG",
[5] = "WEAPON_CARBINERIFLE",
[6] = "WEAPON_MG",
[7] = "WEAPON_PUMPSHOTGUN",
[8] = "WEAPON_ASSAULTSHOTGUN",
[9] = "WEAPON_STUNGUN",
[10] = "WEAPON_SNSPISTOL",
[11] = "WEAPON_SPECIALCARBINE",
[12] = "WEAPON_MARKSMANRIFLE"
}


RegisterNetEvent('ai:removePeds')
AddEventHandler('ai:removePeds', function(cops,prisoners)
   for i,v in ipairs(cops) do
        local ped = NetworkGetEntityFromNetworkId(v)

        DeletePed(ped)
   end
   for i,v in ipairs(prisoners) do
        local ped = NetworkGetEntityFromNetworkId(v)

        DeletePed(ped)
   end  
end)

RegisterNetEvent('ai:isJailBreak')
AddEventHandler('ai:isJailBreak', function()
    TriggerEvent("chatMessage", "DOC | Goverment | " , { 255, 0, 0 }, "There is currently a jailbreak at bolingbroke , stay clear of the area or you may end up arrested or shot.")
    imjailed = false
    jailbreak = true
    runEscape()
    Wait(140000)
    jailbreak = false
end)

function runEscape()
    Citizen.CreateThread(function()
      local timer = 0
      local teleported = false
      while jailbreak do 
        Wait(1)

          DrawMarkerRad(27,1643.5603027344,2585.4670410156,44.764853668213, 0, 0, 0, 0, 0, 0, 1.01, 1.01, 0.3, 255, 255, 0, 60, 0, 0, 2, 0, 0, 0, 0)
          DrawMarkerRad(27,1636.2059326172,2565.4235839844,44.76485748291, 0, 0, 0, 0, 0, 0, 1.01, 1.01, 0.3, 255, 255, 0, 60, 0, 0, 2, 0, 0, 0, 0)
          if #(vector3(1643.5603027344,2585.4670410156,45.564853668213) - GetEntityCoords(PlayerPedId())) < 1 then
            exports["ARP-core"]:getModule("Util"):MissionText("Enter Court Yard", 500)
            if not teleported then
              teleported = true
              SetEntityCoords(PlayerPedId(),1636.2059326172,2565.4235839844,45.56485748291)
            end
          elseif #(vector3(1636.2059326172,2565.4235839844,45.56485748291) - GetEntityCoords(PlayerPedId())) < 1 then
            exports["ARP-core"]:getModule("Util"):MissionText("Exit Court Yard", 500)
            if not teleported then
              teleported = true
              SetEntityCoords(PlayerPedId(),1643.5603027344,2585.4670410156,45.564853668213)
            end
          end


        if teleported then 
          timer = timer + 1 
          if timer > 900 then
            teleported = false
            timer = 0
          end
        end
      end
    end)
end

function DrawMarkerRad(markerType,x,y,z,arg1,arg2,arg3,arg4,arg5,arg6,sx,sy,sz,r,g,b,a,upDown,face,p19,rotate,texture,textureName,drawEnts)
    local dist = #(vector3(x,y,z) - GetEntityCoords(PlayerPedId()))
    if dist < 40 then
      local dist = math.floor(a - (dist * 10))
      if dist < 0 then dist = 0 end
      DrawMarker(markerType,x,y,z,arg1,arg2,arg3,arg4,arg5,arg6,sx,sy,sz,r,g,b,dist,upDown,face,p19,rotate,texture,textureName,drawEnts)
    end
end

RegisterNetEvent('ai:prisonBreak')
AddEventHandler('ai:prisonBreak', function()

    local rnd = math.random(1,99999)
    for i,v in ipairs(smokeLocations) do
        TriggerServerEvent("particle:StartParticleAtLocation",v[1],v[2],v[3],"smoke",rnd,0.0, 0.0, 0.0)
    end
    
    Wait(2000)
    spawnJailbreak("prisoner")
    TriggerServerEvent("ai:updatePrisoners",prisonerTable)
    spawnJailbreak("cop")
    TriggerServerEvent("ai:updateCops",copTable)
    TriggerEvent("particle:StopParticleClient",rnd)
end)
local hasMoved = false
RegisterNetEvent('jail:lockdown')
AddEventHandler('jail:lockdown', function(lockdownState)
    lockdown = lockdownState
    if lockdown and imjailed and not hasMoved then
        mycell = math.random(1,20)
        mycell = math.ceil(mycell)
        SetEntityCoords(PlayerPedId(), cellcoords[mycell].x,cellcoords[mycell].y,cellcoords[mycell].z) 
        TriggerEvent("chatMessage", "DOC | " , { 33, 118, 255 }, "You have been placed into lockdown due to a disturbance.")
        hasMoved = true
    elseif not lockdown and imjailed then
        hasMoved = false
        TriggerEvent("chatMessage", "DOC | " , { 33, 118, 255 }, "Lockdown has ended.")
    end
end)



function spawnJailbreak(spawnType)
    for i,v in pairs(SpawnLocations) do

        if v.name == spawnType then
            local max = 5
            if spawnType == prisoner then max = 6 end
            local amount = math.random(1,max)
            local model = models[spawnType]

             while not HasModelLoaded(model) do
                RequestModel(model)
                Wait(20)
            end
            for k=1,amount do
                Wait(200)

                local x = math.random(1,5)
                local ped = CreatePed(4, model, v.pos[1]+x,v.pos[2],v.pos[3], -1, true, false)
                DecorSetBool(ped, 'ScriptedPed', true)
                SetPedRelationshipGroupDefaultHash(ped,GetHashKey(missionState[spawnType]))
                SetPedRelationshipGroupHash(ped,GetHashKey(missionState[spawnType]))
                SetPedRandomComponentVariation(ped,false)
                SetPedDropsWeaponsWhenDead(ped,false)

                if spawnType == "cop" then
                    
                    SetPedAsCop(ped,true)
                    SetCanAttackFriendly(ped,false,true)

                    local rnd = math.random(1,16)
                    GiveWeaponToPed(ped,GetHashKey(randomWeaponCop[rnd]),300,false,true)
                    SetCurrentPedWeapon(ped,GetHashKey(randomWeaponCop[rnd]),true)
                    netid = NetworkGetNetworkIdFromEntity(ped)

                    copTable[#copTable+1]=netid
                else
                    SetPedFleeAttributes(ped,0,0)
                    SetPedCombatAttributes(ped,46,1)
                    SetPedCombatRange(ped,10)

                    local rnd = math.random(1,17)
                    GiveWeaponToPed(ped,GetHashKey(randomWeapon[rnd]),300,false,true)
                    SetCurrentPedWeapon(ped,GetHashKey(randomWeapon[rnd]),true)
                    netid = NetworkGetNetworkIdFromEntity(ped)

                    prisonerTable[#prisonerTable+1]=netid
                end
            end
        end
    end
end

--------------------------------------
----- Above related To JailBreak -----
--------------------------------------


RegisterNetEvent('beginJail2')
AddEventHandler('beginJail2', function(time,skipintake)
    TriggerEvent("beginJail",skipintake,tonumber(time))
end)

--{1696.5463867188,2577.4409179688,-69.394134521484},

function JailIntro(name, years, cid, date, location)
local paletoMugPos = vector3(-446.55, 6008.41, 24.73)
local mrpdMugPos = vector3(473.02282714844,-1011.612121582,26.2 - 0.7)
local sandyMugPos = vector3(1813.4407958984, 3663.7683105469, 34.189254760742)
    if tonumber(years) > 40 then
        local cid = exports["ARP_manager"]:isPed("cid")
        TriggerServerEvent("shops:jail:remove",cid)
    end
    DoScreenFadeOut(10)
    FreezeEntityPosition(PlayerPedId(), true)
    TriggerEvent('InteractSound_CL:PlayOnOne', 'handcuff', 1.0)

    
    TriggerEvent("police:remmaskAccepted")
    TriggerServerEvent("request:vinewooddel")
    Citizen.Wait(1000)

    local timer = 0
    while timer ~= -1 do
        timer = timer + 1
        Citizen.Wait(1)
        if location == "PALETO" or location == "PALFOR" then
            if IsInteriorReady(GetInteriorAtCoords(paletoMugPos.x, paletoMugPos.y, paletoMugPos.z)) or timer > 1000 then
                timer = -1
            end
        elseif location == "SKID" then
            if IsInteriorReady(GetInteriorAtCoords(mrpdMugPos.x, mrpdMugPos.y, mrpdMugPos.z)) or timer > 1000 then
                timer = -1
            end
        elseif location == "SANDY" then
            if IsInteriorReady(GetInteriorAtCoords(sandyMugPos.x, sandyMugPos.y, sandyMugPos.z)) or timer > 1000 then
                timer = -1
            end
        else
            if IsInteriorReady(GetInteriorAtCoords(mrpdMugPos.x, mrpdMugPos.y, mrpdMugPos.z)) or timer > 1000 then
                timer = -1
            end
        end
    end

    if location == "PALETO" or location == "PALFOR" then
        SetEntityCoords(PlayerPedId(), -446.55, 6008.41, 24.73 - 0.7)
        SetEntityHeading(PlayerPedId(), 45.95875549316)
    elseif location == "SKID" then
        SetEntityCoords(PlayerPedId(), 473.02282714844, -1011.612121582, 26.2 - 0.7)
        SetEntityHeading(PlayerPedId(), 179.95875549316)
    elseif location == "SANDY" then
        SetEntityCoords(PlayerPedId(), sandyMugPos.x, sandyMugPos.y, sandyMugPos.z - 0.7)
        SetEntityHeading(PlayerPedId(), 297.43383789063)
    else
        SetEntityCoords(PlayerPedId(), 1813.4407958984, 3663.7683105469, 34.189254760742 -0.7)
        SetEntityHeading(PlayerPedId(), 179.95875549316)
    end

    --SetEntityCoords(PlayerPedId(),473.02282714844,-1011.612121582,26.2 - 0.7)
    Citizen.Wait(1500) 
    DoScreenFadeIn(500)
    TriggerEvent("attachItemCONLOL","con1",name,years,cid,date)
    TriggerEvent('InteractSound_CL:PlayOnOne', 'photo', 0.4)
    Citizen.Wait(3000) 
    TriggerEvent('InteractSound_CL:PlayOnOne', 'photo', 0.4)
    Citizen.Wait(3000)     
    SetEntityHeading(PlayerPedId(), 272.93203735352) -- TODO Update for paleto

    TriggerEvent('InteractSound_CL:PlayOnOne', 'photo', 0.4)
    Citizen.Wait(3000)  
    TriggerEvent('InteractSound_CL:PlayOnOne', 'photo', 0.4)
    Citizen.Wait(3000)         
    SetEntityHeading(PlayerPedId(), 93.155914306641) -- TODO Update for paleto


    TriggerEvent('InteractSound_CL:PlayOnOne', 'photo', 0.4)
    Citizen.Wait(3000) 
     TriggerEvent('InteractSound_CL:PlayOnOne', 'photo', 0.4)
    Citizen.Wait(3000)       

    SetEntityHeading(PlayerPedId(),186.22499084473) -- TODO Update for paleto

    Citizen.Wait(2000)
    DoScreenFadeOut(1100)   
    Citizen.Wait(2000)
    TriggerEvent('InteractSound_CL:PlayOnOne', 'jaildoor', 1.0)

end
DoScreenFadeIn(1500)
SwappingCharacters = false
outofrange = false
minutes = 0
function GroupRank(groupid)
  local rank = 0
  local mypasses = exports["ARP_manager"]:isPed("passes")
  for i=1, #mypasses do
    if mypasses[i]["pass_type"] == groupid then

      rank = mypasses[i]["rank"]
    end 
  end
  return rank
end

function RoleplayStats()

    local totalroleplay = 0

    if exports["ARP-inventory"]:hasEnoughOfItem("shitlockpick",1,false) then
        totalroleplay = totalroleplay + 10
    end

    if exports["ARP-inventory"]:hasEnoughOfItem("jailfood",1,false) then
        totalroleplay = totalroleplay + 10
    end

    if exports["ARP-inventory"]:hasEnoughOfItem("methbag",1,false) then
        totalroleplay = totalroleplay + 15
    end

    if exports["ARP-inventory"]:hasEnoughOfItem("assphone",1,false) then
        totalroleplay = totalroleplay + 15
        if math.random(10) < 3 then
             TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 3.0, 'pager', 0.4)
        end
    end

    if exports["ARP-inventory"]:hasEnoughOfItem("slushy",1,false) then
        totalroleplay = totalroleplay + 10
    end

    if math.random(70) < totalroleplay then
        TriggerEvent("DoLongHudText","All that roleplay adds up!")
        Wait(1000)
        TriggerServerEvent("jail:cuttime")
    end

end

function InmateHasAll()
    if exports["ARP-inventory"]:hasEnoughOfItem("slushy",1,false)
        and
        exports["ARP-inventory"]:hasEnoughOfItem("-1810795771",1,false)
        and
        exports["ARP-inventory"]:hasEnoughOfItem("methbag",1,false)
        and
        exports["ARP-inventory"]:hasEnoughOfItem("assphone",1,false)
        and
        exports["ARP-inventory"]:hasEnoughOfItem("slushy",1,false)
    then
        return true
    else
        return false
    end
end

function InmateAnim()
    if ( DoesEntityExist( inmate ) and not IsEntityDead( inmate ) ) then 
        loadAnimDict( "random@mugging4" )
        TaskPlayAnim( inmate, "random@mugging4", "agitated_loop_a", 8.0, 1.0, -1, 16, 0, 0, 0, 0 )
    end
end

function InmateDelete()
    if DoesEntityExist(inmate) then 
        SetPedAsNoLongerNeeded(inmate)
        DeletePed(inmate)
    end
end

function InmateCreate()
    local hashKey = -1313105063
    local pedType = 5
    RequestModel(hashKey)
    while not HasModelLoaded(hashKey) do
        RequestModel(hashKey)
        Citizen.Wait(100)
    end
    inmate = CreatePed(pedType, hashKey, 1642.08, 2522.16, 45.57, 43.62, false, false)
    DecorSetBool(inmate, 'ScriptedPed', true)
end

function InmatePedSettings()
    DecorSetBool(inmate, 'ScriptedPed', true)
    SetEntityInvincible(inmate,true)
    ClearPedTasks(inmate)
    ClearPedSecondaryTask(inmate)
    TaskSetBlockingOfNonTemporaryEvents(inmate, true)
    SetPedFleeAttributes(inmate, 0, 0)
    SetPedCombatAttributes(inmate, 17, 1)
    SetPedSeeingRange(inmate, 0.0)
    SetPedHearingRange(inmate, 0.0)
    SetPedAlertness(inmate, 0)
    SetPedKeepTask(inmate, true)
end

RegisterNetEvent('beginJail')
AddEventHandler('beginJail', function(skipintake, time, name, cid, date)
    TriggerServerEvent('server-jail-item', 'ply-'..exports["ARP_manager"]:isPed("cid"), true)
    imjailed = false
    local playerPed = PlayerPedId()
    local mycid = exports["ARP_manager"]:isPed("cid")

    local gang = exports["ARP_manager"]:isPed("gang")
    if gang == 4 then
        TriggerServerEvent("wipeweed")
    end    

    TriggerEvent("DensityModifierEnable",false)
    mycell = math.random(1,20)
    minutes = tonumber(time)


    if not skipintake then
        local currentPos = GetEntityCoords(playerPed)
        local location = GetNameOfZone(currentPos)
        JailIntro(name, time, mycid, date, location)
    end
    FreezeEntityPosition(playerPed, false)

    TriggerEvent("shop:createMeth")

    minCalc = 15000

    DoScreenFadeOut(1)
    if mycell == nil then
        mycell = 1
    end
    
    SetEntityCoords(playerPed, cellcoords[mycell].x,cellcoords[mycell].y,cellcoords[mycell].z ) 

    TriggerServerEvent("updateJailTime",minutes)
 
    InmateDelete()
    InmateCreate()
    InmatePedSettings()
    InmateAnim()
    local jailluck = math.random(100)
    if minutes > 60 then
        jailluck = jailluck - math.ceil(minutes/10)
    end


    Citizen.Wait(500)
    TriggerEvent("doors:resetTimer")
    FreezeEntityPosition(playerPed, false)
    DoScreenFadeIn(1500)
    TriggerEvent("falseCuffs")  
    
    imjailed = true
    RemoveAllPedWeapons(playerPed)
    TriggerEvent("attachWeapons")
    TriggerEvent("DoLongHudText", "You have been jailed. You can pick up your shit when you leave.")
    TriggerEvent("inhotel",false)
    jailjoblist()

    while imjailed do
        Citizen.Wait(1)
        if minCalc == 0 then
            playerPed = PlayerPedId()
            minCalc = 15000
            RoleplayStats()
            Citizen.Wait(1000)
            TriggerServerEvent("checkJailTime",false)
        end

        if (#(GetEntityCoords(playerPed) - vector3(cellcoords[mycell].x,cellcoords[mycell].y,cellcoords[mycell].z)) > 340) then
            SetEntityCoords(playerPed, cellcoords[mycell].x,cellcoords[mycell].y,cellcoords[mycell].z) 
        end

        minCalc = minCalc - 1
    end
    if relogging then
        return
    end

    RemoveBlip(Blip)
    TriggerEvent("DensityModifierEnable",true)

end)

function jailjoblist()
    exports["ARP-doors"]:showInteraction("Go look for a guard to start a job!")
    Citizen.Wait(15000)
    exports["ARP-doors"]:hideInteraction()
    Citizen.Wait(1000)
    exports["ARP-doors"]:showInteraction("1st at the cafiteria & 2nd besides by the middle ")
    Citizen.Wait(15000)
    exports["ARP-doors"]:hideInteraction()
end


RegisterNetEvent('swappingCharsLoop')
AddEventHandler('swappingCharsLoop', function()
    TransitionToBlurred(500)
    DoScreenFadeOut(500)
    Citizen.Wait(1000)
    TriggerEvent("ARP-core:clearStates")
    exports["ARP-core"]:getModule("SpawnManager"):Initialize()
    relogging = true
    imjailed = false

    -- trigger character swap
    Wait(4000)
    relogging = false
end)

RegisterNetEvent('TimeRemaining')
AddEventHandler('TimeRemaining', function(TimeRemaining, release)

    local playerPed = PlayerPedId()

    local TimeR = TimeRemaining

    if TimeR <= 0 and release then 
       imjailed = false
        TriggerEvent("DoLongHudText", "You are free!.",1)
        TriggerServerEvent("server:currentpasses")
        SetEntityCoords(playerPed, 1837.36, 2588.35, 46.01)
       
    else

    local minutes = TimeR
    TriggerEvent("chatMessage", "DOC | " , { 33, 118, 255 }, "You have " .. minutes .. " month(s) remaining")
    end
end)

RegisterNetEvent("check:time")
AddEventHandler("check:time", function()
    TriggerServerEvent("checkJailTime",true)
end)

RegisterNetEvent('endJailTime')
AddEventHandler('endJailTime', function()
    imjailed = false
    TriggerEvent("DoLongHudText", "You are free!.",1)
    TriggerServerEvent("server:currentpasses")
    SetEntityCoords(PlayerPedId(), 1837.36, 2588.35, 46.01)
end)

RegisterNetEvent('endJailBreakTime')
AddEventHandler('endJailBreakTime', function()
    imjailed = false
    TriggerEvent("DoLongHudText", "You are free!! Run Now!",1)
    TriggerServerEvent("server:currentpasses")
end)


RegisterNetEvent('beginJail3')
AddEventHandler('beginJail3', function(time)
    TriggerEvent("beginJailMobster",tonumber(time))
end)

RegisterNetEvent('beginJailMobster')
AddEventHandler('beginJailMobster', function(time)
    imjailedmobster = true
    minutes = tonumber(time)
    TriggerEvent("DensityModifierEnable",false)
    minutes = tonumber(minutes) >= 120 and 120 or tonumber(minutes)
    TriggerEvent("DoLongHudText", "You were dumped here.. weird.",1)
    minCalc = 60
    Citizen.Wait(1000)
    SetEntityCoords(PlayerPedId(), 143.79208374023,-2201.6572265625,4.6880202293396) 
    TriggerServerEvent("updateJailTimeMobster",minutes)
    TriggerEvent("falseCuffs")  


        while imjailedmobster do
            Citizen.Wait(1000)
            RemoveAllPedWeapons(PlayerPedId())
            TriggerEvent("attachWeapons")
            if minCalc < 1 then
                
                minCalc = 60
                minutes = minutes - 1
                TriggerEvent("DoLongHudText", "You have " .. minutes .. " minutes remaining",1)
                TriggerServerEvent("updateJailTimeMobster",minutes)
            end

            if (#(GetEntityCoords(PlayerPedId(), 0) - vector3(143.79208374023,-2201.6572265625,4.6880202293396)) > 5) then
                SetEntityCoords(PlayerPedId(), 143.79208374023,-2201.6572265625,4.6880202293396) 
            end

            if minutes < 2 then
                imjailedmobster = false
            end

            minCalc = minCalc - 1
        end

        TriggerServerEvent("updateJailTimeMobster",0)
        TriggerEvent("DoLongHudText", "You were dumped here.. weird.",1)
        SetEntityCoords(PlayerPedId(), 164.2027130127,-1721.9739990234,29.291980743408)

        TriggerEvent("DensityModifierEnable",true)
end)

lifeCellCoords = {
    {-3.5171592235565,-670.67626953125,16.130613327026}, 
    {-5.1028943061829,-676.06817626953,16.130613327026}, 
    {0.22147338092327,-659.54638671875,16.130613327026}, 
    {11.018131256104,-662.85894775391,16.130613327026}, 
    {4.3471856117249,-679.97094726563,16.130613327026}, 
}

selectedCell = 0

RegisterNetEvent('beginJail4')
AddEventHandler('beginJail4', function(imjailedLife)
    TriggerEvent("beginJailLife",imjailedLife)
end)

RegisterNetEvent('beginJailLife')
AddEventHandler('beginJailLife', function(imjailedLife)
    local rnd = math.random(1,5)
    selectedCell = rnd
    TriggerEvent("DensityModifierEnable",false)
    TriggerEvent("DoLongHudText", "You are on Life Sentence.",1)
    Citizen.Wait(1000)
    SetEntityCoords(PlayerPedId(),lifeCellCoords[selectedCell][1],lifeCellCoords[selectedCell][2],lifeCellCoords[selectedCell][3]) 
    TriggerEvent("falseCuffs")  
    DoScreenFadeIn(1500)
    if imjailedLife then
        while imjailedLife do
            Citizen.Wait(1000)
            RemoveAllPedWeapons(PlayerPedId())
            TriggerEvent("attachWeapons")

            if #(GetEntityCoords(PlayerPedId()) - vector3(1.8283240795135,-672.43591308594,16.130613327026)) > 100 then
                SetEntityCoords(PlayerPedId(), lifeCellCoords[selectedCell][1],lifeCellCoords[selectedCell][2],lifeCellCoords[selectedCell][3]) 
            end

            if selectedCell == 0 then break end
        end
    else
        selectedCell = 0
    end

    TriggerEvent("DoLongHudText", "You were removed from High Sec.",1)
    SetEntityCoords(PlayerPedId(), -1.1144685745239,-679.89410400391,16.130630493164)

    TriggerEvent("DensityModifierEnable",true)
end)
--Jial Cleaner--
Table, Table2, Table3, Table4, Table5, Table6, Table7, Table8, Finish = false,false,false,false,false,false,false,false,false

RegisterNetEvent("Start:clean:jail", function()
    if imjailed then 

        Table = true
        TriggerEvent("DoLongHudText", "Start Cleaning The Tables", 1)
    else 
        TriggerEvent("DoLongHudText", "You are not a prisoner", 2)
    end
end)
local function LoadDict(dict)
    RequestAnimDict(dict)
	while not HasAnimDictLoaded(dict) do
	  	Citizen.Wait(10)
    end
end

RegisterNetEvent("clean:jail", function()
    if Table then
        local ply = PlayerPedId()
        local plyCoords = GetEntityCoords(ply)
        local dict = 'timetable@maid@cleaning_surface@base'
        LoadDict(dict)
        FreezeEntityPosition(PlayerPedId(),true)
        TaskPlayAnim(PlayerPedId(), dict, "base", 3.0, -8, -1, 63, 0, 0, 0, 0 )
        TriggerEvent("attachItem", "cleaningspray")
        local finished = exports['ARP-taskbar']:taskBar(5000, 'Cleaning Table')
        if (finished == 100) then
            FreezeEntityPosition(PlayerPedId(),false)
            ClearPedTasks(PlayerPedId())
            Citizen.Wait(1000)
            Table2 = true
            Table = false
            TriggerEvent("destroyProp")

        else
            FreezeEntityPosition(PlayerPedId(),false)
            TriggerEvent("destroyProp")

        end
        TriggerEvent("destroyProp")

	else
		TriggerEvent("DoLongHudText", "You seemed you skip one table!", 2)
	end
end)

RegisterNetEvent("clean:jail2", function()
    if Table2 then
        local ply = PlayerPedId()
        local plyCoords = GetEntityCoords(ply)
        local dict = 'timetable@maid@cleaning_surface@base'
        LoadDict(dict)
        FreezeEntityPosition(PlayerPedId(),true)
        TaskPlayAnim(PlayerPedId(), dict, "base", 3.0, -8, -1, 63, 0, 0, 0, 0 )
        TriggerEvent("attachItem", "cleaningspray")
        local finished = exports['ARP-taskbar']:taskBar(5000, 'Cleaning Table')
        if (finished == 100) then
            FreezeEntityPosition(PlayerPedId(),false)
            ClearPedTasks(PlayerPedId())
            Citizen.Wait(1000)
            Table3 = true
            Table2 = false
            TriggerEvent("destroyProp")
        else
            FreezeEntityPosition(PlayerPedId(),false)
            TriggerEvent("destroyProp")
        end
        TriggerEvent("destroyProp")
	else
		TriggerEvent("DoLongHudText", "You seemed you skip one table!", 2)
	end

end)

RegisterNetEvent("clean:jail3", function()
    if Table3 then
        local ply = PlayerPedId()
        local plyCoords = GetEntityCoords(ply)
        local dict = 'timetable@maid@cleaning_surface@base'
        LoadDict(dict)
        FreezeEntityPosition(PlayerPedId(),true)
        TaskPlayAnim(PlayerPedId(), dict, "base", 3.0, -8, -1, 63, 0, 0, 0, 0 )
        TriggerEvent("attachItem", "cleaningspray")
        local finished = exports['ARP-taskbar']:taskBar(5000, 'Cleaning Table')
        if (finished == 100) then
            FreezeEntityPosition(PlayerPedId(),false)
            ClearPedTasks(PlayerPedId())
            Citizen.Wait(1000)
            Table4 = true
            Table3 = false
            TriggerEvent("destroyProp")
        else
            FreezeEntityPosition(PlayerPedId(),false)
            TriggerEvent("destroyProp")
        end
        TriggerEvent("destroyProp")
	else
		TriggerEvent("DoLongHudText", "You seemed you skip one table!", 2)
	end
end)

RegisterNetEvent("clean:jail4", function()
    if Table4 then
        local ply = PlayerPedId()
        local plyCoords = GetEntityCoords(ply)
        local dict = 'timetable@maid@cleaning_surface@base'
        LoadDict(dict)
        FreezeEntityPosition(PlayerPedId(),true)
        TaskPlayAnim(PlayerPedId(), dict, "base", 3.0, -8, -1, 63, 0, 0, 0, 0 )
        TriggerEvent("attachItem", "cleaningspray")
        local finished = exports['ARP-taskbar']:taskBar(5000, 'Cleaning Table')
        if (finished == 100) then
            FreezeEntityPosition(PlayerPedId(),false)
            ClearPedTasks(PlayerPedId())
            Citizen.Wait(1000)
            Table5 = true
            Tahble4 = false
            TriggerEvent("destroyProp")
        else
            FreezeEntityPosition(PlayerPedId(),false)
            TriggerEvent("destroyProp")
        end
        TriggerEvent("destroyProp")
	else
		TriggerEvent("DoLongHudText", "You seemed you skip one table!", 2)
	end

end)

RegisterNetEvent("clean:jail5", function()
    if Table5 then
        local ply = PlayerPedId()
        local plyCoords = GetEntityCoords(ply)
        local dict = 'timetable@maid@cleaning_surface@base'
        LoadDict(dict)
        FreezeEntityPosition(PlayerPedId(),true)
        TaskPlayAnim(PlayerPedId(), dict, "base", 3.0, -8, -1, 63, 0, 0, 0, 0 )
        TriggerEvent("attachItem", "cleaningspray")
        local finished = exports['ARP-taskbar']:taskBar(5000, 'Cleaning Table')
        if (finished == 100) then
            FreezeEntityPosition(PlayerPedId(),false)
            ClearPedTasks(PlayerPedId())
            Citizen.Wait(1000)
            Table6 = true
            Table5 = false
            TriggerEvent("destroyProp")
        else
            FreezeEntityPosition(PlayerPedId(),false)
            TriggerEvent("destroyProp")
        end
        TriggerEvent("destroyProp")
	else
		TriggerEvent("DoLongHudText", "You seemed you skip one table!", 2)
	end

end)

RegisterNetEvent("clean:jail6", function()
    if Table6 then
        local ply = PlayerPedId()
        local plyCoords = GetEntityCoords(ply)
        local dict = 'timetable@maid@cleaning_surface@base'
        LoadDict(dict)
        FreezeEntityPosition(PlayerPedId(),true)
        TaskPlayAnim(PlayerPedId(), dict, "base", 3.0, -8, -1, 63, 0, 0, 0, 0 )
        TriggerEvent("attachItem", "cleaningspray")
        local finished = exports['ARP-taskbar']:taskBar(5000, 'Cleaning Table')
        if (finished == 100) then
            FreezeEntityPosition(PlayerPedId(),false)
            ClearPedTasks(PlayerPedId())
            Citizen.Wait(1000)
            Finish = true
            Table6 = false
            TriggerEvent("destroyProp")
        else
            FreezeEntityPosition(PlayerPedId(),false)
            TriggerEvent("destroyProp")
        end
        TriggerEvent("destroyProp")

		TriggerEvent("DoLongHudText", "Collect Your Rewards!", 3)
	else
		TriggerEvent("DoLongHudText", "You seemed you skip one table!", 2)
	end
end)

RegisterNetEvent("Finish:clean:jail", function()
	if Finish then 
        Finish = false
		TriggerEvent("DoLongHudText", "Good Job!! Please Come and Clean again later", 1)
        RPC.execute("ARP-jail:shit")
        if math.random(25) > 10 then
            TriggerServerEvent("jail:cuttime")
        end   
	else
		TriggerEvent("DoLongHudText", "You Lazy Shit!", 2)
        Table = false
		Table2 = false
		Table3 = false
		Table4 = false
		Table5 = false
		Table6 = false
	end

end)

--Jail Deliver--
local DropoffPrison = {   
    [1] =  { ['x'] = 1716.2137451172,['y'] =  2487.7507324219,['z'] =  45.825656890869,['h'] = 195.47579956055, ['name'] = ' Forum Drive 1/Apt', ['apt'] = 1 },
    [2] =  { ['x'] = 1682.4578857422,['y'] =  2476.267578125,['z'] = 45.825275421143,['h'] = 126.63041687012, ['name'] = ' Forum Drive 2/Apt1', ['apt'] = 1 },
    [3] =  { ['x'] = 1722.7388916016,['y'] =2500.9677734375,['z'] = 45.806468963623,['h'] = 320.9575195312, ['name'] = ' Forum Drive 2/Apt3', ['apt'] = 1 },
    [4] =  { ['x'] = 1621.890625,['y'] = 2503.0415039062,['z'] = 45.851684570312,['h'] = 99.842781066895, ['name'] = ' Forum Drive 2/Apt5', ['apt'] = 1 },
    [5] =  { ['x'] = 1616.5289306641,['y'] = 2530.0861816406,['z'] = 45.856914520264,['h'] = 85.795455932617, ['name'] = ' Forum Drive 2/Apt7', ['apt'] = 1 },
    [6] =  { ['x'] = 1636.4074707031,['y'] = 2565.4885253906,['z'] = 45.56489944458,['h'] =358.67050170898, ['name'] = ' Forum Drive 2/Apt9', ['apt'] = 1 },
    [7] =  { ['x'] = 1669.0388183594,['y'] = 2566.1618652344,['z'] =45.564888000488,['h'] =357.59289550781, ['name'] = ' Forum Drive 2/Apt10', ['apt'] = 1 },
    [8] =  { ['x'] = 1759.9761962891,['y'] = 2513.3054199219,['z'] = 45.8069190979,['h'] = 255.03060913086, ['name'] = ' Forum Drive 2/Apt11', ['apt'] = 1 },
    [9] =  { ['x'] = 1741.7474365234,['y'] = 2502.6586914062,['z'] = 45.807571411133,['h'] = 155.83047485352, ['name'] = ' Forum Drive 3/Apt2', ['apt'] = 1 },
    [10] =  { ['x'] = 1724.9281005859,['y'] = 2506.1833496094,['z'] = 45.80611038208,['h'] = 213.70336914062, ['name'] = ' Forum Drive 3/Apt3', ['apt'] = 1 }
}

local IsInJobJail = false
local jail = 0
local isToJail = false
local IsToJailDeliver = false
local shit = 0

local px = 0
local py = 0
local pz = 0

function Iracasa(DropoffPrison,jail)
    blip_casa = AddBlipForCoord(DropoffPrison[jail].x,DropoffPrison[jail].y, DropoffPrison[jail].z)
    SetBlipSprite(blip_casa, 514)
    SetNewWaypoint(DropoffPrison[jail].x,DropoffPrison[jail].y)
end

RegisterNetEvent('jail:deliver')
AddEventHandler('jail:deliver', function()
    if imjailed then 
        TriggerEvent('ARP-context:sendMenu', {
            {
                id = 1,
                header = "Prison Orders",
                txt = ""
            },

            {
                id = 2,
                header = "Set Delivery!",
                txt = "Fufill Order",
                params = {
                    event = "jail:deliver:jail"
                }
            },
        })
    else
        TriggerEvent("DoLongHudText", "You are not in jail!", 2)
    end
end)

RegisterNetEvent("jail:deliver:jail")
AddEventHandler("jail:deliver:jail", function()
    if IsInJobJail == false then
        TriggerEvent("player:receiveItem","Box", 1)
        TriggerEvent("DoShortHudText", "Start Delivering", 1)
        TakeBox()
        IsInJobJail = true
        isToJail = true
        jail = math.random(1, 10)
        px = DropoffPrison[jail].x
        py = DropoffPrison[jail].y
        pz = DropoffPrison[jail].z
        Iracasa(DropoffPrison,jail)
    end
end)

function TakeBox()
    local pos = GetEntityCoords(PlayerPedId(), true)
    RequestAnimDict("anim@heists@box_carry@")
    while (not HasAnimDictLoaded("anim@heists@box_carry@")) do
        Citizen.Wait(7)
    end
    TaskPlayAnim(PlayerPedId(), "anim@heists@box_carry@" ,"idle", 5.0, -1, -1, 50, 0, false, false, false)
    local model = GetHashKey("prop_cs_cardbox_01")
    RequestModel(model)
    while not HasModelLoaded(model) do Citizen.Wait(0) end
    local object = CreateObject(model, pos.x, pos.y, pos.z, true, true, true)
    AttachEntityToEntity(object, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 57005), 0.05, 0.1, -0.3, 300.0, 250.0, 20.0, true, true, false, true, 1, true)
    CarryPackage = object
end

function DropBox()
    ClearPedTasks(PlayerPedId())
    DetachEntity(CarryPackage, true, true)
    DeleteObject(CarryPackage)
    CarryPackage = nil
end



local listening = false
local function listenForKeypress()
    listening = true
    Citizen.CreateThread(function()
        while listening do
            if IsControlJustReleased(0, 38) then
                listening = false
                exports["ARP-doors"]:hideInteraction()
            end
            Wait(0)
        end
    end)
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if isToJail == true then
            destinol = DropoffPrison[jail].name
            if (#(vector3(px,py,pz) - GetEntityCoords(PlayerPedId(),true))) < 7.0 then
                exports["ARP-doors"]:showInteraction(("[E] %s"):format("To Deliver The Box"))
                if IsControlJustPressed(1,38) then
                    listenForKeypress()
                    AttemptDropOffTaco()
                    DropBox()
                    isToJail = false
                    IsToJailDeliver = false
                    IsInJobJail = false
                    RemoveBlip(blip_casa)
                end
            end
        end
        if IsEntityDead(PlayerPedId()) then
            IsInJobJail = false
            jail = 0
            isToJail = false
            IsToJailDeliver = false
            shit = 0
            px = 0
            py = 0
            pz = 0
            RemoveBlip(blip_casa)
        end
    end
end)

function AttemptDropOffTaco()
    FreezeEntityPosition(PlayerPedId(),true)
    if exports["ARP-inventory"]:hasEnoughOfItem("Box",1) then
        local finished = exports['ARP-taskbar']:taskBar(30000, 'Waiting')
        if (finished == 100) then
            if math.random(25) > 20 then
                TriggerServerEvent("jail:cuttime")
            end        
            TriggerEvent("inventory:removeItem","Box", 1)
            RPC.execute("ARP-jail:shit2")
            FreezeEntityPosition(PlayerPedId(),false)
        else
            TriggerEvent("DoLongHudText", "You moved", 2)
            FreezeEntityPosition(PlayerPedId(),false)
        end
    else
        FreezeEntityPosition(PlayerPedId(),false)
        TriggerEvent("DoLongHudText", "You Dont have the item", 2)
    end
    FreezeEntityPosition(PlayerPedId(),false)
end

function drawTxt(text,font,centre,x,y,scale,r,g,b,a)
    SetTextFont(font)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextCentre(centre)
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x , y)
end

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

--Electrical Job--
RegisterNetEvent("jail:electrical:job")
AddEventHandler("jail:electrical:job",function()
    TriggerEvent("DoLongHudText", "Soon TM and Jailbreak too!", 2)
end)