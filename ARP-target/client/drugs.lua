Citizen.CreateThread(function()

AddCircleZone("snow", vector3(993.51, 55.42, 75.26), 0.2, {
    name = "snow",
    debugPoly = false,
    useZ = true
},
{
    options = {
        {
            event = "coke:sell",
            icon = "fas fa-suitcase",
            label = "Take this shit downstairs and ship it out.",
        },
     },
    job = {"all"},
    distance = 1.5
})

end)