Citizen.CreateThread(function()
    
    AddCircleZone("banktruck_spawn", vector3(760.07, 1285.85, 360.3), 1, {
        name="banktruck_spawn",
        debugPoly = false,
        useZ = true
    },
    {
        options = {
            {
                event = "banktruck:spawn",
                icon = "far fa-hdd",
                label = "Do you have it?"
            },
        },
        job = {"all"},
        distance = 1.5
    })

    AddCircleZone("paleto_rob", vector3(-106.54, 6470.33, 31.63), 0.45, {
        name="paleto_rob",
        debugPoly = false,
        useZ = true
    },
            {
                options = {
                    {
                        event = "ARP-paletorob:attempt:hack",
                        icon = "far fa-hdd",
                        label = "Login to computer"
                    },
                },
                job = {"all"},
                distance = 1.5
            })

    AddCircleZone("paleto_rob-fire", vector3(-106.91, 6476.27, 32.18), 0.19, {
        name="paleto_rob-fire",
        debugPoly = false,
        useZ = true
    },
            {
                options = {
                    {
                        event = "paleto:firealerm",
                        icon = "far fa-fire",
                        label = "Pull the fire alarm"
                    },
                },
                job = {"all"},
                distance = 1.5
            })

    AddCircleZone("jewel_pawn", vector3(345.12, -978.87, 29.64), 0.3, {
        name = "jewel_pawn",
        debugPoly = false,
        useZ = true
    },
    {
        options = {
            {
                event = "jewel:sell:attempt",
                parms = 1,
                icon = "fas fa-question",
                label = "17854"
            },
            {
                event = "jewel:sell:attempt",
                parms = 2,
                icon = "fas fa-question",
                label = "18563"
            },
            {
                event = "jewel:sell:attempt",
                parms = 3,
                icon = "fas fa-question",
                label = "07312"
            },
            {
                event = "jewel:sell:attempt",
                parms = 4,
                icon = "fas fa-question",
                label = "62138"
            },
        },
        job = {"all"},
        distance = 2.5
    })
end)
