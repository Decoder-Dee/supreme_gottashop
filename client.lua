Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
		for k, v in pairs(Config.ubicacion) do
			local cordenadasped = GetEntityCoords(PlayerPedId())	
			local dist = #(v.Cordenadas - cordenadasped)
			
			if dist < 70 and pedspawneado == false then
				TriggerEvent('spawn:ped',v.Cordenadas,v.h)
				pedspawneado = true
			end
			if dist >= 80  then
				pedspawneado = false
				DeletePed(tunpc)
			end
		end
	end
end)

RegisterNetEvent('spawn:ped')
AddEventHandler('spawn:ped',function(coords,heading)
	local hash = GetHashKey('a_m_y_indian_01')
	if not HasModelLoaded(hash) then
		RequestModel(hash)
		Wait(10)
	end
	while not HasModelLoaded(hash) do 
		Wait(10)
	end

    pedspawneado = true
	tunpc = CreatePed(5, hash, coords, heading, false, false)
	FreezeEntityPosition(tunpc, true)
        SetEntityInvincible(tunpc, true)
    SetBlockingOfNonTemporaryEvents(tunpc, true)
	loadAnimDict("amb@world_human_cop_idles@male@idle_b") 
	while not TaskPlayAnim(tunpc, "amb@world_human_cop_idles@male@idle_b", "idle_e", 8.0, 1.0, -1, 17, 0, 0, 0, 0) do
	Wait(1000)
	end
end)

function loadAnimDict( dict )
    while ( not HasAnimDictLoaded( dict ) ) do
        RequestAnimDict( dict )
        Citizen.Wait( 5 )
    end
end

Citizen.CreateThread(function()

RegisterNetEvent('myshopscript:sendMenu', function()
    TriggerEvent('nh-context:sendMenu', {
        {
            id = 1,
            header = "Shop",
            txt = ""
        },
        {
            id = 3,
            header = "Groceries",
            txt = "Open the shop menu",
            params = {
                event = "nh-context:testMenu3",
                args = {
                    number = 1,
                    id = 2
                }
            }
        },
        {
            id = 2,
            header = "Wholesale Items",
            txt = "Open the shop menu",
            params = {
                event = "nh-context:testMenu2",
                args = {
                    number = 1,
                    id = 2
                }
            }
        },
    })
end)

RegisterNetEvent('nh-context:testMenu2', function(data)
    local id = data.id
    local number = data.number
    TriggerEvent('nh-context:sendMenu', {
        {
            id = 1,
            header = "< Go Back",
            txt = "",
            params = {
                event = "myshopscript:sendMenu"
            }
        },
        {
            id = 2,
            header = "Repairkit",
            txt = "$1000",
            params = {
                event = "supreme_buy:grabRepairKit"
            }
        },
        {
            id = 3,
            header = "Blowtorch",
            txt = "$500",
            params = {
                event = "supreme_buy:grabBlowtorch"
            }
        },
    })
end)

RegisterNetEvent('nh-context:testMenu3', function(data)
    local id = data.id
    local number = data.number
    TriggerEvent('nh-context:sendMenu', {
        {
            id = 1,
            header = "< Go Back",
            txt = "",
            params = {
                event = "myshopscript:sendMenu"
            }
        },
        {
            id = 2,
            header = "Water",
            txt = "$35",
            params = {
                event = "supreme_buy:grabWater"
            }
        },
        {
            id = 3,
            header = "Bread",
            txt = "$35",
            params = {
                event = "supreme_buy:grabBread"
            }
        },
    })
end)

    local peds = {
        `a_m_y_indian_01`,
    }

exports['bt-target']:AddTargetModel(peds, {
        options = {
       	{
        event = "myshopscript:sendMenu",
        icon = "fas fa-shopping-cart",
        label = "Buy Items",
        },        	
    },
        job = {"all"},
        distance = 1.5
    })
end)

-- RepairKit --
RegisterNetEvent('supreme_buy:grabRepairKit')
AddEventHandler('supreme_buy:grabRepairKit',function()
    TriggerServerEvent('supreme_buy:RepairKitBuy')
end)

-- Blowtorch --
RegisterNetEvent('supreme_buy:grabBlowtorch')
AddEventHandler('supreme_buy:grabBlowtorch',function()
    TriggerServerEvent('supreme_buy:BlowtorchBuy')
end)

-- Water --
RegisterNetEvent('supreme_buy:grabWater')
AddEventHandler('supreme_buy:grabWater',function()
    TriggerServerEvent('supreme_buy:WaterBuy')
end)

-- Bread --
RegisterNetEvent('supreme_buy:grabBread')
AddEventHandler('supreme_buy:grabBread',function()
    TriggerServerEvent('supreme_buy:BreadBuy')
end)
