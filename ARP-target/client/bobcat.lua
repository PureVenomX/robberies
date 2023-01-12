Citizen.CreateThread(function()

    AddCircleZone("Requestblast", vector3(885.68048095703, -2108.0759277344, 31.230314254761), 1.0, {
        name = "Requestblast",
        useZ = true,
        --debugPoly=true
    },
    {
        options = {
            {
                event = "ARP-bobcat:yup:requestblast",
                icon = "fas fa-bomb",
                label = "Open the door now!"
            }
        },
        job = { "all" },
        distance = 2.5
    })

    AddCircleZone("bobcat_ammo", vector3(888.68859863281, -2121.87109375, 31.230321884155), 1.0, {
        name = "bobcat_ammo",
        --debugPoly = true,
        useZ = true
    },
    {
        options = {
            {
                event = "ARP-bobcat:loot:attempt",
                icon = "fas fa-box",
                label = "Check Crate"
            }
        },
        job = { "all" },
        distance = 2.5
    })

    AddCircleZone("bobcat_regular_one", vector3(890.44842529297, -2128.2224121094, 31.230043411255), 1.0, {
        name = "bobcat_regular_one",
        --debugPoly = true,
        useZ = true
    },
    {
        options = {
            {
                event = "ARP-bobcat:loot:attempt",
                icon = "fas fa-box",
                label = "Check Crate"
            }
        },
        job = { "all" },
        distance = 2.5
    })

    AddCircleZone("bobcat_regular_two", vector3(888.54791259766, -2125.2553710938, 31.234149932861), 1.0, {
        name = "bobcat_regular_two",
        --debugPoly = true,
        useZ = true
    },
    {
        options = {
            {
                event = "ARP-bobcat:loot:attempt",
                icon = "fas fa-box",
                label = "Check Crate"
            }
        },
        job = { "all" },
        distance = 2.5
    })

    AddCircleZone("bobcat_high", vector3(885.99096679688, -2127.9306640625, 31.23016166687), 1.0, {
        name = "bobcat_high",
        --debugPoly = true,
        useZ = true
    },
    {
        options = {
            {
                event = "ARP-bobcat:loot:attempt",
                icon = "fas fa-box",
                label = "Check Case"
            }
        },
        job = { "all" },
        distance = 2.5
    })

    AddCircleZone("bobcat_front_doors", vector3(915.05, -2122.01, 31.23), 1.9, {
        name="bobcat_front_doors",
        useZ=false,
        --debugPoly=true
    },
    {
        options = {
            {
                event = "bobcat:first:door",
                icon = "fas fa-meh",
                label = "Blow These Doors Open"
            }
        },
        job = { "all" },
        distance = 1.5
    })

    AddCircleZone("bobcat_inside_door", vector3(908.5, -2120.63, 31.23), 1.0, {
        name="bobcat_inside_door",
        useZ=false,
        --debugPoly=true
    },
    {
        options = {
            {
                event = "bobcat:inside:door",
                icon = "fas fa-meh",
                label = "Lets Keep Pushing"
            }
        },
        job = { "all" },
        distance = 1.5
    })

    AddCircleZone("bobcat_double_door", vector3(905.29, -2119.41, 31.23), 0.3, {
        name="bobcat_double_door",
        useZ=false,
        --debugPoly=true
    },
    {
        options = {
            {
                event = "bobcat:third:door",
                icon = "fas fa-meh",
                label = "Get Ready There Coming"
            }
        },
        job = { "all" },
        distance = 1.5
    })

    AddCircleZone("bobcat_staff_door", vector3(877.8218, -2121.992, 31.38018), 1.0, {
        name = "bobcat_staff_door",
        --debugPoly = false,
        useZ = true
    },
    {
        options = {
            {
                event = "bobcat:staff:door",
                icon = "fas fa-meh",
                label = "Jiggle Handle"
            }
        },
        job = { "all" },
        distance = 1.5
    })
end)
