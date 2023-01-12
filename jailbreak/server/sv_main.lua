RegisterServerEvent('particle:StartParticleAtLocation')
AddEventHandler('particle:StartParticleAtLocation', function(x,y,z,particle,id,rx,ry,rz)
TriggerClientEvent('particle:StartClientParticle', -1, x,y,z,particle,id,rx,ry,rz)
end)

RegisterServerEvent('particle:StopParticle')
AddEventHandler('particle:StopParticle', function(x,y,z,particle,id,rx,ry,rz)
TriggerClientEvent('particle:StopParticleClient', -1, id)
end)

RegisterServerEvent("updateJailTime")
AddEventHandler("updateJailTime", function(minutes, player)
    local src = false
    
    if player then
        src = player
    else
        src = source
    end

    local user = exports["ARP-core"]:getModule("Player"):GetUser(tonumber(src))
    if not user then 
        print('^1 updateJailTime: Cannot find User')
        return 
    end

    local char = user:getCurrentCharacter()
    if not char then 
        print('^1 updateJailTime: Cannot find Character')
        return 
    end

    if minutes == 0 then
        TriggerClientEvent('endJailTime', src)
    else
        exports.ghmattimysql:execute("UPDATE `characters` SET `jail_time` = '" .. tonumber(minutes) .. "' WHERE `id` = '" .. char.id .. "'")
    end
end)

-- RegisterServerEvent("updateJailTimeMobster")
-- AddEventHandler("updateJailTimeMobster", function(minutes)
--     local src = source
--     local user = exports["ARP-core"]:getModule("Player"):GetUser(src)
-- 	local char = user:getCurrentCharacter()
--         exports.ghmattimysql:execute("UPDATE `characters` SET `jail_time_mobster` = '" .. minutes .. "' WHERE `id` = '" .. char.id .. "'")
-- end)
Citizen.CreateThread(function()
    Citizen.Wait(5000)
    while true do 
        Citizen.Wait(60000)
        for _, player in ipairs(GetPlayers()) do -- get all active players only
            local user = exports["ARP-core"]:getModule("Player"):GetUser(tonumber(player))
            if user then 
                local char = user:getVar("character")
                if char then 
                    exports.ghmattimysql:execute("SELECT `jail_time` FROM `characters` WHERE id = @cid", {
                        ['cid'] = char.id
                    }, function(result)
                        if result[1] then
                            if result[1].jail_time and result[1].jail_time >= 1 then
                                exports.ghmattimysql:execute("UPDATE `characters` SET `jail_time` = @time WHERE `id` = @cid", {
                                    ['time'] = result[1].jail_time - 1, 
                                    ['cid'] = char.id 
                                })
                            end
                        end
                    end)
                    Citizen.Wait(10)
                end
            end
        end
    end
end)

RegisterServerEvent("updateJailTimeMobster")
AddEventHandler("updateJailTimeMobster", function(minutes)
    local src = source
    local user = exports["ARP-core"]:getModule("Player"):GetUser(src)
	local char = user:getCurrentCharacter()
    if minutes == 0 then
        TriggerClientEvent('endJailTime', src)
    else
        exports.ghmattimysql:execute("UPDATE `characters` SET `jail_time_mobster` = @time WHERE `id` = @cid", {['time'] = tonumber(minutes), ['cid'] = char.id})
    end
end)


RegisterServerEvent('jail:charecterFullySpawend')
AddEventHandler('jail:charecterFullySpawend', function()
    local src = source
    local user = exports["ARP-core"]:getModule("Player"):GetUser(src)
	local character = user:getCurrentCharacter()
    local playerName = character.first_name .. ' ' .. character.last_name
    
    exports.ghmattimysql:execute("SELECT * FROM `characters` WHERE id = @cid", {['cid'] = character.id}, function(result)
        if result[1].jail_time >= 1 then
            TriggerClientEvent('beginJail', src, true,result[1].jail_time, playerName, character.id, date)
        end
    end)
end)

RegisterServerEvent("checkJailTime")
AddEventHandler("checkJailTime", function(sendmessage)
    local src = source
    local user = exports["ARP-core"]:getModule("Player"):GetUser(src)
    local char = user:getCurrentCharacter()

    exports.ghmattimysql:execute("SELECT * FROM `characters` WHERE id = @cid", {['cid'] = char.id}, function(result)

        if tonumber(result[1].jail_time) <= 0 then
            TriggerClientEvent("TimeRemaining", src, tonumber(result[1].jail_time), true)
        elseif tonumber(result[1].jail_time) >= 1 then
            TriggerClientEvent("TimeRemaining", src, tonumber(result[1].jail_time), false)
        end
	end)
end)

RegisterServerEvent('jail:cuttime')
AddEventHandler("jail:cuttime", function()
    local src = source
    local user = exports["ARP-core"]:getModule("Player"):GetUser(src)
    local char = user:getCurrentCharacter()
    exports.ghmattimysql:execute("SELECT * FROM `characters` WHERE id = @cid", {['cid'] = char.id}, function(data)
        local recent = tonumber(data[1].jail_time)
        exports.ghmattimysql:execute("UPDATE `characters` SET `jail_time` = @time WHERE `id` = @cid", {['time'] = recent - tonumber(5), ['cid'] = char.id})
    end)

end)

RegisterCommand('unjail', function(source, args)
    local src = source
    local user = exports["ARP-core"]:getModule("Player"):GetUser(src)
    local char = user:getCurrentCharacter()
    local target = exports["ARP-core"]:getModule("Player"):GetUser(tonumber(args[1]))

    if user:getVar("job") == 'police' or user:getVar("job") == 'doc' then
        if tonumber(args[1]) and exports["ARP-core"]:getModule("Player"):GetUser(tonumber(args[1])) then
            TriggerClientEvent("endJailTime", (tonumber(args[1])))
            exports.ghmattimysql:execute("UPDATE `characters` SET `jail_time` = @time WHERE `id` = @cid", {['time'] = 0, ['cid'] = char.id})
        else
            TriggerClientEvent("DoLongHudText", src, 'There are no player with this ID.', 2)
        end
    end
end)


RegisterServerEvent("ARP-jailbreak:unjail")
AddEventHandler("ARP-jailbreak:unjail", function(src)
    local src = source
    local user = exports["ARP-core"]:getModule("Player"):GetUser(src)
    local cid = user:getVar("character").id
    local char = user:getCurrentCharacter()
    TriggerClientEvent("endJailBreakTime", src)
    exports.ghmattimysql:execute("UPDATE characters SET jail_time = @time WHERE `id` = @cid",
        {['cid'] = char.id,
        ['@time'] = 0
    })
end)

RegisterCommand('jail', function(source, args)
    local src = source
    local user = exports["ARP-core"]:getModule("Player"):GetUser(src)

    if user:getVar("job") == 'police' or user:getVar("job") == 'doc' then
        TriggerClientEvent("police:jailing", src, args)
    end
end)

--JailbreaK--
RegisterServerEvent("ARP-jailbreak:updateStates")
AddEventHandler("ARP-jailbreak:updateStates", function(pType, pId, pState)
    TriggerClientEvent("ARP-jailbreak2:updateStates", -1, pType, pId, pState)

end)
canleave = false
RegisterServerEvent("ARP-jailbreak-leavejail-hoya")
AddEventHandler("ARP-jailbreak-leavejail-hoya", function(pAuto)
    if not pAuto then
        local pSrc = source
        canleave = not canleave
    else
        canleave = not canleave
    end
end)

RegisterServerEvent("ARP-jailbreak-leavejail-shit")
AddEventHandler("ARP-jailbreak-leavejail-shit", function()
    local pSrc = source
    if canleave then 
        TriggerClientEvent("ARP-jailbreak-final2", pSrc, true)
    else
        TriggerClientEvent("DoLongHudText", pSrc, "Still disabled!", 2)
    end
end)

RegisterServerEvent("ARP-jailbreak:effects")
AddEventHandler("ARP-jailbreak:effects", function(x, y, z)
    TriggerClientEvent("ARP-jailbreak:clienteffects", -1, x, y, z)
end)

RPC.register("ARP-jail:shit", function ()
    local pSrc = source
    TriggerClientEvent("player:receiveItem", pSrc, "scoin",math.random(3,5))
end)

RPC.register("ARP-jail:shit2", function ()
    local pSrc = source
    TriggerClientEvent("player:receiveItem", pSrc, "scoin", 1)
end)

RPC.register("ARP-jail:shit3", function ()
    local pSrc = source
    TriggerClientEvent("player:receiveItem", pSrc, "scoin",math.random(3,7))
end)