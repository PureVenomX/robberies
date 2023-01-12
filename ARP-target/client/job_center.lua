Citizen.CreateThread(function()
    AddCircleZone("job_center_firearm", vector3(18.42, -1109.06, 30.0), 0.49000000000001, {
        name = "job_center_firearm",
        --debugPoly = true,
        useZ = true
    },
        {
        options = {
            {
                event = "job:center:firearm:apply",
                icon = "fas fa-door-open",
                label = "Apply for Firearm License"
            },
        },
        job = { "all" },
        distance = 2
        })
end)
