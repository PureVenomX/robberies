
Citizen.CreateThread(function()
    AddCircleZone("doj_firearm_form", vector3(-550.20318603516, -191.63305664063, 38.361328125), 0.23, {
        name = "doj_firearm_form",
        --debugPoly = true,
        useZ = true
    },
    {
        options = {
            {
                event = "doj:firearm:form",
                icon = "fas fa-address-card",
                label = "Apply for Firearms License",
            },
        },
        job = {"all"},
        distance = 1.5
    })

    AddCircleZone("doj_apply", vector3(-546.82, -205.08, 38.57), 0.4, {
        name = "doj_apply",
        --debugPoly = true,
        useZ = true
    },
    {
        options = {
            {
                event = "jobapp:application:open",
                icon = "far fa-clipboard",
                parms = "doj",
                label = "Apply to DOJ",
            },
        },
        job = {"all"},
        distance = 1.5
    })

    -- Town Hall Metal Court room metal detectors
    exports["ARP-polyzone"]:AddBoxZone("townhall_metaldetectors", vector3(-536.11, -185.65, 38.22), 1, 1, {
        heading=30,
        --debugPoly=true,
        minZ=37.14,
        maxZ=39.66
    })


    exports["ARP-polyzone"]:AddBoxZone("townhall_metaldetectors_upper", vector3(-537.43, -186.43, 42.76), 1, 1, {
        heading=30,
        --debugPoly=true,
        minZ=41.74,
        maxZ=44.66
    })
end)
