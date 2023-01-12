
Citizen.CreateThread(function()
    AddCircleZone("uwu_storage", vector3(-597.04, -1048.53, 22.34), 1.0, {
        name="uwu_storage",
        useZ=true,
        --debugPoly=true
    },
    {
        options = {
            {
                event = "business:get:keyfob",
                icon = "fas fa-key",
                label = "Grab Key Fob",
            }
        },
        job = {"uwu_cafe"},
        distance = 1.5
    })

    AddCircleZone("uwu_office_freezer", vector3(-588.02, -1067.11, 22.34), 1.0, {
        name="uwu_office_freezer",
        useZ=true,
        --debugPoly=true
    },
    {
        options = {
            {
                event = "open:storage",
                parms = "uwu_cafe_freezer",
                icon = "fas fa-box-open",
                label = "Open Storage"
            },
            {
                event = "uwu_cafe:cooking:prepare",
                parms = "matcha-icecream",
                icon = "fas fa-hand-holding",
                label = "Prepare Matcha Icecream",
            },
        },
        job = {"uwu_cafe"},
        distance = 3.5
    })

    AddCircleZone("uwu_office_counter", vector3(-587.42, -1059.64, 22.36), 1.0, {
        name="uwu_office_counter",
        useZ=true,
        --debugPoly=true
    },
    {
        options = {
            {
                event = "open:storage",
                parms = "uwu_cafe_counter",
                icon = "fas fa-box-open",
                label = "Open Counter"
            }
        },
        job = {"uwu_cafe"},
        distance = 3.5
    })

    AddCircleZone("uwu_office_storage", vector3(-597.04, -1048.53, 22.34), 1.0, {
        name="uwu_office_storage",
        useZ=true,
        --debugPoly=true
    },
    {
        options = {
            {
                event = "open:storage",
                parms = "uwu_cafe_office",
                icon = "fas fa-box-open",
                label = "Open Stash"
            }
        },
        job = {"uwu_cafe"},
        distance = 1.5
    })

    AddCircleZone("uwu_oven", vector3(-590.94, -1059.77, 22.74), 0.75, {
        name="uwu_oven",
        useZ=true,
        --debugPoly=true
    },
    {
        options = {
            {
                event = "uwu_cafe:cooking:prepare",
                parms = "Mochi",
                icon = "fas fa-hand-holding",
                label = "Prepare Macroons",
            },
            {
                event = "uwu_cafe:cooking:prepare",
                parms = "berry-cake",
                icon = "fas fa-hand-holding",
                label = "Prepare Berry Cake",
            },
        },
        job = {"uwu_cafe"},
        distance = 1.5
    })

    AddCircleZone("uwu_stove", vector3(-591.21, -1056.53, 22.36), 0.75, {
        name="uwu_stove",
        useZ=true,
        --debugPoly=true
    },
    {
        options = {
            {
                event = "uwu_cafe:cooking:prepare",
                parms = "omurice",
                icon = "fas fa-hand-holding",
                label = "Prepare Omurice",
            },
            {
                event = "uwu_cafe:cooking:prepare",
                parms = "uwu-curry",
                icon = "fas fa-hand-holding",
                label = "Prepare Curry",
            },
            {
                event = "uwu_cafe:cooking:prepare",
                parms = "ramen",
                icon = "fas fa-hand-holding",
                label = "Prepare Ramen",
            },
        },
        job = {"uwu_cafe"},
        distance = 1.5
    })

    AddCircleZone("uwu_register_one", vector3(-584.1, -1058.73, 22.34), 0.25, {
        name="uwu_register_one",
        useZ=true,
        --debugPoly=true
    },
    {
        options = {
            {
                event = "uwu_cafe:get:receipt",
                parms = 1,
                icon = "fas fa-cash-register",
                label = "Make Payment",
            },
            {
                event = "uwu_cafe:register",
                parms = 1,
                icon = "fas fa-credit-card",
                label = "Charge Customer",
            },
         },
         job = {"all"},
        distance = 1.5
    })

    AddCircleZone("uwu_register_two", vector3(-584.04, -1061.44, 22.34), 0.25, {
        name="uwu_register_two",
        useZ=true,
        --debugPoly=true
    },
    {
        options = {
            {
                event = "uwu_cafe:get:receipt",
                parms = 2,
                icon = "fas fa-cash-register",
                label = "Make Payment",
            },
            {
                event = "uwu_cafe:register",
                parms = 2,
                icon = "fas fa-credit-card",
                label = "Charge Customer",
            },
         },
         job = {"all"},
        distance = 1.5
    })

    AddCircleZone("uwu_tray_one", vector3(-584.06, -1062.1, 22.34), 0.3, {
        name="uwu_tray_one",
        useZ=true,
        --debugPoly=true
    },
    {
        options = {
            {
                event = "open:tray",
                parms = "uwu_tray_one",
                icon = "fas fa-hand-holding",
                label = "Take the Items",
            },
        },
        job = {"all"},
        distance = 1.5
    })

    AddCircleZone("uwu_tray_two", vector3(-584.07, -1059.3, 22.34), 0.4, {
        name="uwu_tray_two",
        useZ=true,
        --debugPoly=true
    },
    {
        options = {
            {
                event = "open:tray",
                parms = "uwu_tray_two",
                icon = "fas fa-hand-holding",
                label = "Take the Items",
            },
        },
        job = {"all"},
        distance = 1.5
    })

    AddCircleZone("uwu_coffee", vector3(-586.77, -1061.97, 22.34), 0.4, {
        name="uwu_coffee",
        useZ=true,
       --debugPoly=true
    },
    {
        options = {
            {
                event = "uwu_cafe:bar:open",
                icon = "fas fa-cup",
                label = "Make Drinks",
            },
        },
        job = {"uwu_cafe"},
        distance = 1.5
    })

    AddCircleZone("uwu_menu", vector3(-583.5, -1063.65, 22.09), 0.45, {
        name="uwu_menu",
        useZ=true,
       --debugPoly=true
    },
    {
        options = {
            {
                event = "uwu_cafe:menu:food:open",
                icon = "fas fa-book",
                label = "Open Menu",
            },
        },
        job = {"all"},
        distance = 1.5
    })


    AddCircleZone("uwu_cutting_board", vector3(-591.02, -1063.1, 22.36), 0.4, {
        name="uwu_cutting_board",
        useZ=true,
        --debugPoly=true
    },
    {
        options = {
            {
                event = "uwu_cafe:cooking:prepare",
                parms = "uwu-sando",
                icon = "fas fa-hand-holding",
                label = "Prepare Sando",
            },
            {
                event = "uwu_cafe:cooking:prepare",
                parms = "onigiri",
                icon = "fas fa-hand-holding",
                label = "Prepare Onigiri",
            },
        },
        job = {"uwu_cafe"},
        distance = 1.5
    })

    AddCircleZone("uwu_juke", vector3(-584.19, -1057.51, 22.74), 0.21, {
        name="uwu_juke",
        useZ=true,
        --debugPoly=true
    }, {
        options = {
            {
                event = "uwu:request:song",
                icon = "fas fa-compact-disc",
                label = "Play Music",
            },
            {
                event = "uwu:change:volume",
                icon = "fas fa-volume-up",
                label = "Volume Changer",
            },
        },
        job = {"uwu_cafe"},
        distance = 2
    })
    
    AddCircleZone("uwu_cashin", vector3(-596.09, -1052.64, 22.34), 0.61, {
        name="uwu_cashin",
        useZ=true,
        --debugPoly=true
    }, {
        options = {
            {
                event = "uwu_cafe:cash:in",
                icon = "fas fa-cash-register",
                label = "Cash in receipts",
            },
        },
        job = {"uwu_cafe"},
        distance = 2
    })

    AddCircleZone("uwu_food_recipes", vector3(-587.85, -1061.87, 22.91), 0.6, {
        name="uwu_food_recipes",
        useZ=true,
        --debugPoly=true
    },
    {
        options = {
            {
                event = "uwu_cafe:shop:recipes:open",
                icon = "fas fa-book",
                label = "Recipes",
            },
         },
         job = {"uwu_cafe"},
        distance = 2.5
    })
end)