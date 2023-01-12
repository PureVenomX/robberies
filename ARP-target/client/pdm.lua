
Citizen.CreateThread(function()
    AddCircleZone("pdm_open_catalog", vector3(-32.05, -1097.48, 27.27), 0.7, {
        name="pdm_open_catalog",
        useZ=true,
        --debugPoly=true
    },
    {
        options = {
            {
                event = "ARP-cardealer:openMenu",
                icon = "fas fa-car",
                label = "Open Catalog (PDM)"
            },
        },
        job = {"all"},
        distance = 2.5
    })
end)