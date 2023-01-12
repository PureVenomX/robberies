Citizen.CreateThread(function()

    AddBoxZone("bean_machine_tray", vector3(120.54, -1040.74, 29.28), 0.6, 0.4, { 
        name="bean_machine_tray", 
        heading = 340.0, 
        -- debugPoly=true, 
        minZ=29.08, 
        maxZ=29.88 
    }, 
    {
        options = {
            {
                event = "open:tray",
                parms = "bean_machine_tray",
                icon = "fas fa-hand-holding",
                label = "Take the Items",
            },
        },
        job = {"all"},
        distance = 1.5
    })

    AddBoxZone("bean_machine_tray_2", vector3(121.85, -1037.08, 29.28), 0.6, 0.4, { 
        name="bean_machine_tray_2", 
        heading = 340.0, 
        --debugPoly=true,
        minZ=29.08, 
        maxZ=29.88 
    }, 
    {
        options = {
            {
                event = "open:tray",
                parms = "bean_machine_tray_2",
                icon = "fas fa-hand-holding",
                label = "Take the Items",
            },
        },
        job = {"all"},
        distance = 1.5
    })

    AddBoxZone("bean_machine_register", vector3(120.73, -1040.09, 29.28), 0.6, 0.6, { 
        name="bean_machine_register", 
        heading = 340.0, 
        -- debugPoly=true, 
        minZ=29.08, 
        maxZ=29.88 
    },   
    {
        options = {
            {
                event = "bean:get:receipt",
                parms = "1",
                icon = "fas fa-cash-register",
                label = "Make Payment",
            },
            {
                event = "bean:register",
                parms = "1",
                icon = "fas fa-credit-card",
                label = "Charge Customer",
            },
        },
        job = {"all"},
        distance = 1.5
    })


    AddBoxZone("bean_machine_register_2", vector3(122.01, -1036.51, 29.28), 0.55, 0.55, {
        name="bean_machine_register_2",
        heading=340,
        --debugPoly=true,
        minZ=29.18,
        maxZ=29.88
    }, 
    {
        options = {
            {
                event = "bean:get:receipt",
                parms = "2",
                icon = "fas fa-cash-register",
                label = "Make Payment",
            },
            {
                event = "bean:register",
                parms = "2",
                icon = "fas fa-credit-card",
                label = "Charge Customer",
            },
        },
        job = {"all"},
        distance = 2.0
    })

    AddCircleZone("bean_machine_cashin", vector3(120.26, -1042.68, 29.28), 0.3, {
        name="bean_machine_cashin",
        useZ=false,
        --debugPoly=true
    },
    {
        options = {
            {
                event = "bean_machine:cash:in",
                icon = "fas fa-cash-register",
                label = "Cash in receipts",
            },
        },
        job = {"bean_machine"},
        distance = 1.0
    })
    
    AddBoxZone("bean_machine_storage", vector3(124.51, -1037.97, 29.28), 0.85, 0.6, { 
        name="bean_machine_storage", 
        heading = 340.0, 
        --debugPoly=true,
        minZ=29.28, 
        maxZ=30.08 
    }, 
    {
        options = {
            {
                event = "open:storage",
                parms = "bean_machine_storage",
                icon = "fas fa-search",
                label = "Open Cooler",
            },
        },
        job = {"bean_machine"},
        distance = 1.5
    })
    
    AddBoxZone("bean_machine_make_coffee", vector3(124.56, -1036.88, 29.28), 0.7, 0.4, { 
        name="bean_machine_make_coffee", 
        heading = 340.0, 
        --debugPoly=true,
        minZ=29.08, 
        maxZ=29.88 
    }, 
    { 
        options = { 
            {
                event = "bean_machine:coffee:prepare",
                parms = "bratte",
                icon = "fas fa-hand-holding",
                label = "Prepare Bratte",
            },
            {
                event = "bean_machine:coffee:prepare",
                parms = "caffeagra",
                icon = "fas fa-hand-holding",
                label = "Prepare Caffe Agra",
            },
            {
                event = "bean_machine:coffee:prepare",
                parms = "ecoffee",
                icon = "fas fa-hand-holding",
                label = "Prepare The Eco-Coffee",
            },
            {
                event = "bean_machine:coffee:prepare",
                parms = "flusher",
                icon = "fas fa-hand-holding",
                label = "Prepare The Flusher",
            },
            {
                event = "bean_machine:coffee:prepare",
                parms = "gunkaccino",
                icon = "fas fa-hand-holding",
                label = "Prepare Gunkaccino",
            },
            {
                event = "bean_machine:coffee:prepare",
                parms = "highnoon",
                icon = "fas fa-hand-holding",
                label = "Prepare Highnoon",
            },
            {
                event = "bean_machine:coffee:prepare",
                parms = "speedball",
                icon = "fas fa-hand-holding",
                label = "Prepare The Speedball",
            },
        }, 
        job = {"bean_machine"},
        distance = 1.5 
    })
    
    AddBoxZone("bean_machine_make_coffee2", vector3(122.93, -1041.68, 29.28), 0.7, 0.6, { 
        name="bean_machine_make_coffee2", 
        heading = 340.0, 
        --debugPoly=true,
        minZ=29.08, 
        maxZ=29.88 
    }, 
    { 
        options = { 
            {
                event = "bean_machine:coffee:prepare",
                parms = "bratte",
                icon = "fas fa-hand-holding",
                label = "Prepare Bratte",
            },
            {
                event = "bean_machine:coffee:prepare",
                parms = "caffeagra",
                icon = "fas fa-hand-holding",
                label = "Prepare Caffe Agra",
            },
            {
                event = "bean_machine:coffee:prepare",
                parms = "ecoffee",
                icon = "fas fa-hand-holding",
                label = "Prepare The Eco-Coffee",
            },
            {
                event = "bean_machine:coffee:prepare",
                parms = "flusher",
                icon = "fas fa-hand-holding",
                label = "Prepare The Flusher",
            },
            {
                event = "bean_machine:coffee:prepare",
                parms = "gunkaccino",
                icon = "fas fa-hand-holding",
                label = "Prepare Gunkaccino",
            },
            {
                event = "bean_machine:coffee:prepare",
                parms = "highnoon",
                icon = "fas fa-hand-holding",
                label = "Prepare Highnoon",
            },
            {
                event = "bean_machine:coffee:prepare",
                parms = "speedball",
                icon = "fas fa-hand-holding",
                label = "Prepare The Speedball",
            },
        }, 
        job = {"bean_machine"},
        distance = 1.5 
    })

    AddBoxZone("bean_machine_slushie", vector3(126.07, -1036.59, 29.28), 0.6, 0.6, { 
        name="bean_machine_slushie", 
        heading = 340.0, 
        --debugPoly=true,
        minZ=29.08, 
        maxZ=30.08 
    }, 
    { 
        options = { 
            {
                event = "bean_machine:coffee:prepare",
                parms = "bigfruit",
                icon = "fas fa-hand-holding",
                label = "Prepare Big Fruit Slushie",
            },
        }, 
        job = {"bean_machine"},
        distance = 1.5 
    })

    AddBoxZone("bean_machine_bar", vector3(123.56, -1042.75, 29.28), 0.6, 1.4, { 
        name="bean_machine_bar", 
        heading = 340.0, 
        --debugPoly=true,
        minZ=29.08, 
        maxZ=29.88 
    }, 
    { 
        options = { 
            {
                event = "bean_machine:bar:open",
                icon = "fas fa-hand-holding",
                label = "Prepare Drinks",
            },
        }, 
        job = {"bean_machine"}, 
        distance = 1.5 
    })

    AddBoxZone("bean_machine_menu", vector3(126.94, -1034.6, 29.28), 0.1, 0.8, {
        name="bean_machine_menu",
        heading=70,
        --debugPoly=true,
        minZ=29.78,
        maxZ=31.08
    }, 
    {
        options = {
            {
                event = "bean_machine:menu",
                icon = "fas fa-hand-holding",
                label = "Check Menu",
            },
        },
        job = {"all"},
        distance = 3.5
    })

    AddBoxZone("bean_machine_food", vector3(126.94, -1035.71, 29.28), 0.05, 0.95, {
        name="bean_machine_food",
        heading=70,
        --debugPoly=true,
        minZ=29.33,
        maxZ=30.38
    },
    {
        options = {
            {
                event = "bean_machine:shop:recipes:open",
                icon = "fas fa-clipboard",
                label = "Recipes",
            },
         },
         job = {"bean_machine"},
        distance = 3
    })

    AddBoxZone("bean_machine_desert", vector3(121.4, -1038.43, 29.28), 1.45, 0.6, { 
        name="bean_machine_desert", 
        heading = 340.0, 
        --debugPoly=true,
        minZ=29.28, 
        maxZ=29.88 
    }, 
    { 
        options = { 
            { 
                event = "bean_machine:coffee:prepare", 
                parms = "beandonut",
                icon = "fas fa-circle-dot", 
                label = "Prepare Donuts", 
            },
            { 
                event = "bean_machine:coffee:prepare", 
                parms = "cheesecake",
                icon = "fas fa-circle-dot", 
                label = "Prepare Cheese Cake", 
            },
        }, 
        job = {"bean_machine"},
        distance = 1.5 
    })

end)