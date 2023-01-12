local robberyBusy = false
local timeOut = false
FIREALARM_STATE = false
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000 * 60 * 30) -- 30 mins reset
        print("^1 Resetting all Banks Security's^0")
        TriggerClientEvent("ARP-robbery:client:enableAllBankSecurity", -1)
    end
end)

RegisterServerEvent('ARP-robbery:server:setBankState')
AddEventHandler('ARP-robbery:server:setBankState', function(bankId, state)
    if bankId == "pacific" then
        if not robberyBusy then
            Config.BigBanks["pacific"]["isOpened"] = state
            TriggerClientEvent('ARP-robbery:client:setBankState', -1, bankId, state)
            TriggerEvent('ARP-robbery:server:setTimeout')
        end
    else
        if not robberyBusy then
            Config.SmallBanks[bankId]["isOpened"] = state
            TriggerClientEvent('ARP-robbery:client:setBankState', -1, bankId, state)
            TriggerEvent('ARP-robbery:server:SetSmallbankTimeout', bankId)
        end
    end
    robberyBusy = true
end)


RegisterServerEvent('ARP-robbery:server:setFireAlarmState')
AddEventHandler('ARP-robbery:server:setFireAlarmState', function()
    FIREALARM_STATE = true
end)

RegisterServerEvent('ARP-robbery:server:getFireAlarmState')
AddEventHandler('ARP-robbery:server:getFireAlarmState', function()
    local fire = FIREALARM_STATE
    local pSrc = source
    TriggerClientEvent('ARP-robbery:client:fireAlarmState', pSrc, fire)
end)


RegisterServerEvent('ARP-robbery:server:setLockerState')
AddEventHandler('ARP-robbery:server:setLockerState', function(bankId, lockerId, state, bool)
    if bankId == "pacific" then	
        Config.BigBanks["pacific"]["lockers"][lockerId][state] = bool
    else
        Config.SmallBanks[bankId]["lockers"][lockerId][state] = bool
    end

    TriggerClientEvent('ARP-robbery:client:setLockerState', -1, bankId, lockerId, state, bool)
end)

RegisterServerEvent("isRobberyActive", function()
    local pSrc = source
    TriggerClientEvent("isRobberyActive:fleeca", pSrc, robberyBusy)
end)

RegisterServerEvent("robbery:get:config", function()
    TriggerClientEvent("robbery:get:config", source, Config)
end)

RegisterServerEvent('ARP-robbery:server:setTimeout')
AddEventHandler('ARP-robbery:server:setTimeout', function()
    if not robberyBusy then
        if not timeOut then
            timeOut = true
            Citizen.CreateThread(function()
                Citizen.Wait(30 * (60 * 1000))
                timeOut = false
                robberyBusy = false

                for k, v in pairs(Config.BigBanks["pacific"]["lockers"]) do
                    Config.BigBanks["pacific"]["lockers"][k]["isBusy"] = false
                    Config.BigBanks["pacific"]["lockers"][k]["isOpened"] = false
                end
			
                TriggerClientEvent('ARP-robbery:client:ClearTimeoutDoors', -1)
                Config.BigBanks["pacific"]["isOpened"] = false
            end)
        end
    end
end)

RegisterServerEvent('ARP-robbery:server:SetSmallbankTimeout')
AddEventHandler('ARP-robbery:server:SetSmallbankTimeout', function(BankId)
    if not robberyBusy then
        SetTimeout(30 * (30 * 1000), function()
            Config.SmallBanks[BankId]["isOpened"] = false
			
            for k, v in pairs(Config.BigBanks["pacific"]["lockers"]) do
                Config.BigBanks["pacific"]["lockers"][k]["isBusy"] = false
                Config.BigBanks["pacific"]["lockers"][k]["isOpened"] = false
            end
			
            timeOut = false
            robberyBusy = false
            TriggerClientEvent('ARP-robbery:client:ResetFleecaLockers', -1, BankId)
            TriggerEvent('lh-banking:server:SetBankClosed', BankId, false)
        end)
    end
end)

RegisterServerEvent('thermite:effects')
AddEventHandler('thermite:effects', function(shit)
	TriggerClientEvent('paficic:thermiteEffect',-1, shit)
end)