
Citizen.CreateThread(function()
    ---- Royal Realty ----
    AddCircleZone("realty_job_apply", vector3(-699.55, 272.07, 83.71), 0.3, {
        name = "realty_job_apply",
        debugPoly = false,
        useZ = true
    },
    {
        options = {
            {
                event = "jobapp:application:open",
                icon = "far fa-clipboard",
                parms = "realtysop",
                label = "Submit SOP Request",
            },
            {
                event = "jobapp:application:open",
                icon = "far fa-clipboard",
                parms = "realty",
                label = "Apply to Royal Realty",
            },
        },
        job = {"all"},
        distance = 2
    })

end)
