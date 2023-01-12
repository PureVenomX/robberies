Citizen.CreateThread(function()
  

    AddCircleZone("legion_job_apply", vector3(178.53, -908.75, 30.69), 1.0, {
        name = "legion_job_apply",
        debugPoly = false,
        useZ = true
    },
    {
        options = {
            {
                event = "jobapp:application:open",
                icon = "fas fa-clipboard",
                label = "Get a job!",
            },
        },
        job = {"all"},
        distance = 2
    })  

    AddCircleZone("legion_job_apply_two", vector3(179.72, -905.48, 30.69), 1.0, {
        name = "legion_job_apply_two",
        debugPoly = false,
        useZ = true
    },
    {
        options = {
            {
                event = "jobapp:application:open",
                icon = "fas fa-clipboard",
                label = "Get a job!",
            },
        },
        job = {"all"},
        distance = 2
    })

    AddBoxZone("epb", vector3(-1270.69, -1407.25, 4.37), 1, 0.8,{
        name = "epb",
        debugPoly = false,
        useZ = true,
    },
    {
        options = {
            {
                event = "epb:shop:open",
                icon = "fas fa-signal",
                label = "Heard you're looking for shit.",
            },
        },
        job = {"all"},
        distance = 2
    })
end)