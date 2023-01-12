Citizen.CreateThread(function()
    
    local cocaine_crate = {
        [1] = 1925170211
    }
    AddTargetModel(cocaine_crate, {
        options = {
            {
                event = "drugs:cocaine:opencrash",
                icon = "fas fa-car",
                label = "Break In"
            }
        },
        job = { "all" },
        distance = 2.5
    })

    AddCircleZone("cocaine_split_bricks", vector3(1124.69, -1230.78, 16.42), 0.9, {
        name = "cocaine_split_bricks",
        debugPoly = false,
        useZ = true
    },
        {
        options = {
            {
                event = "drugs:cocaine:split:brick",
                icon = "fas fa-suitcase",
                label = "Unwarp Bricks"
            },
        },
        job = { "all" },
        distance = 2
        })

    AddCircleZone("cocaine_split_uncutbricks", vector3(1120.67, -1233.97, 16.42), 0.9, {
        name = "cocaine_split_uncutbricks",
        debugPoly = false,
        useZ = true
    },
        {
        options = {
            {
                event = "drugs:cocaine:split:uncut",
                icon = "fas fa-utensils",
                label = "Split Uncut Bricks"
            },
        },
        job = { "all" },
        distance = 2
        })

    AddCircleZone("cocaine_split_5g", vector3(1117.64, -1240.25, 16.42), 0.9, {
        name = "cocaine_split_5g",
        debugPoly = false,
        useZ = true
    },
        {
        options = {
            {
                event = "drugs:cocaine:split:5g",
                icon = "fas fa-utensils",
                label = "Split 5g Bags"
            },
        },
        job = { "all" },
        distance = 2
        })
end)
