Citizen.CreateThread(function()

    AddCircleZone("sunrise_storage", vector3(-787.26, -215.76, 37.08), 1, {
        name="sunrise_storage",
        useZ=true,
        --debugPoly=true
    }, 
    {
        options = {
            {
                event = "open:storage",
                parms = "sunrise_storage",
                icon = "fas fa-search",
                label = "Open Storage",
            },
        },
        job = {"sunrise_shop"},
        distance = 1.5
    })

    AddCircleZone("sunrise_keyfob", vector3(-768.65, -228.77, 37.0), 0.6, {
        name="sunrise_keyfob",
        useZ=true,
        --debugPoly=true
    },
    {
        options = {
            {
                event = "business:get:keyfob",
                icon = "fas fa-key",
                label = "Grab Key Fob",
            },
        },
        job = {"sunrise_shop"},
        distance = 1.5
    })
    
    AddCircleZone("sunrise_dj_booth", vector3(-791.12, -217.54, 37.08), 0.7, {
        name="sunrise_dj_booth",
        useZ=true,
        --debugPoly=true
    },
    {
        options = {
            {
                event = "sunrise:request:song",
                icon = "fas fa-compact-disc",
                label = "Play Music",
            },
            {
                event = "sunrise:change:volume",
                icon = "fas fa-volume-up",
                label = "Volume Changer",
            },
        },
        job = {"sunrise_shop"},
        distance = 1.5
    })

    AddCircleZone("sunrise_release", vector3(-775.22, -228.35, 37.88), 1, {
        name="sunrise_release",
        useZ=true,
        --debugPoly=true
    },
    {
        options = {
            {
                event = "sunrise:carshop:purchase:release",
                icon = "fas fa-key",
                label = "Release Vehicle",
            },
        },
        job = {"sunrise_shop"},
        distance = 5.5
    })

    AddCircleZone("coffeepot", vector3(-794.14, -221.0, 37.08), 0.4, {
        name = "coffeepot",
        useZ = true,
        --debugpoly = false,
    },
    {   
        options = {
            {
                event = "shops:coffee",
                icon = "fas fa-cup",
                label = "Grab a cup of Jo"
            },
        },
        job = {"all"},
        distance = 1.5
    })

end)