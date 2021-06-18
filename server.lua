ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

-- Add items to inventory
RegisterServerEvent('supreme_buy:addItem')
AddEventHandler('supreme_buy:addItem',function(item)
	local _source = source
	local xPlayer  = ESX.GetPlayerFromId(source)
	xPlayer.addInventoryItem(item,1)

end)

-- Repairkit --
RegisterServerEvent('supreme_buy:RepairKitBuy')
AddEventHandler('supreme_buy:RepairKitBuy', function(amount)
local xPlayer  = ESX.GetPlayerFromId(source)
xPlayer.removeMoney(1000)
    end)	
-- --

-- Blowtorch --
RegisterServerEvent('supreme_buy:BlowtorchBuy')
AddEventHandler('supreme_buy:BlowtorchBuy', function(amount)
local xPlayer  = ESX.GetPlayerFromId(source)
xPlayer.removeMoney(500)
    end)	
-- --

-- Water --
RegisterServerEvent('supreme_buy:WaterBuy')
AddEventHandler('supreme_buy:WaterBuy', function(amount)
local xPlayer  = ESX.GetPlayerFromId(source)
xPlayer.removeMoney(35)
    end)	
-- --

-- Bread --
RegisterServerEvent('supreme_buy:BreadBuy')
AddEventHandler('supreme_buy:BreadBuy', function(amount)
local xPlayer  = ESX.GetPlayerFromId(source)
xPlayer.removeMoney(35)
    end)	
-- --
