Citizen.CreateThread(function()

    AddCircleZone("paleto_duty_police", vector3(-450.75, 6012.58, 31.06), 0.9, {
        name="paleto_duty_police",
        debugPoly = false,
        useZ = true
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

local paletopvehped = {
    [1] = 1939545845
}

AddCircleZone("paleto_spawn_vehicle", vector3(-458.28, 6017.7, 31.49), 0.9, {
    name="paleto_spawn_vehicle",
    useZ=false,
    --debugPoly=true
},
        {
            options = {
                {
                    event = "ARP-police:eyetarget",
                    icon = "fas fa-car",
                    label = "Paleto Garage",
                    parms = { location =  "paleto" }
                },
            },
            job = {"police"},
            distance = 1.5
        })

AddCircleZone("paleto_evidence_open", vector3(-443.08, 6006.98, 25.08), 0.9, {
    name = "paleto_evidence_open",
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
    },
    job = {"police"},
    distance = 2
})

AddCircleZone("paleto_armory", vector3(-453.12, 6018.85, 31.76), 1, {
    name="paleto_armory",
    debugPoly = false,
    useZ = true
},
{
    options = {
        {
            event = "police:general",
            icon = "fas fa-clipboard",
            label = "PD Armory"
        },
        {
            event = "police:attempt:badge",
            icon = "fas fa-id-badge",
            label = "Get Badge"
        },
    },
    job = {"police"},
    distance = 2
})

AddCircleZone("paleto_evidence",vector3(-440.22, 6009.65, 24.73), 0.8, {
    name="paleto_evidence",
    debugPoly = false,
    useZ = true
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

end)