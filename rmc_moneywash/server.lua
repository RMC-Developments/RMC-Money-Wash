print("Checking Config File...")

local configFilePath = GetResourcePath(GetCurrentResourceName()) .. '/config.lua'
print("Config File Path: ", configFilePath)

local file = io.open(configFilePath, "r")
if file then
    print("Config file found!")
    file:close()
else
    print("ERROR: Config file NOT found!")
end

-- server.lua
local QBCore = exports['qb-core']:GetCoreObject()

-- Load Config
Config = {}

local configFile = LoadResourceFile(GetCurrentResourceName(), "config.lua")
if configFile then
    load(configFile)()
else
    print("^1ERROR: Could not load config.lua!^0")
end


RegisterNetEvent('qb-laundering:StartProcess', function(blackMoney)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    
    if not Player then return end
    
    local blackMoneyAmount = Player.Functions.GetItemByName('black_money')
    
    if blackMoneyAmount and blackMoneyAmount.amount >= blackMoney then
        Player.Functions.RemoveItem('black_money', blackMoney)
        TriggerClientEvent('okokNotify:Alert', src, 'Money Laundering', 'Your money is being cleaned...', 5000, 'info')
        
        local waitTime = math.random(Config.MinWaitTime, Config.MaxWaitTime)
        Wait(waitTime * 1000)
        
        local cleanMoney = blackMoney * Config.ConversionRate
        Player.Functions.AddMoney('cash', cleanMoney)
        
        TriggerClientEvent('qb-laundering:NotifyCompletion', src, cleanMoney)
    else
        TriggerClientEvent('okokNotify:Alert', src, 'Money Laundering', 'You do not have enough dirty money!', 5000, 'error')
    end
end)
