Citizen.CreateThread(function()
    AddBoxZone("washing_lady", vector3(1136.47, -991.33, 47.53), 0.5, 0.4, {
        name = "washing_lady",
        --debugPoly = true,
        useZ = true
    },
    {
        options = {
            {
                event = "washing:exchange",
                icon = "fas fa-hand-holding",
                label = "Hi My Names Emma, Lets talk"
            },
        },
        job = {"all"},
        distance = 2
    })

end)