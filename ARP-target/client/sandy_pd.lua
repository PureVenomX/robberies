-- Citizen.CreateThread(function()


--     AddCircleZone("sandy_spawn_vehicle", vector3(1817.6, 3692.72, 33.97), 2.0, {
--         name="sandy_spawn_vehicle",
--         debugPoly = false,
--         useZ = true
--     },
--             {
--                 options = {
--                     {
--                         event = "ARP-police:eyetarget",
--                         icon = "fas fa-car",
--                         label = "Sandy Garage",
--                         parms = { location =  "sandy" }
--                     },
--                 },
--                 job = {"police"},
--                 distance = 1.5
--             })

--     AddBoxZone("sandy_duty_police", vector3(1833.73, 3678.43, 34.19), 5.8, 1.0,{
--         name="duty_police",
--         heading=28,
--         minZ=33.19,
--         maxZ=35.19
--         --debugPoly=true
--     },
--             {
--                 options = {
--                     {
--                         event = "Police:duty",
--                         icon = "far fa-clipboard",
--                         label = "Sign On/Off Duty"
--                     },
--                 },
--                 job = {"all"},
--                 distance = 1.5
--             })

--     AddBoxZone("sandy_evidence_open", vector3(1820.25, 3670.23, 34.2), 1.4, 1.8,{
--         name="sandy_evidence",
--         heading=300,
--         --debugPoly=true
--     },
--             {
--                 options = {
--                     {
--                         event = "Evidence:Open",
--                         icon = "fas fa-suitcase",
--                         label = "Open Evidence"
--                     },
--                 },
--                 job = {"police"},
--                 distance = 2
--             })

--     AddCircleZone("sandy_trash", vector3(1825.71, 3676.6, 34.19), 0.36, {
--         useZ=false,
--     },
--             {
--                 options = {
--                     {
--                         event = "evidence:general",
--                         icon = "fas fa-trash",
--                         label = "Trash Locker (Clears On Tsunami)"
--                     },
--                 },
--                 job = {"police"},
--                 distance = 1.5
--             })

--     AddCircleZone("sandy_serial_1", vector3(1829.72, 3669.32, 34.2), 0.63, {
--         name = "sandy_serial_1",
--         debugPoly = false,
--         useZ = true
--     },
--             {
--                 options = {
--                     {
--                         event = "serial:search",
--                         icon = "fas fa-hand-holding",
--                         label = "Search Weapon Serial"
--                     }
--                 },
--                 job = {"police"},
--                 distance = 1.5
--             })

--     AddCircleZone("sandy_serial_2", vector3(1828.75, 3668.72, 34.2), 0.56,{
--         name = "sandy_serial_2",
--         debugPoly = false,
--         useZ = true
--     },
--             {
--                 options = {
--                     {
--                         event = "serial:search",
--                         icon = "fas fa-hand-holding",
--                         label = "Search Weapon Serial"
--                     }
--                 },
--                 job = {"police"},
--                 distance = 1.5
--             })

--     AddCircleZone("sandy_serial_3", vector3(1825.72, 3667.02, 34.2), 0.6,{
--         name = "sandy_serial_3",
--         debugPoly = false,
--         useZ = true
--     },
--             {
--                 options = {
--                     {
--                         event = "serial:search",
--                         icon = "fas fa-hand-holding",
--                         label = "Search Weapon Serial"
--                     }
--                 },
--                 job = {"police"},
--                 distance = 1.5
--             })

--     AddCircleZone("sandy_serial_4", vector3(1824.6, 3666.35, 34.2), 0.6,{
--         name = "sandy_serial_4",
--         debugPoly = false,
--         useZ = true
--     },
--             {
--                 options = {
--                     {
--                         event = "serial:search",
--                         icon = "fas fa-hand-holding",
--                         label = "Search Weapon Serial"
--                     }
--                 },
--                 job = {"police"},
--                 distance = 1.5
--             })

-- end)