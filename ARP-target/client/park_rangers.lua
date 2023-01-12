Citizen.CreateThread(function()

    local rangervehped = {
        [1] = -1614285257
    }

    AddTargetModel(rangervehped, {
        options = {
            {
                event = "ARP-police:eyetarget",
                icon = "fas fa-car",
                label = "Park Ranger Garage",
                parms = { location = "parkranger" }
            },
        },
        job = { "police" },
        distance = 1.5
    })

    AddBoxZone("parkranger_sign_on", vector3(385.43, 794.42, 187.46), 0.5, 0.35, {
        name="parkranger_sign_on",
        heading=0,
        --debugPoly=true,
        minZ=187.26,
        maxZ=187.86
    }, 
    {
        options = {
            {
                event = "Police:duty",
                icon = "far fa-clipboard",
                label = "Sign On/Off Duty"
            },
        },
        job = {"all"},
        distance = 1.5
    })

    AddBoxZone("parkrangers_1", vector3(385.53, 796.08, 187.46), 0.3, 0.5, {
        name="parkrangers_1",
        heading=0,
        --debugPoly=true,
        minZ=186.46,
        maxZ=187.66
    },
    {
        options = {
            {
                event = "evidence:general",
                icon = "fas fa-trash",
                label = "Trash Locker (Clears On Tsunami)"
            },
        },
        job = {"police"},
        distance = 1.5
    })

    AddCircleZone("parkranger_evidence", vector3(385.59, 793.47, 187.46), 0.48, {
        name = "parkranger_evidence",
        debugPoly = false,
        useZ = true
    },
        {
        options = {
            {
                event = "Evidence:Open",
                icon = "fas fa-suitcase",
                label = "Open Evidence"
            },
            {
                event = "serial:search",
                icon = "fas fa-hand-holding",
                label = "Search Weapon Serial"
            },
        },
        job = { "police" },
        distance = 1.5
    })

end)