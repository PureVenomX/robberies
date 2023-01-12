Citizen.CreateThread(function()
  -- Gun Crafting

 AddCircleZone("gun_craft_one", vector3(-625.88, -1628.85, 33.01), 0.5, {
    name = "gun_craft_one",
    --debugPoly = true,
    useZ = true
},
{
    options = {
        {
           event = "craft:guns:level:one",
            icon = "fas fa-wrench",
            label = "What can you make?"
        },
    },
    job = {"all"},
    distance = 2
})

--AddCircleZone("gun_craft_lighth", vector3(3426.51, 5174.66, 7.38), 0.75, {
 --   name = "gun_craft_lighth",
 --   --debugPoly = true,
 --   useZ = true
--},
--{
--    options = {
 --       {
 --           event = "craft:guns:level:lighth",
 --           icon = "fas fa-wrench",
 --           label = "What can you make?"
 --       },
 --   },
 --   job = {"all"},
 ---   distance = 2
--})

--AddCircleZone("gun_craft_three", vector3(-1413.7509765625, 6754.4287109375, 3.05144572258), 0.5, {
--    name = "gun_craft_three",
--    --debugPoly = true,
--    useZ = true
--},
--{
--    options = {
--         {
--           event = "craft:guns:level:three",
--        icon = "fas fa-wrench",
 --           label = "What can you make?"
 --       },
 --   },
 --   job = {"all"},
 --   distance = 2
--})

AddCircleZone("gun_craft_Mafia", vector3(1395.65, 1142.53, 111.01), 0.70000000000001, {
    name="Mafia",
    useZ=true,
    --debugPoly=true,
},
{
    options = {
        {
            event = "craft:guns:level:Mafia",
            icon = "fas fa-wrench",
            label = "Scarface?"
        },
    },
    job = {"all"},
    distance = 2
  })

  AddCircleZone("gun_craft_Bloods", vector3(-12.85, -1429.88, 31.7), 0.37,  {
    name="Blood",
    useZ=true,
    --debugPoly=true
},
{
    options = {
        {
            event = "craft:guns:level:Bloods",
            icon = "fas fa-wrench",
            label = "Is that a blood smear? Who's there!"
        },
    },
    job = {"all"},
    distance = 2
  })

  AddCircleZone("gun_craft_crip", vector3(-1108.5, -1643.39, 4.8), 0.57, {
    name="crip",
    useZ=true,
    --debugPoly=true,
},
{
    options = {
        {
            event = "craft:guns:level:crip",
            icon = "fas fa-wrench",
            label = "Chino pass the gun!"
        },
    },
    job = {"all"},
    distance = 2
  })

  AddCircleZone("gun_craft_ammo", vector3(882.69, -1052.55, 33.31), 0.63000000000001, {
    name="ammo",
    useZ=true,
    --debugPoly=true,
},
{
    options = {
        {
            event = "craft:guns:level:ammo",
            icon = "fas fa-wrench",
            label = "Another one blicks the dust."
        },
    },
    job = {"all"},
    distance = 2
  })

  AddBoxZone("spade_craft", vector3(155.6, -1171.82, 29.46), 0.3, 1.3, {
    name="spade",
    heading=5,
    minZ=28.46,
    maxZ=31.06
  },
  {
    options = {
        {
            event = "craft:key:spade",
            icon = "fas fa-wrench",
            label = "Let me see your fortune."
        },
    },
    job = {"all"},
    distance = 2
  })

end)