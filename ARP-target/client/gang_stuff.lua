Citizen.CreateThread(function()
    -- Juke
    AddBoxZone("IA_Party_Music", vector3(1418.26, 1154.58, 114.67), 2, 1, {
        name="IA_Party_Music",
        heading=3,
        --debugPoly=true,
        minZ=113.67,
        maxZ=115.47    
    }, 
    {
        options = {
            {
                event = "iaplays:request:song",
                icon = "fas fa-compact-disc",
                label = "Play Music",
            },
            {
                event = "iaplays:change:volume",
                icon = "fas fa-volume-up",
                label = "Volume Changer",
            },
        },
        job = { "sunrise_shop" }, { "vanilla_unicorn" }, { "hayes_autos" },
        distance = 2.5
    })

    AddBoxZone("IA_Party_Storage", vector3(1415.2, 1162.22, 114.33), 3, 1, {
        name="IA_Party_Storage",
        heading=90,
        --debugPoly=true,
        minZ=113.33,
        maxZ=115.93
    }, 
    {
        options = {
            {
                event = "shops:iamafia",
                parms = "5000",
                icon = "fas fa-search",
                label = "Open Bar",
            },
        },
        job = {"all"},
        distance = 3.5
    })

end)