Citizen.CreateThread(function()

    AddBoxZone("ottos_autos_bench", vector3(836.91, -811.75, 26.35), 2.1, 1.2, {
        name="ottos_autos_bench",
        heading=0,
        --debugPoly=true,
        minZ=25.35,
        maxZ=26.75
    },
    {
        options = {
            {
                event = "mech:check:internal:storage",
                parms = "ottos_autos",
                icon = "fas fa-hammer",
                label = "Check Internals's Supply"
            },
            {
                event = "open:storage",
                parms = "ottos_autos",
                icon = "fas fa-box-open",
                label = "Open Stash"
            },
            {
                event = "mech:ottos:craft",
                icon = "fas fa-wrench",
                label = "Open Crafting Book"
            },
        },
        job = {"ottos_autos"},
        distance = 1.5
    })

    AddBoxZone("ottos_autos_storage", vector3(832.16, -830.17, 26.33), 3, 0.5, {
        name="ottos_autos_storage",
        heading=90,
        --debugPoly=true,
        minZ=25.33,
        maxZ=27.53
    },
    {
        options = {
            {
                event = "mech:get:keyfob",
                icon = "fas fa-key",
                label = "Grab Key Fob",
            },
            {
                event = "open:storage",
                parms = "ottos_autos_storage",
                icon = "fas fa-box-open",
                label = "Open Stash"
            },
        },
        job = {"ottos_autos"},
        distance = 1.5    
    })

    AddCircleZone("ottos_autos_juke", vector3(837.2, -817.13, 26.33), 0.29, {
        name="ottos_autos_juke",
        useZ=false,
        --debugPoly=true
    }, 
    {
        options = {
            {
                event = "ottos:request:song",
                icon = "fas fa-compact-disc",
                label = "Play Music",
            },
            {
                event = "ottos:change:volume",
                icon = "fas fa-volume-up",
                label = "Volume Changer",
            },
        },
        job = { "ottos_autos" },
        distance = 3.5
    })

    -- AddBoxZone("ottos_autos_register", vector3(834.3, -823.81, 26.33), 0.5, 0.5, {
    --     name="ottos_autos_register",
    --     heading=0,
    --     --debugPoly=true,
    --     minZ=26.28,
    --     maxZ=26.73
    -- }, 
    -- {
    --     options = {
    --         {
    --             event = "ottos_autos:get:receipt",
    --             parms = "1",
    --             icon = "fas fa-cash-register",
    --             label = "Make Payment",
    --         },
    --         {
    --             event = "ottos_autos:register",
    --             parms = "1",
    --             icon = "fas fa-credit-card",
    --             label = "Charge Customer",
    --         },
    --      },
    --      job = {"all"},
    --     distance = 1.5
    -- })

    -- AddBoxZone("ottos_autos_register_2", vector3(832.45, -823.82, 26.33), 0.5, 0.5, {
    --     name="ottos_autos_register_2",
    --     heading=0,
    --     --debugPoly=true,
    --     minZ=26.28,
    --     maxZ=26.73
    -- }, 
    -- {
    --     options = {
    --         {
    --             event = "ottos_autos:get:receipt",
    --             parms = "2",
    --             icon = "fas fa-cash-register",
    --             label = "Make Payment",
    --         },
    --         {
    --             event = "ottos_autos:register",
    --             parms = "2",
    --             icon = "fas fa-credit-card",
    --             label = "Charge Customer",
    --         },
    --      },
    --      job = {"all"},
    --     distance = 1.5
    -- })

    -- AddCircleZone("ottos_autos_trade_receipts", vector3(-1427.13, -458.42, 35.91), 0.48, {
    --     name="ottos_autos_trade_receipts",
    --     useZ=true,
    --     --debugPoly=true
    -- },
    -- {
    --     options = {
    --         {
    --             event = "ottos_autos:cash:in",
    --             icon = "fas fa-cash-register",
    --             label = "Cash in receipts",
    --         },
    --      },
    --      job = {"ottos_autos"},
    --     distance = 1.5
    -- })

end)