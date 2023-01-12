Citizen.CreateThread(function()

    AddCircleZone("skaters_register", vector3(-1126.03, -1438.89, 5.25), 1, {
        name="skaters_register",
        useZ=true,
        --debugPoly=true
    },
    {
        options = {
            {
                event = "skaters:get:receipt",
                parms = "1",
                icon = "fas fa-cash-register",
                label = "Make Payment",
            },
            {
                event = "skaters:register",
                parms = "1",
                icon = "fas fa-credit-card",
                label = "Charge Customer",
            },
         },
         job = {"all"},
        distance = 1.5
    })

    AddCircleZone("skaters_tray", vector3(-1125.07, -1440.25, 5.25), 1, {
        name="skaters_tray",
        useZ=true,
        --debugPoly=true
    },
    {
        options = {
            {
                event = "open:tray",
                parms = "skaters_tray",
                icon = "fas fa-hand-holding",
                label = "Take the Items",
            },
        },
        job = {"all"},
        distance = 1.5
    })

    AddCircleZone("skaters_receipt", vector3(-1128.73, -1446.42, 5.23), 1, {
        name="skaters_receipt",
        useZ=true,
        --debugPoly=true
    },
    {
        options = {
            {
                event = "skaters:cash:in",
                icon = "fas fa-cash-register",
                label = "Cash in receipts",
            },
            {
                event = "skaters:request:song",
                icon = "fas fa-compact-disc",
                label = "Play Music",
            },
            {
                event = "skaters:change:volume",
                icon = "fas fa-volume-up",
                label = "Volume Changer",
            },
         },
         job = {"skaters"},
        distance = 1.5
    })

    AddCircleZone("skaters_storage", vector3(-1127.47, -1442.05, 5.54), 1, {
        name="skaters_storage",
        useZ=true,
        --debugPoly=true
    },
    {
        options = {
            {
                event = "open:storage",
                parms = "skaters_storage",
                icon = "fas fa-search",
                label = "Open Storage",
            },
        },
        job = {"skaters"},
        distance = 1.5
    })

    AddCircleZone("skaters_craft", vector3(-1126.65, -1441.26, 5.63), 0.55, {
        name="skaters_craft",
        useZ=true,
        --debugPoly=true,
    },
    {
        options = {
            {
                event = "skaters:materials",
                icon = "fas fa-hamburger",
                label = "Create Boards",
            },
        },
        job = {"skaters"},
        distance = 3
    })

end)