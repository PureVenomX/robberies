Citizen.CreateThread(function()
    -- Gun Crafting

    AddCircleZone("blackmarket_exit", vector3(179.007, -1000.354, -98.99998), 13.893228530884, {
        name = "blackmarket_exit",
        --debugPoly = true,
        useZ = true
    },
        {
        options = {
            {
                event = "blackmarket:teleport:exit",
                icon = "fas fa-door-open",
                label = "Exit"
            },
        },
        job = { "all" },
        distance = 2
        })

    AddCircleZone("blackm", vector3(162.13, 3130.86, 43.93), 0.55, {
        name = "blackm",
        --debugPoly = true,
        useZ = true
    },
        {
        options = {
            {
                event = "blackmarket:teleport:enter",
                icon = "fas fa-door-open",
                label = "Unlatch wood panel"
            },
        },
        job = { "all" },
        distance = 2
        })
    AddCircleZone("blackmarket_shop", vector3(173.89, -1000.28, -98.65), 0.7, {
        name = "blackmarket_shop",
        --debugPoly = true,
        useZ = true
    },
        {
        options = {
            {
                event = "blackmarket:shop:open",
                icon = "fas fa-hand-holding",
                label = "Open Shop"
            },
        },
        job = { "all" },
        distance = 2
        })

    AddCircleZone("washing_lady", vector3(1129.42, -3193.34, -40.4), 0.7, {
        name = "washing_lady",
        --debugPoly = true,
        useZ = true
    },
        {
        options = {
            {
                event = "washing:shop:open",
                icon = "fas fa-hand-holding",
                label = "Lets talk"
            },
        },
        job = { "all" },
        distance = 2
        })

    AddBoxZone("spraylady", vector3(464.27, -870.12, 26.99), 1, 1.0,{
        name = "spraylady",
        useZ = true
    },
        {
        options = {
            {
                event = "spray:shop:open",
                icon = "fas fa-hand-holding",
                label = "Damn cops, go tag stuff",
            },
        },
        job = {"all"},
        distance = 2
        })

end)
