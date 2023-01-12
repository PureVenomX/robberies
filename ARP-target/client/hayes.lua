
Citizen.CreateThread(function()
  ---- Hayes Auto ----

  AddBoxZone("hayes_autos_storage", vector3(-1421.2340087891, -455.22863769531, 35.909713745117), 4.65, 1, {
    name = "hayes_autos_storage",
    heading = 302,
    --debugPoly = true,
    minZ = 34.86,
    maxZ = 37.26
    },
    {
        options = {
            {
                event = "mech:check:internal:storage",
                parms = "hayes_autos",
                icon = "fas fa-hammer",
                label = "Check Hayes's Internals's Supply"
            },
            {
                event = "open:storage",
                parms = "hayes_autos",
                icon = "fas fa-box-open",
                label = "Open Hayes's Stash!"
            },
            {
                event = "mech:craft",
                icon = "fas fa-wrench",
                label = "Open Hayes's Crafting Book!"
            }
        },
        job = {"hayes_autos"},
        distance = 3
    })

    AddCircleZone("hayes_autos_keyfob", vector3(-1430.5, -454.49, 35.91), 0.23, {
        name = "hayes_autos_keyfob",
        --debugPoly = true,
        useZ = true
    },
    {
        options = {
            {
                event = "mech:get:keyfob",
                icon = "fas fa-key",
                label = "Grab Key Fob",
            },
        },
        job = {"hayes_autos"},
        distance = 1.5
    })

    AddCircleZone("hayes_backdoor", vector3(-1403.07, -451.35, 34.68), 1, {
        name = "hayes_backdoor",
        --debugPoly = true,
        useZ = true
    },
    {
        options = {
            {
                event = "hayes:backdoor:entershop",
                icon = "fas fa-key",
                label = "Enter Shop",
            },
        },
        job = {"hayes_autos"},
        distance = 1.5
    })

    AddCircleZone("hayes_shop_backdoor", vector3(-1417.24, -454.13, 36.41), 0.23, {
        name = "hayes_shop_backdoor",
        --debugPoly = true,
        useZ = true
    },
    {
        options = {
            {
                event = "hayes:backdoor:leaveshop",
                icon = "fas fa-key",
                label = "Leave Shop",
            },
        },
        job = {"hayes_autos"},
        distance = 1.5
    })

    -- Hayes Juke 
    AddCircleZone("hayes_juke", vector3(-1422.28, -457.01, 37.21), 0.6, {
        name="hayes_juke",
        useZ=true,
        --debugPoly=true
    }, {
        options = {
            {
                event = "hayes:request:song",
                icon = "fas fa-compact-disc",
                label = "Play Music",
            },
            {
                event = "hayes:change:volume",
                icon = "fas fa-volume-up",
                label = "Volume Changer",
            },
        },
        job = {"hayes_autos"},
        distance = 3.5
    })

    AddCircleZone("hayes_job_apply", vector3(-1424.35, -441.93, 36.2), 0.5, {
        name = "hayes_job_apply",
        debugPoly = false,
        useZ = true
    },
    {
        options = {
            {
                event = "jobapp:application:open",
                icon = "far fa-clipboard",
                parms = "hayes",
                label = "Apply to Hayes",
            },
        },
        job = {"all"},
        distance = 2
    })
    
    AddCircleZone("hayes_register", vector3(-1429.7, -453.98, 36.11), 0.35, {
        name="hayes_register",
        useZ=true,
        --debugPoly=true
    }, 
    {
        options = {
            {
                event = "hayes:get:receipt",
                parms = "1",
                icon = "fas fa-cash-register",
                label = "Make Payment",
            },
            {
                event = "hayes:register",
                parms = "1",
                icon = "fas fa-credit-card",
                label = "Charge Customer",
            },
         },
         job = {"all"},
        distance = 1.5
    })

    AddCircleZone("hayes_trade_receipts", vector3(-1427.13, -458.42, 35.91), 0.48, {
        name="hayes_trade_receipts",
        useZ=true,
        --debugPoly=true
    },
    {
        options = {
            {
                event = "hayes:cash:in",
                icon = "fas fa-cash-register",
                label = "Cash in receipts",
            },
         },
         job = {"hayes_autos"},
        distance = 1.5
    })

end)

RegisterNetEvent("hayes:backdoor:entershop")
AddEventHandler("hayes:backdoor:entershop", function()
    DoScreenFadeOut(1)
    Citizen.Wait(100)
    TriggerEvent('InteractSound_CL:PlayOnOne', 'elevator', 0.8)
    SetEntityCoords(PlayerPedId(), -1418.6284179688, -454.23162841797, 35.909694671631)
    DoScreenFadeIn(1000)
    Citizen.Wait(1000)
end)

RegisterNetEvent("hayes:backdoor:leaveshop")
AddEventHandler("hayes:backdoor:leaveshop", function()
    DoScreenFadeOut(1)
    Citizen.Wait(100)
    TriggerEvent('InteractSound_CL:PlayOnOne', 'elevator', 0.8)
    SetEntityCoords(PlayerPedId(), -1402.7436523438, -451.97250366211, 34.483108520508)
    DoScreenFadeIn(1000)
    Citizen.Wait(1000)
end)
