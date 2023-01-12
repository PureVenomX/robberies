Citizen.CreateThread(function()
    ---- Burger Shot ----
    AddCircleZone("burger_tray_1", vector3(-1194.41, -893.87, 14.22), 0.32, {
        name="burger_tray_1",
        useZ=true,
        --debugPoly=true
    }, 
    {
        options = {
            {
                event = "open:tray",
                parms = "burger_shot_tray_1",
                icon = "fas fa-hand-holding",
                label = "Take the Items",
            },
        },
        job = {"all"},
        distance = 1.5
    })

    AddCircleZone("burger_tray_2", vector3(-1193.4, -895.36, 14.17), 0.31, {
        name="burger_tray_2",
        useZ=true,
        --debugPoly=true
    }, 
    {
        options = {
            {
                event = "open:tray",
                parms = "burger_shot_tray_2",
                icon = "fas fa-hand-holding",
                label = "Take the Items",
            },
        },
        job = {"all"},
        distance = 1.5
    })

    AddCircleZone("burger_tray_3", vector3(-1191.92, -897.65, 14.27), 0.4, {
        name="burger_tray_3",
        useZ=true,
        --debugPoly=true
    }, 
    {
        options = {
            {
                event = "open:tray",
                parms = "burger_shot_tray_3",
                icon = "fas fa-hand-holding",
                label = "Take the Items",
            },
        },
        job = {"all"},
        distance = 1.5
    })

    AddCircleZone("burger_shot_register_1", vector3(-1194.96, -893.2, 14.32), 0.35, {
        name="burger_shot_register_1",
        useZ=true,
        --debugPoly=true
    }, 
    {
        options = {
            {
                event = "burgershot:get:receipt",
                parms = "1",
                icon = "fas fa-cash-register",
                label = "Make Payment",
            },
            {
                event = "burgershot:register",
                parms = "1",
                icon = "fas fa-credit-card",
                label = "Charge Customer",
            },
         },
         job = {"all"},
        distance = 1.5
    })

    AddCircleZone("burger_shot_register_2", vector3(-1193.89, -894.73, 14.17), 0.35, {
        name="burger_shot_register_2",
        useZ=true,
        --debugPoly=true
    }, 
    {
        options = {
            {
                event = "burgershot:get:receipt",
                parms = "2",
                icon = "fas fa-cash-register",
                label = "Make Payment",
            },
            {
                event = "burgershot:register",
                parms = "2",
                icon = "fas fa-credit-card",
                label = "Charge Customer",
            },
         },
         job = {"all"},
        distance = 1.5
    })

    AddCircleZone("burger_shot_register_3", vector3(-1192.85, -896.2, 14.12), 0.35, {
        name="burger_shot_register_3",
        useZ=true,
        --debugPoly=true
    }, 
    {
        options = {
            {
                event = "burgershot:get:receipt",
                parms = "3",
                icon = "fas fa-cash-register",
                label = "Make Payment",
            },
            {
                event = "burgershot:register",
                parms = "3",
                icon = "fas fa-credit-card",
                label = "Charge Customer",
            },
         },
         job = {"all"},
        distance = 1.5
    })

    AddCircleZone("burger_shot_trade_receipts", vector3(-1195.94, -901.74, 13.97), 0.27, {
        name="burger_shot_trade_receipts",
        useZ=true,
        --debugPoly=true
    }, 
    {
        options = {
            {
                event = "burgershot:cash:in",
                icon = "fas fa-cash-register",
                label = "Cash in receipts",
            },
         },
         job = {"burger_shot"},
        distance = 1.5
    })

    -- Burger Juke
    AddCircleZone("burger_booth", vector3(-1197.31, -890.08, 13.97), 0.64, {
        name="burger_booth",
        useZ=true,
        --debugPoly=true
    }, 
    {
        options = {
            {
                event = "burgershot:request:song",
                icon = "fas fa-compact-disc",
                label = "Play Music",
            },
            {
                event = "burgershot:change:volume",
                icon = "fas fa-volume-up",
                label = "Volume Changer",
            },
        },
        job = {"burger_shot"},
        distance = 3.5
    })
    
    AddCircleZone("burger_shot_recipes", vector3(-1197.7, -899.19, 14.27), 0.4, {
        name="burger_shot_recipes",
        useZ=true,
        --debugPoly=true
    },
    {
        options = {
            {
                event = "burger_shot:shop:recipes:open",
                icon = "fas fa-clipboard",
                label = "Recipes",
            },
         },
         job = {"burger_shot"},
        distance = 3
    })
    
    AddCircleZone("burger_shot_kitchen_storage", vector3(-1201.24, -901.52, 13.97), 1, {
        name="burger_shot_kitchen_storage",
        useZ=true,
        --debugPoly=true
    }, {
        options = {
            {
                event = "open:storage",
                parms = "burger_shot_kitchen_storage",
                icon = "fas fa-search",
                label = "Open Cooler",
            },
        },
        job = {"burger_shot"},
        distance = 1.5
    })
    
    AddCircleZone("burger_shot_window_storage", vector3(-1195.61, -897.57, 13.97), 1, {
        name="burger_shot_window_storage",
        useZ=true,
        --debugPoly=true
    }, 
    {
        options = {
            {
                event = "open:storage",
                parms = "burger_shot_window_storage",
                icon = "fas fa-search",
                label = "Open Serving Window",
            },
        },
        job = {"burger_shot"},
        distance = 1.5
    })
    
    AddCircleZone("burger_shot_fries", vector3(-1201.0, -896.59, 13.977), 0.75, {
        name="burger_shot_fries",
        useZ=true,
        --debugPoly=true
    }, 
    {
        options = {
            {
                event = "burger_shot:cooking:prepare",
                parms = "crazy-tenders",
                icon = "fas fa-hand-holding",
                label = "Prepare Crazy Tenders",
            },
            {
                event = "burger_shot:cooking:prepare",
                parms = "fries",
                icon = "fas fa-hand-holding",
                label = "Prepare Fries",
            },
            {
                event = "burger_shot:cooking:prepare",
                parms = "the-prickly",
                icon = "fas fa-hand-holding",
                label = "Prepare The Prickly",
            },
            {
                event = "burger_shot:cooking:prepare",
                parms = "torpedo",
                icon = "fas fa-hand-holding",
                label = "Prepare Torpedo",
            },
        },
        job = {"burger_shot"},
        distance = 1.5
    })
        
    AddCircleZone("burger_shot_burgers", vector3(-1198.28, -895.05, 13.97), 0.64, {
        name="burger_shot_burgers",
        useZ=true,
        --debugPoly=true
    }, 
    {
        options = {
            {
                event = "burger_shot:cooking:prepare",
                parms = "the-bleeder",
                icon = "fas fa-hand-holding",
                label = "Prepare The Bleeder",
            },
            {
                event = "burger_shot:cooking:prepare",
                parms = "the-glorious",
                icon = "fas fa-hand-holding",
                label = "Prepare The Glorius",
            },
            {
                event = "burger_shot:cooking:prepare",
                parms = "heartstopper",
                icon = "fas fa-hand-holding",
                label = "Prepare Heartstopper",
            },
            {
                event = "burger_shot:cooking:prepare",
                parms = "double-shot",
                icon = "fas fa-hand-holding",
                label = "Prepare Double Shot",
            },
        },
        job = {"burger_shot"},
        distance = 1.5
    })

    AddCircleZone("burger_shot_wraps", vector3(-1197.4, -898.29, 13.97), 0.64, {
        name="burger_shot_wraps",
        useZ=true,
        --debugPoly=true
    }, 
    {
        options = {
            {
                event = "burger_shot:cooking:prepare",
                parms = "chicken-wrap",
                icon = "fas fa-hand-holding",
                label = "Prepare Chicken Wrap",
            },
            {
                event = "burger_shot:cooking:prepare",
                parms = "chicken-wrap-cheese",
                icon = "fas fa-hand-holding",
                label = "Prepare Chicken Goat Wrap",
            },
            {
                event = "burger_shot:cooking:prepare",
                parms = "burger-taco",
                icon = "fas fa-hand-holding",
                label = "Prepare Taco",
            },
        },
        job = {"burger_shot"},
        distance = 1.5
    })
        
    AddCircleZone("burger_shot_donut", vector3(-1196.35, -895.66, 14.37), 0.64, {
        name="burger_shot_donut",
        useZ=true,
        --debugPoly=true
    }, 
    {
        options = {
            {
                event = "burger_shot:cooking:prepare",
                parms = "donut",
                icon = "fas fa-hand-holding",
                label = "Prepare Donuts",
            },
        },
        job = {"burger_shot"},
        distance = 1.5
    })
        
    AddCircleZone("burger_shot_drink", vector3(-1196.85, -894.93, 14.32), 0.64, {
        name="burger_shot_drink",
        useZ=true,
        --debugPoly=true
    }, 
    {
        options = {
            {
                event = "burger_shot:bar:open",
                icon = "fas fa-hand-holding",
                label = "Prepare Drinks",
            },
        },
        job = {"burger_shot"},
        distance = 1.5
    })
            
    AddCircleZone("burger_shot_menu", vector3(-1194.18, -891.72, 13.97), 1.0, {
        name="burger_shot_drink",
        useZ=true,
        --debugPoly=true
    }, 
    {
        options = {
            {
                event = "burger_shot:menu",
                icon = "fas fa-hand-holding",
                label = "Check Menu",
            },
        },
         job = {"all"},
        distance = 3.5
    })
end)