ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

-- Repairkit --
RegisterServerEvent('supreme_buy:RepairKitBuy')
AddEventHandler('supreme_buy:RepairKitBuy', function(amount)
	local xPlayer  = ESX.GetPlayerFromId(source)
	local price = 1000
	if xPlayer.canCarryItem('fixkit', 1) then
		if xPlayer.getMoney() > price then
			xPlayer.addInventoryItem('fixkit',1)
			xPlayer.removeMoney(price)
			TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = 'You paid ' .. price, })
		else
			TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'Not enough money', })
		end
	else
		TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'Can not carry', })
	end
			
end)	
-- --

-- Blowtorch --
RegisterServerEvent('supreme_buy:BlowtorchBuy')
AddEventHandler('supreme_buy:BlowtorchBuy', function(amount)
	local xPlayer  = ESX.GetPlayerFromId(source)
	local price = 500
	if xPlayer.canCarryItem('blowtorch', 1) then
		if xPlayer.getMoney() > price then
			xPlayer.addInventoryItem('blowtorch',1)
			xPlayer.removeMoney(price)
			TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = 'You paid ' .. price, })
		else
			TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'Not enough money', })
		end
	else
		TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'Can not carry', })
	end
end)	
-- --

-- Water --
RegisterServerEvent('supreme_buy:WaterBuy')
AddEventHandler('supreme_buy:WaterBuy', function(amount)
	local xPlayer  = ESX.GetPlayerFromId(source)
	local price = 35
	if xPlayer.canCarryItem('bread', 1) then
		if xPlayer.getMoney() > price then
			xPlayer.addInventoryItem('bread',1)
			xPlayer.removeMoney(price)
			TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = 'You paid ' .. price, })
		else
			TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'Not enough money', })
		end
	else
		TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'Can not carry', })
	end
end)	
-- --

-- Bread --
RegisterServerEvent('supreme_buy:BreadBuy')
AddEventHandler('supreme_buy:BreadBuy', function(amount)
	local xPlayer  = ESX.GetPlayerFromId(source)
	local price = 35
	if xPlayer.canCarryItem('fixkit', 1) then
		if xPlayer.getMoney() > price then
			xPlayer.removeMoney(price)
			TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = 'You paid ' .. price, })
		else
			TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'Not enough money', })
		end
	else
		TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'Can not carry', })
	end
end)	
-- --
