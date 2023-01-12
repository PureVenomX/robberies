Citizen.CreateThread(function()
AddCircleZone("pharm_store", vector3(376.08, -830.22, 29.29), 1,{
        name = "pharm_store",
        --debugPoly = true,
        useZ = true
    },
    {
        options = {
            {
                event = "pharmacy:shop:open",
                icon = "fas fa-shopping-basket",
                label = "RX Store"
            }
        },
        job = {"all"},
        distance = 1.5
    })

    AddCircleZone("computer", vector3(375.22439575195, -828.60546875, 29.291412353516), 1,{
        name = "computer",
        --debugPoly = true,
        useZ = true
    },
    {
        options = {
            {
                event = "pharmacy:AttemptToLeave",
                icon = "fas fa-shopping-basket",
                label = "unlock the doors"
            }
        },
        job = {"all"},
        distance = 1.5
    })

end)