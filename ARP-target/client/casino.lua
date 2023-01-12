Citizen.CreateThread(function()

    AddCircleZone("casino_food", vector3(979.51, 23.88, 70.71), 3.22, {
        name="casino_food",
        useZ=false,
        --debugPoly=true
      },
      {
        options = {
            {
                event = "casino:general",
                icon = "fas fa-hamburger",
                label = "Food & Drinks!"
            },
        },
        job = { "all" },
        distance = 5
        })

    AddCircleZone("casino_members", vector3(989.55, 31.69, 71.73), 0.61, {
        name="casino_members",
        useZ=true,
        --debugPoly=true
    },
    {
        options = {
            {
                event = "casino:buyChips",
                icon = "fas fa-dice",
                label = "Buy Chips!"
            },
            {
                event = "casino:members",
                icon = "fas fa-credit-card",
                label = "Come play!"
            },
            {
                event = "casino:sellChips",
                icon = "fas fa-dice",
                label = "Sell Chips!"
            },
        },
        job = { "all" },
        distance = 3.5
    })

    AddCircleZone("castable", vector3(997.91, 53.98, 75.12), 0.5, {
        name="castable",
        useZ=true,
        --debugPoly=true
    },
    {
        options = {
            {
                event = "table:enable",
                icon = "fas fa-wrench",
                label = "Turn on tables!"
            },
            {
                event = "table:disable",
                icon = "fas fa-wrench",
                label = "Turn off tables!"
            },
        },
        job = { "all" },
        distance = 2
    })

    AddCircleZone("gunstash", vector3(996.0, 59.46, 74.76), 0.55, {
        name="gunstash",
        useZ=true,
        --debugPoly=true
    },
    {
        options = {
            {
                event = "craft:guns:level:four",
                icon = "fas fa-lock",
                label = "See the collection"
            },
        },
        job = { "all" },
        distance = 2
    }) 
    AddBoxZone("casino_storage", vector3(999.11, 61.76, 75.06), 1, 0.6, {
        name="casino_storage",
        heading=58,
        --debugPoly=true,
        minZ=72.31,
        maxZ=74.91
    },
    {
        options = {
            {
                event = "casino:storage",
                parms = "casino_storage",
                icon = "fas fa-search",
                label = "Private stash"
            },
        },
        job = { "diamond_casino" },
        distance = 1.5
    }) 


    AddBoxZone("luckywheel_spin", vector3(990.26, 42.76, 71.27), 2.75, 0.3, {
        name="luckywheel_spin",
        heading=58,
        --debugPoly=true,
        minZ=69.32,
        maxZ=73.32
    },
    {
        options = {
            {
                event = "luckywheel:spin",
                icon = "fas fa-lock",
                label = "Spin The Wheel Baby!"
            },
        },
        job = { "all" },
        distance = 2
    }) 



end)