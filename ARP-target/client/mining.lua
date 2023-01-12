Citizen.CreateThread(function()
 
    AddCircleZone("ore_prospector", vector3(295.77, 2834.38, 43.44), 1.0, {
        name = "ore_prospector",
        debugPoly = false,
        useZ = true
    },
    {
        options = {
            {
                event = "washerevent",
                icon = "far fa-clipboard",
                label = "Process Raw Ore",
            },
        },
        job = {"all"},
        distance = 2
    })
 
    AddCircleZone("mining_job", vector3(2997.18, 2753.11, 42.74), 5.0, {
        name = "mining_job",
        debugPoly = false,
        useZ = true
    },
    {
        options = {
            {
                event = "miningmenu",
                icon = "fas fa-hard-hat",
                label = "Start Mining",
            },
         },
        job = {"all"},
        distance = 7.0
    })

    AddCircleZone("mining_job_two", vector3(2984.78, 2815.94, 44.07), 5.0, {
        name = "mining_job_two",
        debugPoly = false,
        useZ = true
    },
    {
        options = {
            {
                event = "miningmenu",
                icon = "fas fa-hard-hat",
                label = "Start Mining",
            },
         },
        job = {"all"},
        distance = 7.0
    })

    AddCircleZone("mining_job_three", vector3(2938.21, 2741.22, 43.32), 5.0, {
        name = "mining_job_three",
        debugPoly = false,
        useZ = true
    },
    {
        options = {
            {
                event = "miningmenu",
                icon = "fas fa-hard-hat",
                label = "Start Mining",
            },
         },
        job = {"all"},
        distance = 7.0
    })

end)