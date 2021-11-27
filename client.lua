ESX = nil
allowed = false

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	ESX.PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
    allowed = false
end)

RegisterCommand(Config.command.name, function(source)
    if Config.command.enabled then
        TriggerEvent('m12impounder:impoundVeh')
    end
end)

RegisterNetEvent('m12impounder:impoundVeh')
AddEventHandler('m12impounder:impoundVeh', function()
    for k, selecctedJob in pairs(Config.allowedJobs) do
        if ESX.PlayerData.job and ESX.PlayerData.job.name == selecctedJob then
            allowed = true
            break
        end
    end

    if allowed then
        deleteCar()
    else
        TriggerEvent('chat:addMessage', {
            color = { 255, 0, 0},
            multiline = false,
            args = {"ERROR",_U('no_permisson')}
        })
    end
end)

--Function to delete the car
function deleteCar()
    local ped = PlayerPedId()

    if (DoesEntityExist(ped) and not IsEntityDead(ped)) then 
        local pos = GetEntityCoords(ped)

        if (IsPedSittingInAnyVehicle(ped)) then 
            if Config.insideImpound then
                local vehicle = GetVehiclePedIsIn(ped, false)

                if (GetPedInVehicleSeat(vehicle, -1 ) == ped) then 
                    DeleteFrontVeh(vehicle, Config.numRetries)
                    ExecuteCommand(_U('impounderDo'))
                end 
            end
        else
            local inFrontOfPlayer = GetOffsetFromEntityInWorldCoords(ped, 0.0, Config.distanceToCheck, 0.0)
            local vehicle = GetVehicleInDirection(ped, pos, inFrontOfPlayer)

            if (DoesEntityExist(vehicle)) then 
                
                TaskStartScenarioInPlace(PlayerPedId(), 'CODE_HUMAN_MEDIC_TEND_TO_DEAD', 0, true)
                Wait(6000)
                ClearPedTasks(PlayerPedId())
                DeleteFrontVeh(vehicle, Config.numRetries)
                ExecuteCommand(_U('impounderDo'))
            end 
        end 
    end 
end

--Function to delete car if this is in the front
function DeleteFrontVeh(veh, timeoutMax)
    local timeout = 0 

    SetEntityAsMissionEntity(veh, true, true)
    DeleteVehicle(veh)

    if (DoesEntityExist(veh)) then

        while (DoesEntityExist(veh) and timeout < timeoutMax) do 
            
            DeleteVehicle(veh)

            timeout = timeout + 1 
            Wait(500)
        end
    end 
end 

--Funtion to search vehicles in front of you
function GetVehicleInDirection(entFrom, coordFrom, coordTo )
	local rayHandle = StartShapeTestCapsule(coordFrom.x, coordFrom.y, coordFrom.z, coordTo.x, coordTo.y, coordTo.z, 5.0, 10, entFrom, 7)
    local _, _, _, _, vehicle = GetShapeTestResult(rayHandle)
    
    if (IsEntityAVehicle(vehicle)) then 
        return vehicle
    end 
end
