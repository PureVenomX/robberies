Citizen.CreateThread(function()

    AddBoxZone("bahamasfood", vector3(-1391.49, -606.99, 30.32), 0.5, 3, {
        name="bahamasfood",
        heading=30,
        --debugPoly=true,
        minZ=26.32,
        maxZ=30.32
    },
    {
        options = {
            {
                event = "bahamas:make:food",
                icon = "fas fa-hamburger",
                label = "Make Some Food!",
            }
        },
        job = {"bahamas_bar"},
        distance = 3.5
    })

    AddCircleZone("bahamasdrink", vector3(-1389.91, -610.3, 30.32), 3.0, {
        name="bahamasdrink",
        useZ=true,
        --debugPoly=true
    }, 
    {
        options = {
            {
                event = "bahamas:make:drink",
                icon = "fas fa-wine-glass-alt",
                label = "Mix a drink!",
            },
        },
        job = {"bahamas_bar"},
        distance = 3.5
    })

    

    AddCircleZone("bahamastray1", vector3(-1386.43, -612.63, 30.32), 0.3, {
        name="bahamastray1",
        useZ=true,
        --debugPoly=true
    }, 
    {
        options = {
            {
                event = "open:tray",
                parms = "bahamastray1",
                icon = "fas fa-hand-holding",
                label = "Take the Items",
            },
        },
        job = {"all"},
        distance = 1.5
    })

    AddCircleZone("bahamastray2", vector3(-1389.18, -614.45, 30.32), 0.3, {
        name="bahamastray2",
        useZ=true,
        --debugPoly=true
    }, 
    {
        options = {
            {
                event = "open:tray",
                parms = "bahamastray2",
                icon = "fas fa-hand-holding",
                label = "Take the Items",
            },
        },
        job = {"all"},
        distance = 1.5
    })

    AddCircleZone("bahamastray3",vector3(-1393.69, -608.18, 30.32), 0.3, {
        name="bahamastray3",
        useZ=false,
        --debugPoly=true
    }, 
    {
        options = {
            {
                event = "open:tray",
                parms = "bahamastray3",
                icon = "fas fa-hand-holding",
                label = "Take the Items",
            },
        },
        job = {"all"},
        distance = 1.5
    })

    AddCircleZone("bahamastray4", vector3(-1390.45, -606.2, 30.32), 0.3, {
        name="bahamastray4",
        useZ=true,
        --debugPoly=true
    }, 
    {
        options = {
            {
                event = "open:tray",
                parms = "bahamastray4",
                icon = "fas fa-hand-holding",
                label = "Take the Items",
            },
        },
        job = {"all"},
        distance = 1.5
    })

    AddCircleZone("bahamasregister1", vector3(-1385.66, -611.78, 30.32), 0.5, {
        name="bahamasregister1",
        useZ=true,
        --debugPoly=true
    }, 
    {
        options = {
            {
                event = "bahamas:get:receipt",
                parms = "1",
                icon = "fas fa-cash-register",
                label = "Make Payment",
            },
            {
                event = "bahamas:register",
                parms = "1",
                icon = "fas fa-credit-card",
                label = "Charge Customer",
            },
         },
         job = {"all"},
        distance = 1.5
    })


    AddCircleZone("bahamasregister2", vector3(-1390.41, -614.88, 30.32), 0.5, {
        name="bahamasregister2",
        useZ=true,
        --debugPoly=true
    }, 
    {
        options = {
            {
                event = "bahamas:get:receipt",
                parms = "2",
                icon = "fas fa-cash-register",
                label = "Make Payment",
            },
            {
                event = "bahamas:register",
                parms = "2",
                icon = "fas fa-credit-card",
                label = "Charge Customer",
            },
         },
         job = {"all"},
        distance = 1.5
    })

    AddCircleZone("bahamasregister3", vector3(-1394.41, -609.13, 30.32), 0.5, {
        name="bahamasregister3",
        useZ=true,
        --debugPoly=true
    }, 
    {
        options = {
            {
                event = "bahamas:get:receipt",
                parms = "3",
                icon = "fas fa-cash-register",
                label = "Make Payment",
            },
            {
                event = "bahamas:register",
                parms = "3",
                icon = "fas fa-credit-card",
                label = "Charge Customer",
            },
         },
         job = {"all"},
        distance = 1.5
    })

    AddCircleZone("bahamasregister4", vector3(-1388.96, -605.7, 30.32), 0.5, {
        name="bahamasregister4",
        useZ=true,
        --debugPoly=true
    }, 
    {
        options = {
            {
                event = "bahamas:get:receipt",
                parms = "4",
                icon = "fas fa-cash-register",
                label = "Make Payment",
            },
            {
                event = "bahamas:register",
                parms = "4",
                icon = "fas fa-credit-card",
                label = "Charge Customer",
            },
         },
         job = {"all"},
        distance = 1.5
    })

    AddCircleZone("bahamas_table_tray", vector3(-1394.18, -595.29, 30.32), 1.05, {
        name="bahamas_table_tray",
        useZ=true,
        --debugPoly=true
    }, 
    {
        options = {
            {
                event = "open:tray",
                parms = "bahamas_table_tray",
                icon = "fas fa-hand-holding",
                label = "Take the Items",
            },
        },
        job = {"all"},
        distance = 1.5
    })

    AddCircleZone("bahamas_table_tray2", vector3(-1395.28, -600.7, 30.32), 1.05, {
        name="bahamas_table_tray2",
        useZ=true,
        --debugPoly=true
    }, 
    {
        options = {
            {
                event = "open:tray",
                parms = "bahamas_table_tray2",
                icon = "fas fa-hand-holding",
                label = "Take the Items",
            },
        },
        job = {"all"},
        distance = 1.5
    })

    AddCircleZone("bahamas_table_tray3", vector3(-1401.18, -600.09, 30.32), 1.05, {
        name="bahamas_table_tray3",
        useZ=true,
        --debugPoly=true
    }, 
    {
        options = {
            {
                event = "open:tray",
                parms = "bahamas_table_tray3",
                icon = "fas fa-hand-holding",
                label = "Take the Items",
            },
        },
        job = {"all"},
        distance = 1.5
    })

    AddCircleZone("bahamas_table_tray4", vector3(-1401.99, -604.98, 30.32), 1.05, {
        name="bahamas_table_tray4",
        useZ=true,
        --debugPoly=true
    }, 
    {
        options = {
            {
                event = "open:tray",
                parms = "bahamas_table_tray4",
                icon = "fas fa-hand-holding",
                label = "Take the Items",
            },
        },
        job = {"all"},
        distance = 1.5
    })

    AddCircleZone("bahamas_table_tray5", vector3(-1409.43, -605.27, 30.32), 1.05, {
        name="bahamas_table_tray5",
        useZ=true,
        --debugPoly=true
    }, 
    {
        options = {
            {
                event = "open:tray",
                parms = "bahamas_table_tray5",
                icon = "fas fa-hand-holding",
                label = "Take the Items",
            },
        },
        job = {"all"},
        distance = 1.5
    })

    AddCircleZone("bahamas_table_tray6", vector3(-1407.34, -608.41, 30.32), 1.05, {
        name="bahamas_table_tray6",
        useZ=true,
        --debugPoly=true
    }, 
    {
        options = {
            {
                event = "open:tray",
                parms = "bahamas_table_tray6",
                icon = "fas fa-hand-holding",
                label = "Take the Items",
            },
        },
        job = {"all"},
        distance = 1.5
    })

    AddBoxZone("bahamas_safe", vector3(-1369.59, -624.3, 30.32), 0.3, 1, {
        name="bahamas_safe",
        heading=303,
        --debugPoly=true,
        minZ=26.92,
        maxZ=30.92
    }, 
    {
        options = {
            {
                event = "open:storage",
                parms = "bahamas_safe",
                icon = "fas fa-search",
                label = "Open Storage",
            },
        },
        job = {"bahamas_bar"},
        distance = 3.5
    })

    AddCircleZone("bahamasjuke", vector3(-1378.98, -628.72, 30.63), 1.0, {
        name="bahamasjuke",
        useZ=true,
        --debugPoly=true
    },
    {
        options = {
            {
                event = "bahamas:request:song",
                icon = "fas fa-compact-disc",
                label = "Play Music",
            },
            {
                event = "bahamas:change:volume",
                icon = "fas fa-volume-up",
                label = "Volume Changer",
            },
        },
        job = {"bahamas_bar"},
        distance = 3.5
    })

    AddCircleZone("bahamas_party_girl", vector3(-1384.61, -591.71, 30.32), 0.95, {
        name="bahamas_party_girl",
        useZ=true,
        --debugPoly=true
    },
    {
        options = {
            {
                event = "bahamas:partygirl",
                icon = "fas fa-address-card",
                label = "Wanna party?",
            },
        },
        job = {"all"},
        distance = 1.5
    })

    AddCircleZone("bahamasbouncer", vector3(-1387.34, -585.25, 30.21), 0.9, {
        name="bahamasbouncer",
        useZ=true,
        --debugPoly=true
    },
    {
        options = {
            {
                event = "bahamas:wristbands:purchase",
                icon = "fas fa-money-bill",
                label = "Purchase Entry Wristband",
            },
        },
        job = {"all"},
        distance = 1.5
    })

    AddCircleZone("bahamascomputer", vector3(-1365.93, -622.49, 30.33), 0.5, {
        name="bahamascomputer",
        useZ=true,
        --debugPoly=true
    },
    {
        options = {
            {
                event = "bahamas:cash:in",
                icon = "fas fa-money-bill",
                label = "Cash In Receipts",
            },
            {
                event = "bahamas:bouncer:toggle",
                icon = "fas fa-lock-open",
                label = "Set Business Open/Close",
            },
        },
        job = {"bahamas_bar"},
        distance = 3.5
    })

    AddBoxZone("bahamaskeyfob", vector3(-1395.96, -626.56, 30.32), 1, 1, {
        name="bahamaskeyfob",
        heading=30,
        --debugPoly=true,
        minZ=27.52,
        maxZ=31.52
    },
    {
        options = {
            {
                event = "business:get:keyfob",
                icon = "fas fa-key",
                label = "Grab Key Fob",
            },
        },
        job = {"bahamas_bar"},
        distance = 1.5
    })

    AddBoxZone("bahamascookedfoodstorage", vector3(-1391.99, -614.6, 30.32), 0.5, 2, {
        name="bahamascookedfoodstorage",
        heading=356,
        --debugPoly=true,
        minZ=26.52,
        maxZ=30.52
    },
    {
        options = {
            {
                event = "open:storage",
                parms = "bahamascookedfoodstorage",
                icon = "fas fa-box-open",
                label = "Open Counter"
            }
        },
        job = {"bahamas_bar"},
        distance = 1.5
    })



    -- NEEDS MOVING EVENTUALLY
    --LRD Juke Box
    AddCircleZone("lrd_juke", vector3(-1501.44, -64.95, 54.16), 0.4, {
        name="lrd_juke",
        useZ=false,
        --debugPoly=true
    },
    {
        options = {
            {
                event = "lrdplays:request:song",
                icon = "fas fa-compact-disc",
                label = "Play Music",
            },
            {
                event = "lrdplays:change:volume",
                icon = "fas fa-volume-up",
                label = "Volume Changer",
            },
        },
        job = { "sanctuary" },
        distance = 2.5
    })

    --Gotham Juke Box
    AddBoxZone("gotham_juke", vector3(-656.14, 860.92, 225.15), 2.4, 0.3, {
        name="gotham_juke",
        heading=357,
        --debugPoly=true,
        minZ=224.55,
        maxZ=226.15
    },
    {
        options = {
            {
                event = "gothamplays:request:song",
                icon = "fas fa-compact-disc",
                label = "Play Music",
            },
            {
                event = "gothamplays:change:volume",
                icon = "fas fa-volume-up",
                label = "Volume Changer",
            },
        },
        job = { "sanctuary" },
        distance = 2.5
    })    

end)