local ESX = exports['es_extended']:getSharedObject()

ESX.RegisterUsableItem('vape', function(playerId)
    local xPlayer = ESX.GetPlayerFromId(playerId)
    TriggerClientEvent('vapestarted', playerId)
end)