Citizen.CreateThread(function()
    -- Gun Runner
  
    AddBoxZone("cleanbois_stash_office", vector3(-1815.24, 440.83, 128.41), 0.8, 0.8, {
        name="cleanbois_stash_office",
        heading=0,
        --debugPoly=true,
        minZ=124.66,
        maxZ=128.46
    },
    {
        options = {
            {
                event = "open:storage",
                parms = "cleanbois_stash_office",
                icon = "fas fa-search",
                label = "Open Storage",
            },
        },
        job = {"gunrunner"},
        distance = 1.5
    })

    AddBoxZone("cleanboy_stash_langroom", vector3(-1791.64, 427.79, 132.26), 0.8, 0.8, {
        name="cleanboy_stash_langroom",
        heading=0,
        --debugPoly=true,
        minZ=129.21,
        maxZ=132.61
    },
    {
        options = {
            {
                event = "open:storage",
                parms = "cleanboy_stash_langroom",
                icon = "fas fa-search",
                label = "Open Storage",
            },
        },
        job = {"gunrunner"},
        distance = 1.5
    })

    AddBoxZone("cleanboy_stash_tonyroom", vector3(-1795.19, 437.73, 132.39), 0.8, 0.8, {
        name="cleanboy_stash_tonyroom",
        heading=0,
        --debugPoly=true,
        minZ=131.29,
        maxZ=132.49
    },
    {
        options = {
            {
                event = "open:storage",
                parms = "cleanboy_stash_tonyroom",
                icon = "fas fa-search",
                label = "Open Storage",
            },
        },
        job = {"gunrunner"},
        distance = 1.5
    })

    AddBoxZone("cleanboy_stash_secret", vector3(-1796.77, 439.1, 128.25), 0.8, 0.8, {
        name="cleanboy_stash_secret",
        heading=0,
        --debugPoly=true,
        minZ=127.2,
        maxZ=128.4
    },
    {
        options = {
            {
                event = "open:storage",
                parms = "cleanboy_stash_secret",
                icon = "fas fa-search",
                label = "Open Storage",
            },
        },
        job = {"gunrunner"},
        distance = 1.5
    })

    AddCircleZone("gunrunner", vector3(679.21, 1287.21, 360.7), 0.6, {
        name="gunrunner",
        heading=0,
        --debugPoly=true,
        minZ=-54.27,
        maxZ=-51.87
    },
    {
        options = {
            {
                event = "craft:guns:level:gunrunner",
                icon = "fas fa-wrench",
                label = "We got to push this out!"
            },
        },
        job = {"all"},
        distance = 2
    })

end)