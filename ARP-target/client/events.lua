local coords = {}

RegisterNetEvent("target:client:get:result")
AddEventHandler("target:client:get:result", function(list)
    coords = list
end)

Citizen.CreateThread(function()
    TriggerServerEvent('target:server:get')
    Citizen.Wait(500)

    --- Police ---
    AddBoxZone("duty_police", vector3(441.87, -981.92, 30.69), 0.9, 0.5, {
        name = "duty_police",
        heading = 0,
        minZ = 30.49,
        maxZ = 31.24
    },
        {
        options = {
            {
                event = "Police:duty",
                icon = "far fa-clipboard",
                label = "Sign On/Off Duty"
            },
        },
        job = { "all" },
        distance = 1.5
        })

    AddBoxZone("released_impound", vector3(442.43, -984.04, 30.69), 0.8, 0.5, {
        name = "released_impound",
        heading = 210,
        minZ = 30.69,
        maxZ = 30.89
    },
        {
        options = {
            {
                event = "police:released:car",
                icon = "far fa-clipboard",
                label = "Police Impound Release"
            },
        },
        job = { "all" },
        distance = 1.5
        })

    AddCircleZone("pd_job_apply", vector3(434.2, -985.12, 31.06), 0.5, {
        name = "pd_job_apply",
        debugPoly = false,
        useZ = true
    },
        {
        options = {
            {
                event = "jobapp:application:open",
                icon = "far fa-clipboard",
                parms = "pd",
                label = "Apply to PD",
            },
        },
        job = { "all" },
        distance = 2
        })

    AddBoxZone("arcade-sign-in", vector3(739.46, -813.15, 24.27), 0.5, 0.5, {
        name = "arcade-sign-in",
        heading = 0,
        minZ = 24.07,
        maxZ = 24.27
    },
        {
        options = {
            {
                event = "arcade:duty",
                icon = "far fa-clipboard",
                label = "Sign On/Off Duty"
            },
        },
        job = { "all" },
        distance = 1.5
        })

    AddBoxZone("arcade-hacking-games", vector3(755.02, -818.27, 23.27), 3.0, 3, {
        name = "arcade-hacking-games",
        heading = 0,
        minZ = 22.87,
        maxZ = 24.87
    },
        {
        options = {
            {
                event = "ARP-hacking-games-menu",
                icon = "fas fa-gamepad",
                label = "Start Playing"
            },
        },
        job = { "all" },
        distance = 5.0
        })

    AddBoxZone("lspd_evidence", vector3(475.78, -993.94, 26.27), 0.8, 2, {
        name = "lspd_evidence",
        heading = 90,
        minZ = 25.27,
        maxZ = 27.62
    },
        {
        options = {
            {
                event = "evidence:general",
                icon = "fas fa-trash",
                label = "Trash Locker (Clears On Tsunami)"
            },
        },
        job = { "police" },
        distance = 1.5
        })


    AddBoxZone("lspd_armory", vector3(482.56, -994.4, 30.69), 1, 1, {
        name = "lspd_armory",
        heading = 0,
        minZ = 27.69,
        maxZ = 31.69
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
        job = { "police" },
        distance = 2.5
        })
    
    AddCircleZone("SWAT", vector3(487.91, -996.93, 30.94), 0.59, {
        name="SWAT",
        useZ=true,
        --debugPoly=true)
    },
    {
        options = {
            {
                event = "swat:general",
                icon = "fas fa-clipboard",
                label = "PD SWAT Armory"
            },
            {
                event = "police:attempt:badge",
                icon = "fas fa-id-badge",
                label = "Get Badge"
            },
        },
        job = { "police" },
        distance = 2.5
        })

    -- AddBoxZone("davis_armory", vector3(364.97, -1604.33, 25.45), 1, 1, {
    --     name = "davis_armory",
    --     heading = 325,
    --     --debugPoly=true,
    --     minZ = 24.45,
    --     maxZ = 28.45
    -- },
    --     {
    --     options = {
    --         {
    --             event = "police:general",
    --             icon = "fas fa-clipboard",
    --             label = "PD Armory"
    --         },
    --         {
    --             event = "police:attempt:badge",
    --             icon = "fas fa-id-badge",
    --             label = "Get Badge"
    --         },
    --     },
    --     job = { "police" },
    --     distance = 2.5
    --     })

    -- AddBoxZone("sandy_armory", vector3(1835.71, 3686.88, 34.19), 1, 1, {
    --     name = "sandy_armory",
    --     heading = 28,
    --     --debugPoly=true
    -- },
    --     {
    --             options = {
    --                 {
    --                     event = "police:general",
    --                     icon = "fas fa-clipboard",
    --                     label = "PD Armory"
    --                 },
    --                 {
    --                     event = "police:attempt:badge",
    --                     icon = "fas fa-id-badge",
    --                     label = "Get Badge"
    --                 },
    --             },
    --             job = { "police" },
    --             distance = 2.5
    --     })

    AddBoxZone("lspd_armory_AR", vector3(485.33, -994.37, 30.69), 1, 1, {
        name = "lspd_armory_AR",
        heading = 0,
        minZ = 30.49,
        maxZ = 32.49
    },
        {
        options = {
            {
                event = "police:AR",
                icon = "fas fa-clipboard",
                label = "PD Armory"
            },
        },
        job = { "police" },
        distance = 2.5
        })

    AddBoxZone("lspd_armory2", vector3(369.36, -1598.7, 29.29), 2.6, 1, {
        name = "lspd_armory2",
        heading = 50,
        minZ = 29.09,
        maxZ = 30.49
    },
        {
        options = {
            {
                event = "police:general",
                icon = "fas fa-clipboard",
                label = "Davis Armory"
            },
            {
                event = "evidence:general",
                icon = "fas fa-trash",
                label = "Trash Locker"
            },
            {
                event = "serial:search",
                icon = "fas fa-hand-holding",
                label = "Search Weapon Serial"
            },
        },
        job = { "police" },
        distance = 2.5
        })

    AddBoxZone("serial_search", vector3(485.5, -989.33, 30.69), 0.5, 0.5, {
        name = "serial_search",
        heading = 290,
        minZ = 30.69,
        maxZ = 31.29
    },
        {
        options = {
            {
                event = "serial:search",
                icon = "fas fa-hand-holding",
                label = "Search Weapon Serial"
            },
        },
        job = { "police" },
        distance = 1.5
        })

    AddBoxZone("evidence_open", vector3(474.94, -1004.45, 26.27), 0.8, 2, {
        name = "evidence_open",
        heading = 0,
        --debugPoly=true,
        minZ = 25.27,
        maxZ = 27.27
    },
        {
        options = {
            {
                event = "Evidence:Open",
                icon = "fas fa-suitcase",
                label = "Open Evidence"
            },
        },
        job = { "police" },
        distance = 2
        })

    AddBoxZone("key_holder_01", vector3(469.59, -974.86, 26.27), 0.5, 0.5, {
        name = "key_holder_01",
        heading = 0,
        --debugPoly=true,
        minZ = 26.67,
        maxZ = 27.17
    },
        {
        options = {
            {
                event = "police:get:keyfob",
                icon = "fas fa-key",
                label = "Grab Key Fob",
            },
        },
        job = { "police" },
        distance = 3.5
        })

    AddBoxZone("key_holder_02", vector3(469.64, -992.5, 26.27), 0.5, 0.5, {
        name = "key_holder_02",
        heading = 355,
        --debugPoly=true,
        minZ = 26.67,
        maxZ = 27.12
    },
        {
        options = {
            {
                event = "police:get:keyfob",
                icon = "fas fa-key",
                label = "Grab Key Fob",
            },
        },
        job = { "police" },
        distance = 3.5
        })

    local doors = {
        "bodyshell",
        "engine",
    }

    AddTargetVehicle(doors,
        {
        options = {
            {
                event = "police:forceEnter",
                icon = "fas fa-sign-in-alt",
                label = "Seat Player!"
            },
            {
                event = "unseatPlayer",
                icon = "fas fa-sign-out-alt",
                label = "Unseat Player!"
            },
            {
                event = "keys:give",
                icon = "fas fa-key",
                label = "Give The Car Key!"
            },
            {
                event = "FlipVehicle",
                icon = "fas fa-undo",
                label = "Flip the Vehicle!"
            },
            {
                event = "veh:requestUpdate",
                icon = "fas fa-wrench",
                label = "Examine Internals!"
            }
            -- {
            --     event = "impoundVeh",
            --     icon = "fas fa-truck",
            --     label = "Impound Vehicle!"
            -- },
        },
        job = { "all" },
        distance = 3.5
        })

    local trunk = {
        "boot",
    }

    AddTargetVehicle(trunk,
        {
        options = {
            {
                event = "ped:forceTrunkSelf",
                icon = "fas fa-user-secret",
                label = "Trunk Get in!"
            },
        },
        job = { "all" },
        distance = 1.5
        })

    local Payphones = {
        [1] = 1158960338,
        [2] = -78626473,
        [3] = 1281992692,
        [4] = -1058868155,
        [5] = -429560270,
        [6] = -2103798695,
        [7] = 295857659,
        [8] = -1559354806
    }

    AddTargetModel(Payphones, {
        options = {
            {
                event = "payphone:ui",
                icon = "fas fa-phone-square-alt",
                label = "Make a call! (Anonymous)"
            }
        },
        job = { "all" },
        distance = 1.5
    })

    -- Union --

    local Goldprop = {
        [1] = 1483319544
    }

    AddTargetModel(Goldprop, {
        options = {
            {
                event = "union:grab",
                icon = "fas fa-hands",
                label = "grab"
            },

        },
		job = {"all"},
        distance = 2.5
    })

    -- Dumpsters --

    local Dumpster1 = {
        [1] = GetHashKey('prop_dumpster_01a'),
        [2] = GetHashKey('prop_dumpster_02a'),
        [3] = GetHashKey('prop_dumpster_02b'),
        [4] = GetHashKey('prop_dumpster_4a'),
        [5] = GetHashKey('prop_dumpster_4b'),
        [6] = GetHashKey('prop_dumpster_3a'),
        [7] = GetHashKey('prop_skip_02a'),
        [8] = GetHashKey('prop_skip_03'),
        [9] = GetHashKey('prop_skip_04'),
        [10] = GetHashKey('prop_skip_05a'),
        [11] = GetHashKey('prop_skip_06a'),
        [12] = GetHashKey('prop_skip_08a'),
        [13] = GetHashKey('prop_skip_10a')
    }

    AddTargetModel(Dumpster1, {
        options = {
            {
                event = "search:dumpster",
                icon = "fas fa-trash-alt",
                label = "Dumpster Dive"
            }
        },
        job = { "all" },
        distance = 1.5
    })

    ---- ATMS ----

    local atms = {
        -1126237515,
        506770882,
        -870868698,
        150237004,
        -239124254,
        -1364697528,
    }
    AddTargetModel(
        atms,
        {
            options = {
                {
                    event = "bank:checkATM",
                    icon = "fas fa-credit-card",
                    label = "Use ATM"
                }
            },
            job = {"all"},
            distance = 2
        }
    )

    --- Vending Machines ----

    local food = {
        [1] = -654402915,
        [2] = -1034034125,
        [3] = 1425833142
    }

    local coffee = {
        [1] = 690372739,
        [2] = -1318035530,
        [3] = -2015792788
    }

    local water = {
        --[1] = 1099892058 TODO REPLACE
    }

    local soda = {
        [1] = 1114264700,
        [2] = -504687826,
        [3] = 992069095,
        [4] = -1741437518,
        [5] = -1317235795
    }

    AddTargetModel(food, {
        options = {
            {
                event = "shops:food",
                icon = "fas fa-cookie-bite",
                label = "Buy your self a nice snack!"
            }
        },
        job = { "all" },
        distance = 1.5
    })

    AddTargetModel(coffee, {
        options = {
            {
                event = "shops:coffee",
                icon = "fas fa-mug-hot",
                label = "Make a nice cup of Coffee!"
            }
        },
        job = { "all" },
        distance = 1.5
    })

    AddTargetModel(water, {
        options = {
            {
                event = "shops:water",
                icon = "fas fa-tint",
                label = "Drink a Refreshing Bottle Of Water!"
            }
        },
        job = { "all" },
        distance = 1.5
    })

    AddTargetModel(soda, {
        options = {
            {
                event = "shops:soda",
                icon = "fas fa-wine-bottle",
                label = "Drink a Refreshing Can of Soda!"
            }
        },
        job = { "all" },
        distance = 1.5
    })

    ---- Mega Mall ----

    local megamall = {
        [1] = 1024089777
    }

    AddTargetModel(megamall, {
        options = {
            {
                event = "toolshop:general",
                icon = "fas fa-shopping-basket",
                label = "Purchase Tools"
            }
        },
        job = { "all" },
        distance = 2
    })

    ---- 24/7's ----

    local general_stores = {
        [1] = 416176080
    }

    AddTargetModel(general_stores, {
        options = {
            {
                event = "shop:general",
                icon = "fas fa-shopping-basket",
                label = "Purchase Goods"
            }
        },
        job = { "all" },
        distance = 2
    })

    local otto_general_stores = {
        [1] = 1520708641
    }

    AddTargetModel(otto_general_stores, {
        options = {
            {
                event = "otto:general",
                icon = "fas fa-shopping-basket",
                label = "Purchase Goods"
            }
        },
        job = { "all" },
        distance = 2
    })

    ---- Weapon Shops ----

    local Weapon_shops = {
        [1] = 1161072059
    }

    AddTargetModel(Weapon_shops, {
        options = {
            {
                event = "weapon:general",
                icon = "fas fa-wrench",
                label = "Purchase Weapons"
            }
        },
        job = { "all" },
        distance = 2
    })

    ---- Rob's Liquor ----

    local ROBS_LIQUOR = {
        [1] = 1625728984
    }

    AddTargetModel(ROBS_LIQUOR, {
        options = {
            {
                event = "robs:general", -- Need to do
                icon = "fas fa-wine-glass",
                label = "Purchase Liquor"
            }
        },
        job = { "all" },
        distance = 2
    })


    ---- Chicken Job ----
    AddBoxZone("skin_chicken", vector3(-95.27, 6207.54, 31.03), 1.0, 2, {
        name = "skin_chicken",
        heading = 135,
        minZ = 27.83,
        maxZ = 31.83
    },
        {
        options = {
            {
                event = "portionthechicken",
                icon = "fas fa-utensils",
                label = "Cut the chicken",
            },
        },
        job = { "all" },
        distance = 2.5
        })

    AddBoxZone("skin_chicken2", vector3(-99.42, 6205.62, 31.03), 1.6, 1, {
        name = "skin_chicken2",
        heading = 315,
        minZ = 28.03,
        maxZ = 32.03
    },
        {
        options = {
            {
                event = "portionthechicken",
                icon = "fas fa-utensils",
                label = "Cut the chicken",
            },
        },
        job = { "all" },
        distance = 2.5
        })

    AddBoxZone("skin_chicken3", vector3(-99.83, 6201.95, 31.03), 2.0, 1, {
        name = "skin_chicken3",
        heading = 315,

        minZ = 28.23,
        maxZ = 32.23
    },
        {
        options = {
            {
                event = "portionthechicken",
                icon = "fas fa-utensils",
                label = "Cut the chicken",
            },
        },
        job = { "all" },
        distance = 2.5
        })

    AddBoxZone("packaged_chicken", vector3(-103.57, 6208.6, 31.03), 15.0, 1, {
        name = "packaged_chicken",
        heading = 315,

        minZ = 28.23,
        maxZ = 32.63
    },
        {
        options = {
            {
                event = "packingchicken",
                icon = "fas fa-utensils",
                label = "Package Chicken",
            },
        },
        job = { "all" },
        distance = 2.5
        })

    ---- Prison ----

    AddCircleZone("prison1", vector3(1777.5, 2560.23, 45.67), 0.95, {
        name = "prison1",
        debugPoly = false,
        useZ = true
    },
        {
        options = {
            {
                event = "slushy:general",
                icon = "fas fa-ice-cream",
                label = "Make Slushy"
            }
        },
        job = { "all" },
        distance = 1.5
        })

    AddCircleZone("prison2", vector3(1780.95, 2560.14, 45.67), 0.75, {
        name = "prison2",
        debugPoly = false,
        useZ = true
    },
        {
        options = {
            {
                event = "pfood:general",
                icon = "fas fa-bread-slice",
                label = "Prison Food"
            }
        },
        job = { "all" },
        distance = 1.5
        })

    AddCircleZone("prisonmeth", vector3(1777.08, 2481.4, 49.69), 0.32, {
        name = "prisonmeth",
        debugPoly = false,
        useZ = true
    },
        {
        options = {
            {
                event = "pmeth:general",
                icon = "fas fa-hand-sparkles",
                label = "Clean this toilet"
            }
        },
        job = { "all" },
        distance = 1.5
        })

    AddCircleZone("prison3", vector3(1663.67, 2513.63, 44.81), 0.5, {
        name = "prison3",
        debugPoly = false,
        useZ = true
    },
        {
        options = {
            {
                event = "prisonap:general",
                icon = "fas fa-question",
                label = "What?"
            }
        },
        job = { "all" },
        distance = 1.5
        })

    AddCircleZone("prison4", vector3(1776.9, 2565.0, 45.67), 0.5, {
        name = "prison4",
        debugPoly = false,
        useZ = true
    },
        {
        options = {
            {
                event = "prisonlp:general",
                icon = "fas fa-question",
                label = "What ?"
            }
        },
        job = { "all" },
        distance = 1.5
        })

    AddCircleZone("reclaim", vector3(1840.23, 2578.43, 46.01), 0.28, {
        name = "reclaim",
        debugPoly = false,
        useZ = true
    },
        {
        options = {
            {
                event = "jailbreak:reclaimitems",
                icon = "fas fa-undo",
                label = "Reclaim Possessions"
            }
        },
        job = { "all" },
        distance = 1.5
        })

    ---- VU ----

    AddBoxZone("VU_register", vector3(129.13, -1284.96, 29.27), 0.5, 0.5, {
        name = "VU_register",
        heading = 305,
        --debugPoly=true,
        minZ = 29.27,
        maxZ = 29.67
    },
        {
        options = {
            {
                event = "vanilla:get:receipt",
                parms = "1",
                icon = "fas fa-cash-register",
                label = "Make Payment",
            },
            {
                event = "vanilla:register",
                parms = "1",
                icon = "fas fa-credit-card",
                label = "Charge Customer",
            },
        },
        job = { "all" },
        distance = 3.5
        })

    AddBoxZone("VU_cash_reciepts", vector3(132.98, -1286.05, 29.27), 0.5, 0.5, {
        name = "VU_cash_reciepts",
        heading = 30,
        --debugPoly=true,
        minZ = 29.27,
        maxZ = 29.67
    },
        {
        options = {
            {
                event = "vanilla:cash:in",
                icon = "fas fa-cash-register",
                label = "Cash in receipts",
            },
        },
        job = { "vanilla_unicorn" },
        distance = 3.5
        })

    AddCircleZone("tuner_booth", vector3(130.94, -3006.96, 7.04), 0.6, {
        name = "tuner_booth",
        useZ = true,
        --debugPoly=true
    },
        {
        options = {
            {
                event = "tunershop:request:song",
                icon = "fas fa-compact-disc",
                label = "Play Music",
            },
            {
                event = "tunershop:change:volume",
                icon = "fas fa-volume-up",
                label = "Volume Changer",
            },
        },
        job = { "tuner_shop" },
        distance = 3.5
        })


    -- Washing Spots --

    -- Haute
    AddCircleZone("taco:deliver:haute", vector3(-21.49, 219.34, 106.58), 1, {
        name = "taco:deliver:haute",
        useZ = true,
        --debugPoly=true
    },
        {
        options = {
            {
                event = "deliver:haute",
                icon = "fas fa-shopping-bag",
                label = "Deliver Takeout"
            },
        },
        job = { "all" },
        distance = 2.0
        })

    -- Attack A Taco
    AddCircleZone("taco:deliver:taco", vector3(445.83, -1243.4, 30.27), 1, {
        name = "taco:deliver:taco",
        useZ = true,
        --debugPoly=true
    },
        {
        options = {
            {
                event = "deliver",
                icon = "fas fa-shopping-bag",
                label = "Deliver Takeout"
            },
        },
        job = { "all" },
        distance = 2.0
        })

    -- Lucky Plucker
    AddCircleZone("taco:deliver:lucky", vector3(152.1, -1478.4, 29.14), 1, {
        name = "taco:deliver:lucky",
        useZ = true,
        --debugPoly=true
    },
        {
        options = {
            {
                event = "deliver",
                icon = "fas fa-shopping-bag",
                label = "Deliver Takeout"
            },
        },
        job = { "all" },
        distance = 2.0
        })

    -- Sandy Beers
    AddCircleZone("taco:deliver:sandy", vector3(1944.86, 3841.08, 32.12), 3, {
        name = "taco:deliver:sandy",
        useZ = true,
        --debugPoly=true
    },
        {
        options = {
            {
                event = "deliver:sandy",
                icon = "fas fa-shopping-bag",
                label = "Deliver Takeout"
            },
        },
        job = { "all" },
        distance = 5.0
        })

    ---- Tuner Shop ----

    AddBoxZone("Tuner", vector3(129.08, -3031.33, 7.04), 1.6, 0.9, {
        name = "Tuner",
        heading = 345,
        minZ = 3.24,
        maxZ = 7.24
    },
        {
        options = {
            {
                event = "mech:check:internal:storage",
                parms = "tuner_shop",
                icon = "fas fa-hammer",
                label = "Check Tuner Shop's Internals's Supply"
            },
            {
                event = "open:storage",
                parms = "Tuner",
                icon = "fas fa-box-open",
                label = "Open Tuner Shop's Stash!"
            },
            {
                event = "mech:craft",
                icon = "fas fa-wrench",
                label = "Open Tuner Shop's Crafting Book!"
            }
        },
        job = { "tuner_shop" },
        distance = 3
        })


    ---- Smelter ----

    AddCircleZone("smelter", vector3(1109.83, -2008.2, 31.06), 2.0, {
        name = "smelter",
        debugPoly = false,
        useZ = false
    },
        {
        options = {
            {
                event = "smelter-smelt",
                icon = "fas fa-shopping-basket",
                label = "Smelt yo goods"
            }
        },
        job = { "all" },
        distance = 10.0
        })

    -- Meth --
    AddCircleZone("meth_enter", vector3(1532, 1728.109, 109.9189), 0.7, {
        name = "meth_enter",
        debugPoly = false,
        useZ = true
    },
    {
        options = {
            {
                event = "meth:enter",
                icon = "fas fa-arrow-alt-circle-up",
                label = "Enter"
            }
        },
        job = { "all" },
        distance = 1.5
    })

    AddCircleZone("meth_shutdown", vector3(1269.59, 2997.82, 43.97), 0.7, {
        name = "meth_shutdown",
        debugPoly = false,
        useZ = true
    },
    {
        options = {
            {
                event = "meth:bust",
                icon = "fas fa-arrow-alt-circle-up",
                label = "Shut Down"
            }
        },
        job = { "police" },
        distance = 1.5
    })

    AddBoxZone("meth_exit", vector3(996.53, -3200.66, -36.39), 0.2, 1.5, {
        name = "meth_exit",
        heading = 270,
        --debugPoly=true,
        minZ = -38.99,
        maxZ = -34.99
    },
    {
        options = {
            {
                event = 'meth:exit',
                icon = "fas fa-arrow-alt-circle-down",
                label = "Leave"
            }
        },
        job = { "all" },
        distance = 5.0
    })

    local pdheliped = {
        [1] = -1422914553
    }

    AddTargetModel(pdheliped, {
        options = {
            {
                event = "spawn:hei:pd",
                icon = "fas fa-helicopter",
                label = "Police Air Garage",
                parms = { location = "mrpd" }
            }
        },
        job = { "police" },
        distance = 1.5
    })

    local pdvehped = {
        [1] = -994634286
    }

    AddTargetModel(pdvehped, {
        options = {
            {
                event = "ARP-police:eyetarget",
                icon = "fas fa-car",
                label = "Police Garage",
                parms = { location = "mrpd" }
            }
        },
        job = { "police" },
        distance = 1.5
    })

    AddCircleZone("sandy_pd_garage", vector3(1851.78, 3699.59, 33.97), 0.3, {
        name = "sandy_pd_garage",
        debugPoly = false,
        useZ = false
    },
        {
        options = {
            {
                event = "ARP-police:eyetarget",
                icon = "fas fa-car",
                label = "Sandy Garage",
                parms = { location = "sandy" }
            },
            {
                event = "spawn:heli:sandy",
                icon = "fas fa-helicopter",
                label = "Police Air Garage"
            }
        },
        job = { "police" },
        distance = 2.0
        })

    local FlyScrooge = {
        [1] = -567724045
    }

    AddTargetModel(FlyScrooge, {
        options = {
            {
                event = "FlyScroogeVeh",
                icon = "fas fa-fighter-jet",
                label = "Fly Scoorge"
            }
        },
        job = { "flyscrooge" },
        distance = 1.5
    })

    local newsStands = {
        [1] = 1211559620,
        [2] = -1186769817,
        [3] = -756152956,
        [4] = 720581693,
        [5] = -838860344
    }

    AddTargetModel(newsStands, {
        options = {
            {
                event = "NewsStandCheck",
                icon = "fas fa-newspaper",
                label = "Read The News!"
            }
        },
        job = { "all" },
        distance = 1.5
    })

    local CHAIRS = {
        [1] = -99500382,
        [2] = -1118419705,
        [3] = 538002882,
        [4] = 525667351,
        [5] = 1805980844,
        [6] = 826023884,
        [7] = 764848282,
        [8] = -741944541,
        [9] = -377849416,
        [10] = -992710074,
        [11] = 867556671,
        [12] = 1716133836,
        [13] = 146905321,
        [14] = 603897027,
        [15] = -109356459,
        [16] = 1127420746,
        [17] = -1173315865,
        [18] = -1633198649,
        [19] = -1005355458,
        [20] = -1195678770,
        [21] = 444105316,
        [22] = 536071214
    }

    AddTargetModel(CHAIRS, {
        options = {
            {
                event = "animation:Chair",
                icon = "fas fa-chair",
                label = "Sit Down!"
            }
        },
        job = { "all" },
        distance = 1.5
    })
    local partybus = {
        [1] = 345756458,

    }

    AddTargetModel(partybus, {
        options = {
            {
                event = "bus:request:song",
                icon = "fas fa-compact-disc",
                label = "Play Music",
            },
            {
                event = "bus:change:volume",
                icon = "fas fa-volume-up",
                label = "Volume Changer",
            },
        },
        job = { "all" },
        distance = 2.5
    })

    local bike = {
        [1] = 1131912276,
        [2] = 448402357,
        [3] = -186537451,
        [4] = -836512833,
        [5] = 1127861609,
        [6] = -1233807380,
        [7] = -400295096
    }

    AddTargetModel(bike, {
        options = {
            {
                event = "pickup:bike",
                icon = "fas fa-bicycle",
                label = "Pickup Bike",
            },
        },
        job = { "all" },
        distance = 2.5
    })

    AddBoxZone("pd_boat", vector3(-807.16, -1497.1, 1.6), 0.5, 0.5, {
        name = "pd_boat",
        heading = 10,
        minZ = -1.6,
        maxZ = 2.4
    },
        {
        options = {
            {
                event = "spawn:boat:pd",
                icon = "fas fa-ship",
                label = "Police Boat Garage"
            }
        },
        job = { "police" }, { "ems" },
        distance = 2.0
        })

    AddBoxZone("pd_boat2", vector3(-3428.08, 952.11, 8.35), 0.7, 0.5, {
        name = "pd_boat2",
        heading = 245,
        minZ = 5.15,
        maxZ = 9.15
    },
        {
        options = {
            {
                event = "spawn:boat:pd2",
                icon = "fas fa-ship",
                label = "Police Boat Garage"
            }
        },
        job = { "police" }, { "ems" },
        distance = 2.0
        })

    AddBoxZone("pd_boat3", vector3(1457.41, 3768.85, 31.75), 0.5, 0.5, {
        name = "pd_boat3",
        heading = 250,
        minZ = 28.55,
        maxZ = 32.55
    },
        {
        options = {
            {
                event = "spawn:boat:pd3",
                icon = "fas fa-ship",
                label = "Police Boat Garage"
            }
        },
        job = { "police" }, { "ems" },
        distance = 2.0
        })

    AddBoxZone("pd_boat4", vector3(-281.89, 6599.47, 1.72), 0.7, 0.5, {
        name = "pd_boat4",
        heading = 155,
        minZ = -1.48,
        maxZ = 2.52
    },
        {
        options = {
            {
                event = "spawn:boat:pd4",
                icon = "fas fa-ship",
                label = "Police Boat Garage"
            }
        },
        job = { "police" }, { "ems" },
        distance = 2.0
        })

    AddBoxZone("pd_boat5", vector3(3866.89, 4464.65, 2.72), 0.7, 0.5, {
        name = "pd_boat5",
        heading = 0,
        minZ = -0.48,
        maxZ = 3.52
    },
        {
        options = {
            {
                event = "spawn:boat:pd5",
                icon = "fas fa-ship",
                label = "Police Boat Garage"
            }
        },
        job = { "police" }, { "ems" },
        distance = 2.0
        })

    AddBoxZone("jail_option", vector3(1769.07, 2571.07, 45.73), 0.3, 0.5, {
        name = "jail_option",
        heading = 43,

        minZ = 42.53,
        maxZ = 46.53
    },
        {
        options = {
            {
                event = "check:time",
                icon = "fas fa-clock",
                label = "Check Remaining Time"
            },
            {
                event = "swappingCharsLoop",
                icon = "fas fa-exchange-alt",
                label = "Change Characters"
            }
        },
        job = { "all" },
        distance = 2.0
        })

    AddCircleZone("TownHall", vector3(-551.63, -202.07, 38.23), 0.30000000000001, {
        name = "TownHall",
        debugPoly = false,
        useZ = false
    },
        {
        options = {
            {
                event = "civ:mdt:open",
                icon = "fas fa-laptop",
                label = "Public Records"
            },
            {
                event = "townhall:idbuy",
                icon = "far fa-address-card",
                label = "Purchase an ID"
            },
            {
                event = "search:list:insurance",
                icon = "far fa-clipboard",
                label = "Purchase Insurance"
            },
        },
        job = { "all" },
        distance = 2.0
        })

    AddBoxZone("sunrise_cashier", vector3(-782.92, -211.57, 37.15), 0.3, 0.5, {
        name = "sunrise_cashier ",
        heading = 300,
        minZ = 37.15,
        maxZ = 37.35
    },
        {
        options = {
            {
                event = "open:tray",
                parms = "sunrise_tray",
                icon = "fas fa-hand-holding",
                label = "Verify VIP Pass",
            },
        },

        job = { "all" },
        distance = 1.5
        })

    AddBoxZone("buy_laptop", vector3(-1051.7, -233.66, 44.02), 1.5, 0.5, {
        name = "buy_laptop",
        heading = 300,
        minZ = 43.62,
        maxZ = 44.82
    },
        {
        options = {
            {
                event = "digital:shop",
                icon = "fas fa-laptop",
                label = "hmmm?"
            },

            {
                event = "digital:craft",
                icon = "fas fa-laptop",
                label = "hmmm?"
            },
        },
        job = { "all" },
        distance = 1.5
        })

    AddBoxZone("jewel-hack", vector3(-631.19, -230.67, 38.06), 0.4, 1, {
        name = "jewel-hack",
        heading = 40,
        minZ = 36.66,
        maxZ = 38.26
    },
        {
        options = {
            {
                event = "jewel:hack",
                icon = "fab fa-usb",
                label = "Hack it"
            },
        },
        job = { "all" },
        distance = 1.5
        })

    AddBoxZone("recycle", vector3(995.19, -3100.02, -39.0), 0.4, 0.5, {
        name = "recycle",
        heading = 0,
        --   debugPoly = true,
        minZ = -39.2,
        maxZ = -38.9
    },
        {
        options = {
            {
                event = "recycle:trade",
                icon = "far fa-clipboard",
                label = "Trade Your Materials!"
            }
        },
        job = { "all" },
        distance = 3
        })

    local GasPumps = {
        [1] = 1694452750,
        [2] = -2007231801,
        [3] = 1933174915,
        [4] = 1339433404,
        [5] = -462817101,
        [6] = -469694731
    }

    AddTargetModel(GasPumps, {
        options = {
            {
                event = "ARP-gas:checkpump",
                icon = "fas fa-gas-pump",
                label = "Fuel Up Your Car!"
            }
        },
        job = { "all" },
        distance = 5
    })


    AddCircleZone("buy_shore_cocaine", vector3(-1917.72, -3187.59, 5.25), 1, {
        name = "buy_shore_cocaine",
        debugPoly = false,
        useZ = false
    },
        {
        options = {
            {
                event = 'crack:buy:shore',
                icon = "fas fa-qustion",
                label = "Is he ok?"
            }
        },
        job = { "all" },
        distance = 2.5
        })


    AddCircleZone("crack_bag", vector3(1101.74, -3192.97, -38.99), 0.7, {
        name = "crack_bag",
        debugPoly = false,
        useZ = false
    },
        {
        options = {
            {
                event = 'crack:process',
                icon = "fas fa-shopping-bag",
                label = "Bag Crack"
            }
        },
        job = { "all" },
        distance = 2.5
        })


    AddCircleZone("crack_bag_alt", vector3(1098.91, -3194.09, -38.99), 0.7, {
        name = "crack_bag_alt",
        debugPoly = false,
        useZ = false
    },
        {
        options = {
            {
                event = 'crack:process',
                icon = "fas fa-shopping-bag",
                label = "Bag Crack"
            }
        },
        job = { "all" },
        distance = 2.5
        })



    AddCircleZone("cracktug", vector3(-317.25, -2778.86, 5.35), 0.61, {
        name = "cracktug",
        debugPoly = false,
        useZ = false
    },
        {
        options = {
            {
                event = 'crack:enter',
                icon = "fas fa-arrow-alt-circle-up",
                label = "Better have your gear on."
            }
        },
        job = { "all" },
        distance = 2.5
        })

    AddBoxZone("crackexit", vector3(1088.68, -3187.19, -39.0), 0.1, 1.5, {
        name = "crackexit",
        heading = 0,
        --debugPoly=true,
        minZ = -41.6,
        maxZ = -37.6
    },
        {
        options = {
            {
                event = 'crack:exit',
                icon = "fas fa-arrow-alt-circle-down",
                label = "Leave Crack Lab!"
            }
        },
        job = { "all" },
        distance = 5.0
        })

    AddBoxZone("crackstart", vector3(1094.13, -3195.73, -38.99), 1.2, 5, {
        name = "crackstart",
        heading = 0,
        --debugPoly=true,
        minZ = -42.19,
        maxZ = -38.19
    },
        {
        options = {
            {
                event = 'crack:start',
                icon = "fas fa-drum",
                label = "Start Mixing!"
            }
        },
        job = { "all" },
        distance = 5.0
        })

    AddCircleZone("methstart", vector3(1005.750793457, -3200.4038085938, -38.519329071045), 0.5, {
        name = "methstart",
        debugPoly = false,
        useZ = false
    },
        {
        options = {
            {
                event = "meth:start",
                icon = "fas fa-fill-drip",
                label = "Turn The Cooker On!"
            }
        },
        job = { "all" },
        distance = 2.5
        })

    AddCircleZone("methpacking", vector3(1016.46, -3194.16, -38.99), 1.13, {
        name = "methpacking",
        debugPoly = false,
        useZ = false
    },
        {
        options = {
            {
                event = "meth:packing",
                icon = "fas fa-box",
                label = "Start Packing!"
            }
        },
        job = { "all" },
        distance = 2.5
        })

    AddCircleZone("methscaling", vector3(1012.13, -3194.08, -38.99), 1.11, {
        name = "methscaling",
        debugPoly = false,
        useZ = false
    },
        {
        options = {
            {
                event = "meth:finish",
                icon = "fas fa-hourglass-end",
                label = "Scaling Blue Shit!"
            }
        },
        job = { "all" },
        distance = 2.5
        })

    AddBoxZone("towstart", vector3(409.07, -1623.01, 29.29), 0.6, 1, {
        name = "towstart",
        heading = 51,

        minZ = 28.29,
        maxZ = 30.09
    },
        {
        options = {
            {
                event = "start:tow",
                icon = "far fa-clipboard",
                label = "Pull out a tow truck!"
            },
            {
                event = "end:tow",
                icon = "far fa-clipboard",
                label = "Put away your tow truck!"
            },
        },
        job = { "tow" },
        distance = 1.5
        })

    --[[
    AddBoxZone("methsell", vector3(-1437.06, -372.71, 38.28), 0.7, 1, {
        name="methsell",
        heading=302,
        --debugPoly=true,
        minZ=35.08,
        maxZ=39.08
    }, 
    {
        options = {
            {
                event = "meth:sell",
                icon = "fas fa-hand-holding",
                label = "Hand Something Over"
            },
        },
        job = {"all"},
        distance = 1.5
    })

    AddBoxZone("cracksell", vector3(-415.11, 6327.93, 28.76), 0.7, 1, {
        name="cracksell",
        heading=40,
        --debugPoly=true,
        minZ=25.56,
        maxZ=29.56
    }, 
    {
        options = {
            {
                event = "crack:sell",
                icon = "fas fa-hand-holding",
                label = "Hand Something Over"
            },
        },
        job = {"all"},
        distance = 1.5
    })
    ]]
    ---- Garbage Start ----

    AddBoxZone("garbage_start", vector3(-322.56, -1545.91, 31.02), 1.2, 1, {
        name = "garbage_start",
        heading = 0,
        --debugPoly=true,
        minZ = 28.37,
        maxZ = 32.37
    },
        {
        options = {
            {
                event = "ARP-garbage:starting",
                icon = "fas fa-circle",
                label = "Clock in"
            },
        },
        job = { "all" },
        distance = 1.5
        })

    ---- Chicken Sell ----

    AddBoxZone("chicken_sell", vector3(-591.42, -892.45, 25.92), 0.8, 0.8, {
        name = "chicken_sell",
        heading = 0,
        --debugPoly=true,
        minZ = 22.72,
        maxZ = 26.72
    },
        {
        options = {
            {
                event = "chicken:sell:request",
                parms = "packaged_chicken",
                icon = "fas fa-check-circle",
                label = "Sell Chicken",
            },
        },
        job = { "all" },
        distance = 1.5
        })

    AddBoxZone("craft4", vector3(728.59, -791.0, 16.47), 4.0, 1, {
        name = "craft4",
        heading = 0,
        --debugPoly=true,
        minZ = 16.07,
        maxZ = 16.47

    },
        {
        options = {
            {
                event = "craft:guns:level:four",
                icon = "fas fa-wrench",
                label = "What can you make?"
            },
        },
        job = { "all" },
        distance = 2.0
        })

    ---- Mining ----

    AddCircleZone("gold_sell", vector3(2341.09, 3126.91, 48.21), 1.0, {
        name = "gold_sell",
        useZ = true,
        --debugPoly=true
    },
        {
        options = {
            {
                event = "mining:sell",
                parms = "silverbar",
                icon = "fas fa-check-circle",
                label = "Sell (Silver Bars)",
            },
            {
                event = "mining:sell",
                parms = "copperbar",
                icon = "fas fa-check-circle",
                label = "Sell (Copper Bars)",
            },
            {
                event = "mining:sell",
                parms = "ironbar",
                icon = "fas fa-check-circle",
                label = "Sell (Iron Bars)",
            },
            {
                event = "ARP-scuba:trade:umetal",
                icon = "fas fa-check-circle",
                label = "Trade Unknown Metals",
            },
            {
                event = "mining:sell",
                parms = "goldbar",
                icon = "fas fa-check-circle",
                label = "Sell (Gold Bars)",
            },
            {
                event = "mining:sell",
                parms = "pinkbar",
                icon = "fas fa-check-circle",
                label = "Sell (Mysteriously Pink)",
            },
        },
        job = { "all" },
        distance = 2.5
        })

    ---- Chopshop ----

    AddBoxZone("startshit", vector3(495.86, -1340.09, 29.32), 0.7, 0.5, {
        name = "startshit",
        heading = 275,
        minZ = 26.12,
        maxZ = 30.12
    },
        {
        options = {
            {
                event = "ARP-chopshop:init",
                icon = "fas fa-wrench",
                label = "Start ChopShop"
            }
        },
        job = { "all" },
        distance = 2.0
        })

    ---- PDM SHIT ----

    AddBoxZone("pdm_checkrepo", vector3(-192.42, -1161.89, 23.67), 0.5, 0.5, {
        name = "pdm_checkrepo",
        heading = 0,
        --debugPoly=true,
        minZ = 23.07,
        maxZ = 23.87
    },
        {
        options = {
            {
                event = "search:list:repo",
                icon = "fas fa-clipboard",
                label = "Search Repo List ($5000)"
            },
        },
        job = { "all" },
        distance = 2.5
        })

    AddBoxZone("sunrise_checkrepo", vector3(-782.26, -211.94, 37.15), 0.5, 0.5, {
        name = "sunrise_checkrepo",
        heading = 30,
        --debugPoly=true,
        minZ = 33.15,
        maxZ = 37.15
    },
        {
        options = {
            {
                event = "sunrise:search:list:repo",
                icon = "fas fa-clipboard",
                label = "Search Repo List ($5000)"
            },
        },
        job = { "all" },
        distance = 2.5
        })

    local hunting = {
        [1] = 1531218220
    }

    AddTargetModel(hunting, {
        options = {
            {
                event = "ARP-hunting:general",
                icon = "fab fa-shopify",
                label = "Hunting Shop",
            }
        },
        job = { "all" },
        distance = 1.5
    })


    local slots = {
        [1] = 207578973,
        [2] = -487222358,
        [3] = 654385216,
        [4] = 161343630,
        [5] = -1519644200,
        [6] = -4309089390,
        [7] = 1096374064,
    }

    AddTargetModel(slots, {
        options = {
            {
                event = "ARP_slots:UpdateSlots2",
                icon = "fas fa-chair",
                label = "Play Slots!"
            }
        },
        job = { "all" },
        distance = 0.8
    })

    AddCircleZone("boosting", vector3(-227.79, -1999.93, 24.69), 0.7, {
        name="boosting",
        heading=35,
        --debugPoly=true,
        minZ=7.03,
        maxZ=11.03
        }, {
            options = {
                {
                    event = "ARP-boosting:menu",
                    icon = "fas fa-laptop-code",
                    label = "What's dis?",
                },
            },
            job = {"all"},
            distance = 1.5
        })

    AddCircleZone("tuner_shop_keyfob", vector3(123.66, -3007.87, 7.59), 0.29, {
        name = "tuner_shop_keyfob",
        debugPoly = false,
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
        job = { "tuner_shop" },
        distance = 1.5
        })


    local lift = {
        [1] = 689679482,
    }

    AddTargetModel(lift, {
        options = {
            {
                event = "ARP-tunershop:liftup",
                icon = "fas fa-arrow-alt-circle-up",
                label = "Lift Up"
            },
            {
                event = "ARP-tunershop:liftdown",
                icon = "fas fa-arrow-alt-circle-down",
                label = "Lift Down"
            }
        },
        job = { "tuner_shop" },
        distance = 1.0
    })

    AddBoxZone("tuner_shop_fridge", vector3(145.67, -3010.54, 7.04), 1.0, 0.8, {
        name = "tuner_shop_fridge",
        heading = 0,
        --debugPoly=true,
        minZ = 4.09,
        maxZ = 8.09
    },
        {
        options = {
            {
                event = "tunershop:order",
                icon = "fas fa-door-open",
                label = "Open Fridge",
            },
        },
        job = { "tuner_shop" },
        distance = 3.5
    })

    AddBoxZone("tuner_shop_storage", vector3(128.59, -3014.42, 7.04), 2.0, 2.6, {
        name="tuner_shop_storage",
        heading=0,
        --debugPoly=true,
        minZ=5.04,
        maxZ=9.04
    },
    {
        options = {
            {
                event = "open:storage",
                parms = "tuner_shop_storage",
                icon = "fas fa-box-open",
                label = "Open Stash"
            },
        },
        job = { "tuner_shop" },
        distance = 3.5
    })

    AddCircleZone("fish_rental", vector3(-801.41, -1513.06, 1.8), 0.55, {
        name = "fish_rental",
        debugPoly = false,
        useZ = true
    },
        {
        options = {
            {
                event = "ARP-fishing:start:rentBoat",
                icon = "fas fa-hand-holding-water",
                label = "Rent a Boat!"
            }
        },
        job = { "all" },
        distance = 2.5
        })

    AddCircleZone("fish_sell", vector3(-1846.8, -1190.44, 14.52), 0.46, {
        name = "fish_sell",
        debugPoly = false,
        useZ = true
    },
        {
        options = {
            {
                event = "ARP-npcs:ped:sellFish",
                icon = "fas fa-fish",
                label = "Sell Fish!"
            }
        },
        job = { "all" },
        distance = 2.5
        })

    AddCircleZone("recycle_enter", vector3(-629.04, -1633.64, 25.97), 2, {
        name = "recycle_enter",
        debugPoly = false,
        useZ = true
    },
        {
        options = {
            {
                event = "recycle:enter",
                icon = "fas fa-door-open",
                label = "[Southside] Enter Recycle"
            }
        },
        job = { "all" },
        distance = 2.5
        })

    AddCircleZone("recycle_enter_grapeseed", vector3(2310.81, 4884.7, 41.81), 2, {
        name = "recycle_enter_grapeseed",
        debugPoly = false,
        useZ = true
    },
        {
        options = {
            {
                event = "recycle:enter",
                icon = "fas fa-door-open",
                label = "[Grapeseed] Enter Recycle"
            }
        },
        job = { "all" },
        distance = 2.5
        })

    AddCircleZone("recycle_exit", vector3(996.11, -3091.94, -39.0), 2, {
        name = "recycle_exit",
        debugPoly = false,
        useZ = true
    },
        {
        options = {
            {
                event = "recycle:exit",
                icon = "fas fa-door-open",
                label = "[South Side] Leave Recycle"
            },
            {
                event = "recycle:exit:grapseseed",
                icon = "fas fa-door-open",
                label = "[Grapeseed] Leave Recycle"
            },
        },
        job = { "all" },
        distance = 2.5
        })

    AddCircleZone("food_market_mirror", vector3(1168.95, -292.07, 69.02), 2, {
        name = "food_market_mirror",
        debugPoly = false,
        useZ = true
    },
        {
        options = {
            {
                event = "food:market:open",
                icon = "fas fa-shopping-cart",
                label = "Open Market",
            },
        },
        job = { "all" },
        distance = 2.5
        })

    AddCircleZone("food_market_south", vector3(52.96, -1478.88, 29.27), 2, {
        name = "food_market_south",
        debugPoly = false,
        useZ = true
    },
        {
        options = {
            {
                event = "food:market:open",
                icon = "fas fa-shopping-cart",
                label = "Open Market",
            },
        },
        job = { "all" },
        distance = 2.5
        })


    AddBoxZone("food_market_north", vector3(-58.25, 6522.45, 31.49), 7.4, 1.0, {
        name = "food_market_north",
        heading = 225,
        minZ = 31.39,
        maxZ = 32.49
    },
        {
        options = {
            {
                event = "food:market:open",
                icon = "fas fa-shopping-cart",
                label = "Open Market",
            },
        },
        job = { "all" },
        distance = 1.5
        })

    -- Pres Condo
    AddCircleZone("pres_condo", vector3(-775.47, 321.19, 85.66), 2, {
        name = "pres_condo",
        debugPoly = false,
        useZ = true
    },
        {
        options = {
            {
                event = "pres:condo:in",
                icon = "fas fa-door-open",
                label = "Take Elevator",
            },
        },
        job = { "all" },
        distance = 2.5
        })

    AddCircleZone("pres_condo_out", vector3(-773.89, 341.98, 196.69), 1, {
        name = "pres_condo_out",
        debugPoly = false,
        useZ = true
    },
        {
        options = {
            {
                event = "pres:condo:out",
                icon = "fas fa-door-open",
                label = "Take Elevator",
            },
        },
        job = { "all" },
        distance = 2.5
        })

    -- Lucky Store
    AddCircleZone("lucky_store_attempt", vector3(-1266.13, -2447.07, 14.0), 1, {
        name = "lucky_store_attempt",
        debugPoly = false,
        useZ = true
    },
        {
        options = {
            {
                event = "robbery:luckystore:attempt",
                icon = "fas fa-upload",
                label = "Were you followed?!?",
            },
        },
        job = { "all" },
        distance = 2.5
    })

    local animals = {
        [1] = GetHashKey('a_c_cat_01'),
        [2] = GetHashKey('a_c_husky'),
        [3] = GetHashKey('a_c_rottweiler'),
        [4] = GetHashKey('a_c_westy'),
        [5] = GetHashKey('a_c_shepherd'),
        [6] = GetHashKey('a_c_poodle'),
        [7] = GetHashKey('a_c_pug'),
        [8] = GetHashKey('a_c_hen'),
        [9] = GetHashKey('a_c_cow'),
        [10] = GetHashKey('a_c_rat'),
        [11] = GetHashKey('a_c_rabbit_01'),
    }

    AddTargetModel(animals, {
        options = {
            {
                event = "animal:pet",
                icon = "fas fa-sign-language",
                label = "Pet"
            }
        },
        job = { "all" },
        distance = 1.5
    })

end)

RegisterNetEvent("animal:pet")
AddEventHandler("animal:pet", function()
    Citizen.Wait(100)
    TriggerEvent("animation:PlayAnimation", "petting")
    TriggerEvent("client:newStress", false, 100)
    TriggerEvent("DoShortHudText", "Cute! Relieved Stress", 1)
end)
