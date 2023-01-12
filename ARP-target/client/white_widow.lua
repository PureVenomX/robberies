local plant_locations = {
    [1] = vector3(162.43, -242.23, 50.17), -- west front
    [2] = vector3(162.0, -243.53, 50.17),
    [3] = vector3(161.53, -244.58, 50.07),
    [4] = vector3(161.07, -245.85, 50.07),
    [5] = vector3(160.71, -246.98, 50.07),
    [6] = vector3(163.22, -247.9, 50.07),
    [7] = vector3(163.53, -246.76, 50.07),
    [8] = vector3(164.12, -245.62, 50.08),
    [9] = vector3(164.48, -244.32, 50.08),
    [10] = vector3(164.99, -243.14, 50.06),
}

Citizen.CreateThread(function()

    AddCircleZone("widow_office_storage",vector3(184.25, -244.55, 54.07), 0.68, {
        name="widow_office_storage",
        useZ=true,
        --debugPoly=true,
    },
    {
        options = {
            {
                event = "open:storage",
                parms = "white_widow_office",
                icon = "fas fa-search",
                label = "Open Safe",
            },
         },
         job = {"white_widow"},
        distance = 2.5
    })

    AddCircleZone("widow_counter_storage",vector3(185.21, -242.34, 54.07), 0.68, {
        name="widow_counter_storage",
        useZ=true,
        --debugPoly=true,
    },
    {
        options = {
            {
                event = "open:storage",
                parms = "white_widow_ocounter",
                icon = "fas fa-search",
                label = "Open Counter",
            },
         },
         job = {"white_widow"},
        distance = 2.5
    })

    AddCircleZone("widow_receipt_turnin",vector3(182.49, -250.18, 53.96), 0.33, {
        name="widow_receipt_turnin",
        useZ=true,
        --debugPoly=true,
    },
    {
        options = {
            {
                event = "white_widow:cash:in",
                icon = "fas fa-cash-register",
                label = "Cash in receipts",
            },
            {
                event = "widow:request:song",
                icon = "fas fa-compact-disc",
                label = "Play Music",
            },
            {
                event = "widow:change:volume",
                icon = "fas fa-volume-up",
                label = "Volume Changer",
            },
         },
         job = {"white_widow"},
        distance = 1.5
    })

    AddCircleZone("widow_register_one",vector3(188.98, -241.08, 54.07), 0.4, {
        name="widow_register_one",
        useZ=true,
        --debugPoly=true,
    },
    {
        options = {
            {
                event = "white_widow:get:receipt",
                parms = "1",
                icon = "fas fa-cash-register",
                label = "Make Payment",
            },
            {
                event = "white_widow:register",
                parms = "1",
                icon = "fas fa-credit-card",
                label = "Charge Customer",
            },
         },
         job = {"all"},
        distance = 1.5
    })

    AddCircleZone("widow_register_two",vector3(188.13, -243.54, 54.07), 0.5, {
        name="widow_register_two",
        useZ=true,
        --debugPoly=true,
    },
    {
        options = {
            {
                event = "white_widow:get:receipt",
                parms = "2",
                icon = "fas fa-cash-register",
                label = "Make Payment",
            },
            {
                event = "white_widow:register",
                parms = "2",
                icon = "fas fa-credit-card",
                label = "Charge Customer",
            },
         },
         job = {"all"},
        distance = 1.5
    })

    AddCircleZone("widow_tray_one",vector3(188.61, -242.24, 54.07), 0.45, {
        name="widow_tray_one",
        useZ=true,
        --debugPoly=true,
    },
    {
        options = {
            {
                event = "open:tray",
                parms = "widow_tray_one",
                icon = "fas fa-hand-holding",
                label = "Take the Items",
            },
        },
        job = {"all"},
        distance = 1.5
    })

    AddCircleZone("widow_tray_two",vector3(188.59, -239.75, 54.07), 0.4, {
        name="widow_tray_two",
        useZ=true,
        --debugPoly=true,
    },
    {
        options = {
            {
                event = "open:tray",
                parms = "widow_tray_two",
                icon = "fas fa-hand-holding",
                label = "Take the Items",
            },
        },
        job = {"all"},
        distance = 1.5
    })

    AddCircleZone("widow_tray_table_one",vector3(188.13, -252.83, 53.42), 0.6, {
        name="widow_tray_table_one",
        useZ=true,
        --debugPoly=true,
    },
    {
        options = {
            {
                event = "open:tray",
                parms = "widow_tray_table_one",
                icon = "fas fa-hand-holding",
                label = "Take the Items",
            },
        },
        job = {"all"},
        distance = 1.5
    })

    AddCircleZone("widow_tray_table_two",vector3(197.53, -252.98, 53.57), 0.73, {
        name="widow_tray_table_two",
        useZ=true,
        --debugPoly=true,
    },
    {
        options = {
            {
                event = "open:tray",
                parms = "widow_tray_table_two",
                icon = "fas fa-hand-holding",
                label = "Take the Items",
            },
        },
        job = {"all"},
        distance = 1.5
    })

    AddCircleZone("widow_tray_table_four",vector3(195.87, -257.74, 53.07), 0.82, {
        name="widow_tray_table_four",
        useZ=true,
        --debugPoly=true,
    },
    {
        options = {
            {
                event = "open:tray",
                parms = "widow_tray_table_four",
                icon = "fas fa-hand-holding",
                label = "Take the Items",
            },
        },
        job = {"all"},
        distance = 1.5
    })

    AddCircleZone("widow_table_tray_five",vector3(193.85, -263.18, 53.52), 0.82, {
        name="widow_table_tray_five",
        useZ=true,
        --debugPoly=true,
    },
    {
        options = {
            {
                event = "open:tray",
                parms = "widow_table_tray_five",
                icon = "fas fa-hand-holding",
                label = "Take the Items",
            },
        },
        job = {"all"},
        distance = 1.5
    })

    AddCircleZone("widow_tray_table_six",vector3(192.17, -267.87, 53.37), 0.82, {
        name="widow_tray_table_six",
        useZ=true,
        --debugPoly=true,
    },
    {
         options = {
            {
                event = "open:tray",
                parms = "widow_tray_table_six",
                icon = "fas fa-hand-holding",
                label = "Take the Items",
            },
        },
        job = {"all"},
        distance = 1.5
    })

    AddCircleZone("widow_tray_table_seven",vector3(183.66, -264.68, 53.37), 0.74, {
        name="widow_tray_table_seven",
        useZ=true,
        --debugPoly=true,
    },
    {
        options = {
            {
                event = "open:tray",
                parms = "widow_tray_table_seven",
                icon = "fas fa-hand-holding",
                label = "Take the Items",
            },
        },
        job = {"all"},
        distance = 1.5
    })

    AddCircleZone("widow_tray_table_eight",vector3(185.94, -258.29, 53.27), 0.78, {
        name="widow_tray_table_eight",
        useZ=true,
        --debugPoly=true,
    },
    {
          options = {
            {
                event = "open:tray",
                parms = "widow_tray_table_eight",
                icon = "fas fa-hand-holding",
                label = "Take the Items",
            },
        },
        job = {"all"},
        distance = 1.5
    })

    for k, pos in pairs(plant_locations) do
        AddCircleZone("widow_highgrade_plant_"..k, pos, 0.35, {
            name="widow_highgrade_plant_"..k,
            useZ=false,
            --debugPoly=true,
    },
    {
        options = {
                {
                    event = "ARP-weedstore:startpicking",
                    parms = k,
                    icon = "fas fa-hand-holding",
                    label = "Harvest Widow",
                },
            },
            job = {"white_widow"},
            distance = 3
        })
    end

    AddCircleZone("widow_process_wet", vector3(166.9, -232.31, 50.06), 1, {
        name="widow_process_wet",
        useZ=true,
        --debugPoly=true,
    },
    {
        options = {
            {
                event = "white_widow:craft:weed:dry",
                icon = "fas fa-hand-holding",
                label = "Dry Widow",
            },
        },
        job = {"white_widow"},
        distance = 3
    })

    AddCircleZone("widow_process_dry", vector3(165.28, -235.85, 50.06), 1, {
        name="widow_process_dry",
        useZ=true,
        --debugPoly=true,
    },
    {
        options = {
            {
                event = "white_widow:craft:weed:pack",
                icon = "fas fa-hand-holding",
                label = "Pack Dried Widow",
            },
        },
        job = {"white_widow"},
        distance = 3
    })

    AddCircleZone("widow_storage_craft_materials", vector3(175.54, -239.82, 50.36), 1, {
        name="widow_storage_craft_materials",
        useZ=true,
        --debugPoly=true,
    },
    {
        options = {
            {
                event = "widow:materials",
                icon = "fas fa-hamburger",
                label = "Crafting & Materials",
            },
            {
                event = "open:storage",
                parms = "white_widow_materials_storage",
                icon = "fas fa-search",
                label = "Open Storage",
            },
        },
        job = {"white_widow"},
        distance = 3
    })

    local WATER_VENDING_MACHINES = {
        [1] = 1099892058,
    }

    AddTargetModel(WATER_VENDING_MACHINES, {
        options = {
            {
                event = "white_widow:water:purchase",
                icon = "fas fa-hand-holding",
                label = "Purchase Water",
            },
        },
        job = {"all"},
        distance = 3
    })

    AddCircleZone("widow_menu",vector3(190.47, -240.24, 54.07), 0.5, {
        name="widow_menu",
        useZ=true,
        --debugPoly=true,
    },
    {
        options = {
            {
                event = "white_widow:menu:food:open",
                icon = "fas fa-book",
                label = "Open Menu",
            },
         },
         job = {"all"},
        distance = 1.5
    })

end)
