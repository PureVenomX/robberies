Citizen.CreateThread(function()

    AddBoxZone("roosters_tray", vector3(-171.02, 302.95, 98.52), 0.5, 0.6, {
        name="roosters_tray",
        heading=270,
        --debugPoly=true,
        minZ=98.57,
        maxZ=99.12
    }, 
    {
        options = {
            {
                event = "open:tray",
                parms = "roosters_tray",
                icon = "fas fa-hand-holding",
                label = "Take the Items",
            },
        },
        job = {"all"},
        distance = 1.5
    })

    AddBoxZone("roosters_tray_two", vector3(-170.95, 301.4, 98.52), 0.5, 0.7, {
        name="roosters_tray_two",
        heading=269,
        --debugPoly=true,
        minZ=98.57,
        maxZ=98.92
    }, 
    {
        options = {
            {
                event = "open:tray",
                parms = "roosters_tray_two",
                icon = "fas fa-hand-holding",
                label = "Take the Items",
            },
        },
        job = {"all"},
        distance = 1.5
    })

    AddBoxZone("roosters_rest_register", vector3(-171.05, 303.71, 98.52), 0.4, 0.5, {
        name="roosters_rest_register",
        heading=0,
        --debugPoly=true,
        minZ=98.57,
        maxZ=99.32
    },   
    {
        options = {
            {
                event = "roosters_rest:get:receipt",
                parms = "1",
                icon = "fas fa-cash-register",
                label = "Make Payment",
            },
            {
                event = "roosters_rest:register",
                parms = "1",
                icon = "fas fa-credit-card",
                label = "Charge Customer",
            },
        },
        job = {"all"},
        distance = 1.5
    })


    AddBoxZone("roosters_rest_register_two", vector3(-171.07, 302.04, 98.52), 0.4, 0.5, {
        name="roosters_rest_register_two",
        heading=0,
        --debugPoly=true,
        minZ=98.57,
        maxZ=99.32
    }, 
    {
        options = {
            {
                event = "roosters_rest:get:receipt",
                parms = "2",
                icon = "fas fa-cash-register",
                label = "Make Payment",
            },
            {
                event = "roosters_rest:register",
                parms = "2",
                icon = "fas fa-credit-card",
                label = "Charge Customer",
            },
        },
        job = {"all"},
        distance = 2.0
    })

    AddBoxZone("rooster_rest_cashin", vector3(-173.93, 304.68, 98.53), 0.6, 0.5, {
        name="rooster_rest_cashin",
        heading=0,
        --debugPoly=true,
        minZ=98.48,
        maxZ=99.08
    },
    {
        options = {
            {
                event = "roosters_rest:cash:in",
                icon = "fas fa-cash-register",
                label = "Cash in receipts",
            },
        },
        job = {"roosters_rest"},
        distance = 1.0
    })
    
    AddBoxZone("roosters_rest_storage", vector3(-155.34, 313.39, 98.87), 0.65, 2.65, {
        name="roosters_rest_storage",
        heading=0,
        --debugPoly=true,
        minZ=97.82,
        maxZ=99.52
    }, 
    {
        options = {
            {
                event = "open:storage",
                parms = "roosters_rest_storage",
                icon = "fas fa-search",
                label = "Open Storage",
            },
        },
        job = {"roosters_rest"},
        distance = 1.5
    })

    AddBoxZone("roosters_rest_serving_station", vector3(-171.34, 291.75, 99.2), 2.95, 0.65, {
        name="roosters_rest_serving_station",
        heading=0,
        --debugPoly=true,
        minZ=96.2,
        maxZ=100.2
    }, 
    {
        options = {
            {
                event = "open:storage",
                parms = "roosters_rest_serving_station",
                icon = "fas fa-search",
                label = "Open Serving Station",
            },
        },
        job = {"roosters_rest"},
        distance = 1.5
    })

    AddBoxZone("roosters_rest_fridge", vector3(-171.47, 296.73, 99.2), 0.75, 0.7, {
        name="roosters_rest_fridge",
        heading=0,
        --debugPoly=true,
        minZ=98.2,
        maxZ=99.2
    }, 
    {
        options = {
            {
                event = "open:storage",
                parms = "roosters_rest_fridge",
                icon = "fas fa-search",
                label = "Open Fridge",
            },
        },
        job = {"roosters_rest"},
        distance = 1.5
    })
    
    
--     AddBoxZone("roosters_rest_oven", vector3(122.93, -1041.68, 29.28), 0.7, 0.6, { 
--         name="bean_machine_make_coffee2", 
--         heading = 340.0, 
--         --debugPoly=true,
--         minZ=29.08, 
--         maxZ=29.88 
--     }, 
--     { 
--         options = { 
--             {
--                 event = "roosters_rest:food:prepare",
--                 parms = "bratte",
--                 icon = "fas fa-hand-holding",
--                 label = "Prepare Bratte",
--             },
--             {
--                 event = "roosters_rest:food:prepare",
--                 parms = "caffeagra",
--                 icon = "fas fa-hand-holding",
--                 label = "Prepare Caffe Agra",
--             },
--             {
--                 event = "roosters_rest:food:prepare",
--                 parms = "ecoffee",
--                 icon = "fas fa-hand-holding",
--                 label = "Prepare The Eco-Coffee",
--             },
--             {
--                 event = "roosters_rest:food:prepare",
--                 parms = "flusher",
--                 icon = "fas fa-hand-holding",
--                 label = "Prepare The Flusher",
--             },
--             {
--                 event = "roosters_rest:food:prepare",
--                 parms = "gunkaccino",
--                 icon = "fas fa-hand-holding",
--                 label = "Prepare Gunkaccino",
--             },
--             {
--                 event = "roosters_rest:food:prepare",
--                 parms = "highnoon",
--                 icon = "fas fa-hand-holding",
--                 label = "Prepare Highnoon",
--             },
--             {
--                 event = "roosters_rest:food:prepare",
--                 parms = "speedball",
--                 icon = "fas fa-hand-holding",
--                 label = "Prepare The Speedball",
--             },
--         }, 
--         job = {"roosters_rest"},
--         distance = 1.5 
--     })

    AddBoxZone("roosters_rest_sake", vector3(-173.87, 306.94, 98.53), 3.1, 0.7, {
        name="roosters_rest_sake",
        heading=1,
        --debugPoly=true,
        minZ=98.58,
        maxZ=99.83
    }, 
    { 
        options = { 
            {
                event = "roosters_rest:food:prepare",
                parms = "sake",
                icon = "fas fa-hand-holding",
                label = "Pour The Sake",
            },
        }, 
        job = {"roosters_rest"},
        distance = 1.5 
    })

    AddBoxZone("roosters_rest_bar", vector3(-174.08, 301.9, 98.52), 4.25, 0.5, {
        name="roosters_rest_bar",
        heading=0,
        --debugPoly=true,
        minZ=98.47,
        maxZ=100.47
    }, 
    { 
        options = { 
            {
                event = "roosters_rest:bar:open",
                icon = "fas fa-hand-holding",
                label = "Prepare Drinks",
            },
        }, 
        job = {"roosters_rest"}, 
        distance = 1.5 
    })

    AddBoxZone("roosters_rest_menu", vector3(-170.64, 302.33, 98.51), 0.1, 1.15, {
        name="roosters_rest_menu",
        heading=270,
        --debugPoly=true,
        minZ=97.61,
        maxZ=98.51
    }, 
    {
        options = {
            {
                event = "roosters_rest:menu",
                icon = "fas fa-hand-holding",
                label = "Check Menu",
            },
        },
        job = {"all"},
        distance = 3.5
    })
    
--     AddBoxZone("roosters_rest_food", vector3(126.94, -1035.71, 29.28), 0.05, 0.95, {
--         name="bean_machine_food",
--         heading=70,
--         --debugPoly=true,
--         minZ=29.33,
--         maxZ=30.38
--     },
--     {
--         options = {
--             {
--                 event = "roosters_rest:shop:recipes:open",
--                 icon = "fas fa-clipboard",
--                 label = "Recipes",
--             },
--          },
--          job = {"roosters_rest"},
--         distance = 3
--     })

--     AddBoxZone("roosters_rest_desert", vector3(121.4, -1038.43, 29.28), 1.45, 0.6, { 
--         name="bean_machine_desert", 
--         heading = 340.0, 
--         --debugPoly=true,
--         minZ=29.28, 
--         maxZ=29.88 
--     }, 
--     { 
--         options = { 
--             { 
--                 event = "roosters_rest:food:prepare", 
--                 parms = "beandonut",
--                 icon = "fas fa-circle-dot", 
--                 label = "Prepare Donuts", 
--             },
--             { 
--                 event = "roosters_rest:food:prepare", 
--                 parms = "cheesecake",
--                 icon = "fas fa-circle-dot", 
--                 label = "Prepare Cheese Cake", 
--             },
--         }, 
--         job = {"roosters_rest"},
--         distance = 1.5 
--     })

end)