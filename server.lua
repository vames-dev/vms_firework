ESX                = nil


TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

TriggerEvent('es:addGroupCommand', 'fajerwerki', "support", function(source, args, user)
    TriggerClientEvent('vms-firework:goooo', source)
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = {"^8[SYSTEM]", "Nie posiadasz permisji"} })
end, {help = "Pieeerdolnij fajerwerke w powietrze"})

TriggerEvent('es:addGroupCommand', 'fajerwerki2', "support", function(source, args, user)
    TriggerClientEvent('vms-firework:goooo2', source)
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = {"^8[SYSTEM]", "Nie posiadasz permisji"} })
end, {help = "Pieeerdolnij fajerwerke w powietrze"})

TriggerEvent('es:addGroupCommand', 'fajerwerki3', "support", function(source, args, user)
    TriggerClientEvent('vms-firework:goooo3', source)
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = {"^8[SYSTEM]", "Nie posiadasz permisji"} })
end, {help = "Pieeerdolnij fontanne"})


ESX.RegisterUsableItem('fajerwerki1', function(source)
    local xPlayer  = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('fajerwerki1', 1)
    TriggerClientEvent('vms-firework:goooo', source)
    TriggerClientEvent('esx:showNotification', source, 'Odpaliłeś ~p~Fajerwerki')
end)

ESX.RegisterUsableItem('fajerwerki2', function(source)
    local xPlayer  = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('fajerwerki2', 1)
    TriggerClientEvent('vms-firework:goooo2', source)
    TriggerClientEvent('esx:showNotification', source, 'Odpaliłeś ~r~Fajerwerki')
end)

ESX.RegisterUsableItem('fajerwerki3', function(source)
    local xPlayer  = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('fajerwerki3', 1)
    TriggerClientEvent('vms-firework:goooo3', source)
    TriggerClientEvent('esx:showNotification', source, 'Odpaliłeś ~y~Fontanne')
end)