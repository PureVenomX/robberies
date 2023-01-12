Citizen.CreateThread(function()

    AddBoxZone("harmonyauto", vector3(1183.46, 2635.1, 37.75), 1, 4, {
        name = "harmonyauto",
        heading = 0,
        debugPoly = false,
        minZ = 34.75,
        maxZ = 38.75
    },
        {
        options = {
            {
                event = "mech:check:internal:storage",
                parms = "harmony_autos",
                icon = "fas fa-hammer",
                label = "Check Harmony Auto's Internals's Supply"
            },
            {
                event = "open:storage",
                parms = "harmony_autos",
                icon = "fas fa-box-open",
                label = "Open Harmony Auto's Stash!"
            },
            {
                event = "mech:craft",
                icon = "fas fa-wrench",
                label = "Open Harmony Auto's Crafting Book!"
            }
        },
        job = { "harmony_autos" },
        distance = 3
        })

        AddCircleZone("harmony_autos_keyfob", vector3(1187.39, 2635.79, 38.3), 0.53, {
            name = "harmony_autos_keyfob",
            debugPoly = false,
            useZ = true
        },
            {
            options = {
                {
                    event = "mech:get:keyfob",
                    icon = "fas fa-key",
                    label = "Grab Key Fob",
                },
            },
            job = { "harmony_autos" },
            distance = 1.5
        })
        AddCircleZone("harmony_autos_juke", vector3(1189.31, 2643.75, 38.4), 1, {
            name="harmony_autos_juke",
            useZ=true,
            --debugPoly=true
        }, {
            options = {
                {
                    event = "harmony:request:song",
                    icon = "fas fa-compact-disc",
                    label = "Play Music",
                },
                {
                    event = "harmony:change:volume",
                    icon = "fas fa-volume-up",
                    label = "Volume Changer",
                },
            },
            job = {"harmony_autos"},
            distance = 2
        })
end)