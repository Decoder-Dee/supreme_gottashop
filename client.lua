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

RegisterNetEvent('supreme_gottashop:OpenMenu', function()
    TriggerEvent('nh-context:sendMenu', {
        {
            id = 1,
            header = "Buy Items",
            txt = ""
        },
        {
            id = 2,
            header = "Groceries",
            txt = "Buy your grocerie items here",
            params = {
                event = "supreme_gottashop:Groceries",
                args = {
                    number = 1,
                    id = 2
                }
            }
        },
        {
            id = 3,
            header = "Wholesale",
            txt = "Buy wholesale items here",
            params = {
                event = "supreme_gottashop:Wholesale",
                args = {
                    number = 1,
                    id = 2
                }
            }
        },
    })
end)

RegisterNetEvent('supreme_gottashop:Groceries', function(data)
    local id = data.id
    local number = data.number
    TriggerEvent('nh-context:sendMenu', {
        {
            id = 1,
            header = "< Go Back",
            txt = "",
            params = {
                event = "supreme_gottashop:OpenMenu"
            }
        },
        {
            id = 2,
            header = "Water",
            txt = "$35",
            params = {
                event = "supreme_gottashop:BuyItem",
                args = {
                    itemName = 'water',
					price = 35,
                    
                }
            }
        },
        {
            id = 3,
            header = "Bread",
            txt = "$35",
            params = {
                event = "supreme_gottashop:BuyItem",
                args = {
                    itemName = 'bread',
					price = 35,
                    
                }
            }
        },
    })
end)

RegisterNetEvent('supreme_gottashop:Wholesale', function(data)
    local id = data.id
    local number = data.number
    TriggerEvent('nh-context:sendMenu', {
        {
            id = 1,
            header = "< Go Back",
            txt = "",
            params = {
                event = "supreme_gottashop:OpenMenu"
            }
        },
        {
            id = 2,
            header = "Repairkit",
            txt = "$1000",
            params = {
                event = "supreme_gottashop:BuyItem",
                args = {
                    itemName = 'fixkit',
					price = 1000,
                    
                }
            }
        },
        {
            id = 3,
            header = "Lockpick",
            txt = "$250",
            params = {
                event = "supreme_gottashop:BuyItem",
                args = {
                    itemName = 'lockpick',
					price = 250,
                    
                }
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
        event = "supreme_gottashop:OpenMenu",
        icon = "fas fa-shopping-cart",
        label = "Buy Items",
        },        	
    },
        job = {"all"},
        distance = 1.5
    })
end)

RegisterNetEvent('supreme_gottashop:BuyItem')
AddEventHandler('supreme_gottashop:BuyItem', function(data)
    local itemName = data.itemName
    local price = data.price
    TriggerServerEvent('supreme_buy:SetBuy', itemName, price)
end) 
