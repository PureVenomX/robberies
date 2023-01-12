Citizen.CreateThread(function()
        
    AddCircleZone("lost_bikes_bench", vector3(1001.84, -129.85, 74.06), 1, {
        name = "lost_bikes_bench",
        debugPoly = false,
        useZ = true
    },
    {
        options = {
            {
                event = "mech:check:internal:storage",
                parms = "lost_bikes",
                icon = "fas fa-hammer",
                label = "Check Internals's Supply"
            },
            {
                event = "open:storage",
                parms = "lost_bikes_bench",
                icon = "fas fa-box-open",
                label = "Open Stash"
            },
            {
                event = "mech:bikes:craft",
                icon = "fas fa-wrench",
                label = "Open Crafting Book"
            }
        },
        job = {"lost_bikes"},
        distance = 3
    })
    
    AddCircleZone("lost_bikes_storage", vector3(988.68, -138.17, 74.07), 0.49, {
        name = "lost_bikes_storage",
        debugPoly = false,
        useZ = true
    },
    {
        options = {
            {
                event = "open:storage",
                parms = "lost_bikes_side_storage",
                icon = "fas fa-box-open",
                label = "Open Stash"
            },
        },
        job = {"lost_bikes"},
        distance = 1.5
    })
    
    AddCircleZone("lost_bikes_keyfob", vector3(979.92, -128.34, 74.06), 0.49, {
        name = "lost_bikes_keyfob",
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
        job = {"lost_bikes"},
        distance = 1.5
    })

    AddCircleZone("lost_bikes_juke", vector3(989.04, -135.5, 74.07), 0.4, {
        name="lost_bikes_juke",
        useZ=true,
        --debugPoly=true
    }, {
        options = {
            {
                event = "lost_bikes:request:song",
                icon = "fas fa-compact-disc",
                label = "Play Music",
            },
            {
                event = "lost_bikes:change:volume",
                icon = "fas fa-volume-up",
                label = "Volume Changer",
            },
        },
        job = {"lost_bikes"},
        distance = 2
    })
end)