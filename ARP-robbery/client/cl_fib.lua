local roof_top = vector4(149.22608947754, -755.01116943359, 262.87222290039, 343.06610107422)

local heli_spawn = vector4(-1925.2248535156, 3024.6721191406, 32.810352325439, 331.36807250977)
local heli_model = "cargobob"

local pilot_model = 's_m_m_pilot_02'

local goon_model =  'g_m_m_chicold_01'
local goon_spawn = vector4(-1935.9447021484, 3030.0217285156, 32.810352325439, 239.65626525879)

local general_model = 's_m_m_marine_02'
local general_spawn = vector4(-1934.1883544922, 3035.0397949219, 32.810359954834, 234.95515441895)

--[[
RegisterCommand("testp", function ()
    SpawnBoss()
end)
]]
function SpawnBoss()

    RequestModel(heli_model)
	while not HasModelLoaded(heli_model) do
		Citizen.Wait(100)
	end

    RequestModel(goon_model)
    while not HasModelLoaded(goon_model) do
		Citizen.Wait(100)
    end

    RequestModel(general_model)
    while not HasModelLoaded(general_model) do
		Citizen.Wait(100)
    end

    local heli = CreateVehicle(heli_model, heli_spawn.x, heli_spawn.y, heli_spawn.z, heli_spawn.w, true, false)
    Citizen.Wait(1000)

    local general = CreatePed(0, general_model, general_spawn.x, general_spawn.y, general_spawn.z, general_spawn.w, true, false)
    SetPedAsGroupLeader(general, 1)
    SetPedIntoVehicle(general, heli, 0)

    local pilot = CreatePed(0, pilot_model, general_spawn.x, general_spawn.y, general_spawn.z, general_spawn.w, true, false)
    SetPedAsGroupMember(pilot, 1)
    SetPedIntoVehicle(pilot, heli, -1)

    local seat_count = GetVehicleModelNumberOfSeats(heli)
    print(seat_count)
    for i = 1, seat_count, -1 do
        local g = CreatePed(0, goon_model, goon_spawn.x, goon_spawn.y, goon_spawn.z, goon_spawn.w, true, false)
        SetPedAsGroupMember(g, 1)
        SetPedIntoVehicle(goon_model, heli, i)
    end


    print('spawned')

   -- TaskFollowNavMeshToCoord(pilot, roof_top.x, roof_top.y, roof_top.z, 120, 10, 20, true, 0)

    -- spawn heli
    -- spawn pilot
    -- spawn general
    -- spawn group

    -- attach group
    -- attach group to heli

    -- set waypoint
    -- set scenario task
    --TaskFollowNavMeshToCoord()


    -- land and unload general


end