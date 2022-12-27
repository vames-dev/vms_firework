if Config.Core == "ESX" then
    for k, v in pairs(Config.Fireworks) do
        if v.item then
            ESX.RegisterUsableItem(v.item, function(source)
                local xPlayer = ESX.GetPlayerFromId(source)
                if Config.NeedLighter then
                    local isHaveLighter = xPlayer.getInventoryItem(Config.LighterItem).count
                    if isHaveLighter == 0 then
                        return TriggerClientEvent('vms_firework:notification', source, 'NEED_LIGHTER', 5000, 'error')
                    end
                end
                if v.itemRemovable then
                    xPlayer.removeInventoryItem(v.item, 1)
                end
                TriggerClientEvent('vms_firework:startFirework', source, k)
            end)
        end
    end
elseif Config.Core == "QB-Core" then
    for k, v in pairs(Config.Fireworks) do
        if v.item then
            QBCore.Functions.CreateUseableItem(v.item, function(source, item)
                local Player = QBCore.Functions.GetPlayer(source)
                if Config.NeedLighter then
                    local isHaveLighter = Player.Functions.GetItemByName(Config.LighterItem)
                    if isHaveLighter == nil or isHaveLighter.amount == 0 then 
                        return TriggerClientEvent('vms_firework:notification', source, 'NEED_LIGHTER', 5000, 'error')
                    end
                end
                if v.itemRemovable then
                    Player.Functions.RemoveItem(v.item, 1, false)
                end
                TriggerClientEvent('vms_firework:startFirework', source, k)
            end)
        end
    end
end