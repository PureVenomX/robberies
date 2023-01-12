Citizen.CreateThread(function()
    AddBoxZone("AutoExoticsStorage", vector3(546.61, -165.82, 54.49), 2.8, 1, {
        name = "AutoExoticsStorage",
        heading = 91,
        debugPoly = false,
        minZ = 51.69,
        maxZ = 55.69
    },
    {
        options = {
            {
                event = "mech:check:internal:storage",
                parms = "auto_exotics",
                icon = "fas fa-hammer",
                label = "Check AutoExotic's Internals's Supply"
            },
            {
                event = "open:storage",
                parms = "auto_exotics",
                icon = "fas fa-box-open",
                label = "Open AutoExotic's Stash!"
            },
            {
                event = "mech:craft",
                icon = "fas fa-wrench",
                label = "Open AutoExotic's Crafting Book!"
            }
        },
        job = {"auto_exotics"},
        distance = 3
    })
    
    AddCircleZone("auto_exotics_side_sto", vector3(544.78, -201.67, 54.79), 0.49, {
        name = "auto_exotics_side_sto",
        debugPoly = false,
        useZ = true
    },
    {
        options = {
            {
                event = "open:storage",
                parms = "auto_exotics_side_storage",
                icon = "fas fa-box-open",
                label = "Open Stash"
            },
        },
        job = {"auto_exotics"},
        distance = 1.5
    })
    
    AddCircleZone("auto_exotics_keyfob", vector3(540.38, -170.54, 54.94), 0.49, {
        name = "auto_exotics_keyfob",
        debugPoly = false,
        useZ = true
    },
    {
        options = {
            {
                event = "mech:get:keyfob",
                icon = "fas fa-key",
                label = "Grab Key Fob",
            },
        },
        job = {"auto_exotics"},
        distance = 1.5
    })

    AddCircleZone("auto_exotics_fridge", vector3(545.96, -174.2, 50.69), 0.55, {
        name="auto_exotics_fridge",
        useZ=true,
        --debugPoly=true
    }, 
    {
        options = {
            {
                event = "tunershop:order",
                icon = "fas fa-door-open",
                label = "Open Fridge",
            },
         },
         job = {"auto_exotics"},
        distance = 3.5
    })

    AddCircleZone("auto_exotics_juke", vector3(547.87, -181.67, 54.49), 0.7, {
        name="auto_exotics_juke",
        useZ=true,
        --debugPoly=true
    }, {
        options = {
            {
                event = "auto_exotics:request:song",
                icon = "fas fa-compact-disc",
                label = "Play Music",
            },
            {
                event = "auto_exotics:change:volume",
                icon = "fas fa-volume-up",
                label = "Volume Changer",
            },
        },
        job = {"auto_exotics"},
        distance = 2
    })
end)