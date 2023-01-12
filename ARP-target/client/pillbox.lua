Citizen.CreateThread(function()

    ---- EMS ----

    AddCircleZone("emsdutys", vector3(310.25, -597.52, 43.28), 0.2, {
        name="emsdutys",
        useZ=false,
        --debugPoly=true
    },
    {
        options = {
            {
                event = "emsduty",
                icon = "far fa-clipboard",
                label = "Sign On/Off Duty"
            }
        },
        job = {"all"},
        distance = 1.5
    })
    
    AddCircleZone("pillbox", vector3(306.17, -602.01, 43.28), 0.5, {
        name="pillbox",
        useZ=false,
        --debugPoly=true
    },
    {
        options = {
            {
                event = "ems:general",
                icon = "fas fa-shopping-basket",
                label = "EMS Supplies"
            },
            {
                event = "ems:attempt:badge",
                icon = "fas fa-id-badge",
                label = "Get Badge"
            },
        },
        job = {"ems"},
        distance = 1.5
    })

    AddCircleZone("emstorage", vector3(310.32, -569.48, 43.28), 0.56, {
        name="emstorage",
        useZ=false,
        --debugPoly=true
    },
    {
        options = {
            {
                event = "open:storage",
                parms = "ems",
                icon = "fas fa-shopping-basket",
                label = "Lab Storage"
            }
        },
        job = {"ems"},
        distance = 1.5
    })

    AddCircleZone("emscraftmorphine", vector3(242.79, -1371.48, 39.53), 0.4, {
        name="emscraftmorphine",
        useZ=false,
        --debugPoly=true
    },
    {
        options = {
            {
                event = "ems:craft:morphine",
                icon = "fas fa-shopping-basket",
                label = "Fill Syringes"
            }
        },
        job = {"ems"},
        distance = 1.5
    })

    AddCircleZone("emspreparevials", vector3(250.77, -1373.21, 39.53), 0.4, {
        name="emspreparevials",
        useZ=false,
        --debugPoly=true
    },
    {
        options = {
            {
                event = "ems:craft:vials",
                icon = "fas fa-shopping-basket",
                label = "Prepare Vials"
            }
        },
        job = {"ems"},
        distance = 1.5
    })

    AddCircleZone("emsgathersyringes", vector3(242.94, -1368.86, 39.53), 0.41, {
        name="emsgathersyringes",
        useZ=false,
        --debugPoly=true
    },
    {
        options = {
            {
                event = "ems:craft:syringes",
                icon = "fas fa-shopping-basket",
                label = "Clean Syringes"
            }
        },
        job = {"ems"},
        distance = 1.5
    })

    AddCircleZone("emscraftviagra", vector3(247.77, -1375.77, 39.53), 0.43, {
        name="emscraftviagra",
        useZ=false,
        --debugPoly=true
    },
    {
        options = {
            {
                event = "ems:craft:viagra",
                icon = "fas fa-shopping-basket",
                label = "Need Viagra?"
            }
        },
        job = {"ems"},
        distance = 1.5
    })

    ---- Check In ----

    AddBoxZone("sandynan", vector3(2426.48, 4020.73, 36.75), 4.6, 10.2, {
        name = "sandynan",
        --debugPoly = true,
        heading = 339,
        minZ = 34.75,
        maxZ = 39.75
    },
    {
        options = {
            {
                event = "sandy:nancy",
                icon = "fas fa-clipboard",
                label = "Get healed"
            },
        },
        job = {"all"},
        distance = 5.5
    })

    AddCircleZone("checkin", vector3(307.62091064453, -595.21759033203, 44.123142242432), 0.33, {
        name="checkin",
        useZ=false,
        --debugPoly=true
    },
    {
        options = {
            {
                event = "attempt:check-in",
                icon = "fas fa-clipboard",
                label = "Check into hospital"
            },
            {
                event = "buy:ems:insurance",
                icon = "fas fa-laptop-medical",
                label = "Buy Health Insurance"
            },
            {
                event = "attempt:change:check-in",
                icon = "fas fa-adjust",
                label = "Disable/Enable Check-in (EMS/PD USE)"
            },
        },
        job = {"all"},
        distance = 2.5
    })

    AddCircleZone("ems_bodyparts", vector3(308.45, -562.2, 43.28), 0.5, {
        name="ems_bodyparts",
        useZ=false,
        --debugPoly=true
    },
    {
        options = {
            {
                event = "ems:craft:bodyparts",
                icon = "",
                label = "Was something in there?"
            },
        },
        job = {"ems"},
        distance = 2.5
    })

    local emsvehped = {
        [1] = 2139205821
    }

    AddTargetModel(emsvehped, {
        options = {
            {
                event = "EMSSpawnVeh",
                icon = "fas fa-car",
                label = "EMS Garage"
            },
            {
                event = "police:get:keyfob",
                icon = "fas fa-key",
                label = "Get Key Fob"
            }
        },
        job = { "ems" },
        distance = 1.5
    })

    local emsheliped = {
        [1] = -163714847
    }

    AddTargetModel(emsheliped, {
        options = {
            {
                event = "spawn:hei:ems",
                icon = "fas fa-helicopter",
                label = "EMS Big Air",
                parms = { model = "polmav" }
            },
            {
                event = "spawn:hei:ems",
                icon = "fas fa-helicopter",
                label = "EMS Little Air",
                parms = { model = "mh6" }
            },
        },
        job = { "ems" },
        distance = 1.5
    })

    AddBoxZone("hospitalroof1", vector3(332.35, -597.32, 43.28), 0.2, 1, {
        name = "hospitalroof2",
        heading = 340,

        minZ = 43.48,
        maxZ = 43.78
    },
    {
        options = {
            {
                event = "hospital:roof",
                icon = "fas fa-arrow-alt-circle-up",
                label = "Enter the Elevator to the Roof"
            },
        },
        job = { "all" },
        distance = 5.0
    })

    AddBoxZone("hospitalroof", vector3(330.3, -602.77, 43.28), 0.2, 1, {
        name = "hospitalroof",
        heading = 340,

        minZ = 43.48,
        maxZ = 43.88
    },
    {
        options = {
            {
                event = "hospital:lower",
                icon = "fas fa-arrow-alt-circle-down",
                label = "Enter the Elevator to the Bottom Floor"
            }
        },
        job = { "all" },
        distance = 10.0
    })

    AddBoxZone("hospitallowerup", vector3(344.32, -584.58, 28.8), 0.15, 1, {
        name = "hospitallowerup",
        heading = 340,
        minZ = 29.0,
        maxZ = 29.25
    },
    {
        options = {
            {
                event = "hospital:elevatorup",
                icon = "fas fa-arrow-alt-circle-up",
                label = "Enter the Elevator to the Main Hospital"
            }
        },
        job = { "all" },
        distance = 5.0
    })

    AddBoxZone("hospitalroof2", vector3(345.71, -580.91, 28.8), 0.2, 1, {
        name = "hospitalroof2",
        heading = 340,
        minZ = 29.0,
        maxZ = 29.35
    },
    {
        options = {
            {
                event = "hospital:roof",
                icon = "fas fa-arrow-alt-circle-up",
                label = "Enter the Elevator to the Roof"
            }
        },
        job = { "all" },
        distance = 5.0
    })

    AddBoxZone("hospitalrooftomain", vector3(338.23, -583.74, 74.16), 3.0, 1, {
        name = "hospitalrooftomain",
        heading = 340,

        minZ = 73.16,
        maxZ = 75.36
    },
    {
        options = {
            {
                event = "hospital:roofexit",
                icon = "fas fa-arrow-alt-circle-down",
                label = "Enter the Door to leave the roof!"
            }
        },
        job = { "all" },
        distance = 5.0
    })

    AddBoxZone("hospitalmorgueexit", vector3(276.11, -1361.72, 24.54), 2.4, 1, {
        name = "hospitalmorgueexit",
        heading = 319,
        --debugPoly=true,
        minZ = 22.14,
        maxZ = 26.14
    },
    {
        options = {
            {
                event = "hospital:morgexit",
                icon = "fas fa-arrow-alt-circle-down",
                label = "Enter the Door to leave the morgue!"
            }
        },
        job = { "all" },
        distance = 5.0
    })

    AddBoxZone("hospitalmorgue", vector3(325.56, -603.49, 43.28), 0.2, 1, {
        name = "hospitalmorgue",
        heading = 341,
        --debugPoly=true,
        minZ = 40.68,
        maxZ = 44.68
    },
    {
        options = {
            {
                event = "hospital:morgue",
                icon = "fas fa-arrow-alt-circle-up",
                label = "Enter the Elevator to the morgue!"
            }
        },
        job = { "all" },
        distance = 5.0
    })

end)
