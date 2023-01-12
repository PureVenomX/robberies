Citizen.CreateThread(function()
-------SAGMA Gallery---------

    AddCircleZone("Galcounter", vector3(-419.93, 29.16, 46.23), 0.75, {
        name="Galcounter",
        useZ=true,
        --debugPoly=true
    },
    {
        options = {
            {
                event = "open:tray",
                parms = "gallery_tray_1",
                icon = "fas fa-hand-holding",
                label = "Take the Items",
            },
        },
        job = {"all"},
        distance = 1.5
    })


    AddCircleZone("JewelrySell", vector3(-422.54, 31.84, 46.63), 0.4, {
        name = "JewelrySell",
        debugPoly = false,
        useZ = true
    },
    {
        options = {
            {
                event = "jewelry:sell",
                parms = 1,
                icon = "fas fa-check-circle",
                label = "Diamond"
            },
            {
                event = "jewelry:sell",
                parms = 2,
                icon = "fas fa-check-circle",
                label = "Jadeite"
            },
            {
                event = "jewelry:sell",
                parms = 3,
                icon = "fas fa-check-circle",
                label = "Citrine"
            },
            {
                event = "jewelry:sell",
                parms = 4,
                icon = "fas fa-check-circle",
                label = "White Pearl"
            },
            {
                event = "jewelry:sell",
                parms = 5,
                icon = "fas fa-check-circle",
                label = "Emerald"
            },
            {
                event = "jewelry:sell",
                parms = 6,
                icon = "fas fa-check-circle",
                label = "Ruby"
            },
            {
                event = "jewelry:sell",
                parms = 7,
                icon = "fas fa-check-circle",
                label = "Onyx"
            },
            {
                event = "jewelry:sell",
                parms = 8,
                icon = "ffas fa-check-circle",
                label = "Sapphire"
            },

        },
        job = {"gallery"},
        distance = 2.5
    })



end)