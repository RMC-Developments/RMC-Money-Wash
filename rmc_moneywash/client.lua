local QBCore = exports['qb-core']:GetCoreObject()
local Config = Config or {}
local spawnedPed = nil

-- Function to spawn or move the ped
local function SpawnLaunderingPed()
    if spawnedPed then
        DeleteEntity(spawnedPed) -- Remove previous ped
        spawnedPed = nil
    end

    -- Pick a random location from the config
    local location = Config.LaunderingLocations[math.random(#Config.LaunderingLocations)]
    print("^3[DEBUG] Ped moving to:", location.coords)

    -- Load Ped Model
    local model = `s_m_y_dealer_01`
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(10)
    end

    -- Spawn new ped at the new location
    spawnedPed = CreatePed(4, model, location.coords.x, location.coords.y, location.coords.z - 1.0, location.coords.w, false, true)
    SetEntityInvincible(spawnedPed, true)
    SetBlockingOfNonTemporaryEvents(spawnedPed, true)
    TaskStartScenarioInPlace(spawnedPed, "WORLD_HUMAN_DRUG_DEALER", 0, true)

    -- Add Target Interaction
    exports['ox_target']:addLocalEntity(spawnedPed, {
        {
            name = "launder_money",
            icon = "fas fa-money-bill-wave",
            label = "Launder Money",
            onSelect = function()
                TriggerEvent('qb-laundering:StartLaundering')
            end,
        }
    })

    print("^2[DEBUG] Ped spawned successfully at new location!^0")
end

-- Rotate ped location every 5 minutes
CreateThread(function()
    while true do
        SpawnLaunderingPed()
        Wait(3600000) -- 5 minutes (300,000 ms)
    end
end)

-- Command to manually move the ped (For Testing)
RegisterCommand("rotateped", function()
    SpawnLaunderingPed()
end, false)

RegisterNetEvent('qb-laundering:StartLaundering', function()
    local blackMoney = exports['ox_inventory']:GetItemCount('black_money')

    if blackMoney <= 0 then
        TriggerEvent('okokNotify:Alert', 'Money Laundering', 'You have no dirty money!', 5000, 'error')
        return
    end

    TriggerServerEvent('qb-laundering:StartProcess', blackMoney)
end)

RegisterNetEvent('qb-laundering:NotifyCompletion', function(amount)
    TriggerEvent('okokNotify:Alert', 'Money Laundering', 'Your cleaned money is ready! You received $'..amount, 5000, 'success')
end)
