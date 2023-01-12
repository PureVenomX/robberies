
Citizen.CreateThread(function()

    AddCircleZone("vanilla_food", vector3(130.95, -1281.84, 29.27), 0.6, {
        name="vanilla_food",
        useZ=true,
        --debugPoly=true
    }, {
        options = {
            {
                event = "vanilla:make:food",
                icon = "fas fa-hamburger",
                label = "Make Some Food!",
            }
        },
        job = {"vanilla_unicorn"},
        distance = 3.5
    })

    AddBoxZone("vu_make_drink", vector3(129.82, -1280.64, 29.27), 1.5, 0.5, {
        name="vu_make_drink",
        heading=30,
        --debugPoly=true,
        minZ=28.27,
        maxZ=29.27
    }, 
    {
        options = {
            {
                event = "vanilla:make:drink",
                icon = "fas fa-wine-glass-alt",
                label = "Mix a drink!",
            },
        },
        job = {"vanilla_unicorn"},
        distance = 3.5
    })

    

    AddBoxZone("vanilla_unicorn_tray", vector3(128.75, -1284.41, 29.27), 1.0, 1, {
        name="vanilla_unicorn_tray",
        heading=30,
        --debugPoly=true,
        minZ=26.07,
        maxZ=30.07
    }, 
    {
        options = {
            {
                event = "open:tray",
                parms = "vanilla_unicorn_tray",
                icon = "fas fa-hand-holding",
                label = "Take the Items",
            },
        },
        job = {"all"},
        distance = 1.5
    })

    AddBoxZone("vu_safe", vector3(93.67, -1290.51, 29.26), 0.7, 0.5, {
        name="vu_safe",
        heading=115,
        --debugPoly=true,
        minZ=28.26,
        maxZ=29.26
    }, 
    {
        options = {
            {
                event = "open:storage",
                parms = "vanilla_unicorn",
                icon = "fas fa-search",
                label = "Open Storage",
            },
        },
        job = {"vanilla_unicorn"},
        distance = 3.5
    })

    AddBoxZone("vu_dj_booth", vector3(120.84, -1282.9, 29.48), 0.5, 0.5, {
        name="vu_dj_booth",
        heading=345,
        --debugPoly=true,
        minZ=29.28,
        maxZ=29.68
    }, 
    {
        options = {
            {
                event = "vanilla:request:song",
                icon = "fas fa-compact-disc",
                label = "Play Music",
            },
            {
                event = "vanilla:change:volume",
                icon = "fas fa-volume-up",
                label = "Volume Changer",
            },
        },
        job = {"vanilla_unicorn"},
        distance = 3.5
    })

    AddCircleZone("vanilla_job_apply", vector3(130.22, -1297.67, 29.58), 0.3, {
        name = "vanilla_job_apply",
        debugPoly = false,
        useZ = true
    },
    {
        options = {
            {
                event = "jobapp:application:open",
                icon = "far fa-clipboard",
                parms = "vanilla_unicorn",
                label = "Apply to Vanilla Unicorn",
            },
        },
        job = {"all"},
        distance = 2
    })

end)