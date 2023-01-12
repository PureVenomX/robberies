Citizen.CreateThread(function()

    AddCircleZone("sanctuary_juke", vector3(905.83, -1780.82, 22.79), 0.5, {
        name="sanctuary_juke",
        useZ=true,
        --debugPoly=true
    },
    {
        options = {
            {
                event = "sanctuary:request:song",
                icon = "fas fa-compact-disc",
                label = "Play Music",
            },
            {
                event = "sanctuary:change:volume",
                icon = "fas fa-volume-up",
                label = "Volume Changer",
            },
        },
        job = {"sanctuary"},
        distance = 1.5
    })

    AddBoxZone("sanctuary_mech_bench", vector3(956.72, -1745.26, 21.03), 4.0, 0.9, {
        name="sanctuary_mech_bench",
        heading=265,
        --debugPoly=true,
        minZ=18.23,
        maxZ=22.23
    },
    {
        options = {
            {
                event = "mech:check:internal:storage",
                parms = "sanctuary",
                icon = "fas fa-hammer",
                label = "Check Sanctuary's Internals's Supply"
            },
            {
                event = "open:storage",
                parms = "sanctuary",
                icon = "fas fa-box-open",
                label = "Open Sanctuary's Stash!"
            },
            {
                event = "mech:sanctuary:craft",
                icon = "fas fa-wrench",
                label = "Open Sanctuary's Crafting Book!"
            }
        },
        job = {"sanctuary"},
        distance = 3
    })

    AddBoxZone("sanctuary_storage", vector3(900.08, -1757.17, 22.34), 1.5, 0.3, {
        name="sanctuary_storage",
        heading=355,
        --debugPoly=true,
        minZ=21.34,
        maxZ=23.74
    },
    {
        options = {
            {
                event = "open:storage",
                parms = "sanctuary_storage",
                icon = "fas fa-box-open",
                label = "Open Stash"
            },
        },
        job = {"sanctuary"},
        distance = 1.5
    })

end)