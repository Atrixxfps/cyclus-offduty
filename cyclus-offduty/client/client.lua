local PlayerData = {}

if Cyclus.VersionCheck == 'legacy' then
    ESX = exports["es_extended"]:getSharedObject()
elseif Cyclus.VersionCheck == 'old' then
    ESX = nil
elseif Cyclus.VersionCheck == 'qb' then
    QBCore = exports['qb-core']:GetCoreObject()
end

CreateThread(function()
    if not Cyclus.VersionCheck == 'old' then return end

    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
    while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end
	PlayerData = ESX.GetPlayerData()
end)

if Cyclus.VersionCheck == 'legacy' or 'old' then
    RegisterNetEvent('esx:playerLoaded')
    AddEventHandler('esx:playerLoaded', function(xPlayer)
        PlayerData = xPlayer
    end)

    RegisterNetEvent('esx:setJob')
    AddEventHandler('esx:setJob', function(job)
        PlayerData.job = job
    end)
elseif Cyclus.VersionCheck == 'qb' then
    RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
    AddEventHandler('QBCore:Client:OnPlayerLoaded', function(xPlayer)
        PlayerData = xPlayer
    end)

    RegisterNetEvent('QBCore:Client:OnJobUpdate')
    AddEventHandler('QBCore:Client:OnJobUpdate', function(job)
        PlayerData.job = job
    end)
end

if Cyclus.OXUse then
    CreateThread(function()
        local npcSpawned = false 

        while true do
            local sleep = 1000
            local plyCoords = GetEntityCoords(PlayerPedId())

            for _, data in pairs(Cyclus.OffDuty) do
                local locationCoords = vector3(data.pedCoords.x, data.pedCoords.y, data.pedCoords.z - 1)
                local dist = #(plyCoords - locationCoords)

                if dist <= 50.0 and not npcSpawned then
                    sleep = 100
                    
                    local npcModel = data.pedModel
                    RequestModel(npcModel)
                    while not HasModelLoaded(npcModel) do 
                        Wait(500)
                    end

                    local pedObj = CreatePed(4, npcModel, locationCoords, data.pedCoords.w, false)
                    FreezeEntityPosition(pedObj, true)
                    SetEntityInvincible(pedObj, true)
                    SetBlockingOfNonTemporaryEvents(pedObj, true)
                    TaskStartScenarioInPlace(pedObj, "WORLD_HUMAN_CLIPBOARD", 0, true)

                    InitTarget(pedObj, data)
                    npcSpawned = true
                end
            end

            Wait(sleep)
        end
    end)

    function InitTarget(npcPed, data)
        exports.ox_target:addLocalEntity(npcPed, {
            {
                label = data.text,
                icon = "fas fa-id-card-clip",
                distance = 1.5,
                canInteract = function(distance)
                    return distance 
                end,
                onSelect = function(entity)
                    OpenMenu(data.job, data.offjob, data.img)
                end
            }
        })
    end
end


if not Cyclus.OXUse then
    CreateThread(function()
        while true do
            Citizen.Wait(0)
            local sleep = true
            local plyCoords = GetEntityCoords(PlayerPedId())
            local job = PlayerData.job

            if job ~= nil then
                for _, data in pairs(Cyclus.OffDuty) do
                    if job.name == data.job or job.name == data.offjob then
                        local locationCoords = vector3(data.coords.x, data.coords.y, data.coords.z)
                        local dist = #(plyCoords - locationCoords)

                        if dist < data.distancemarker then
                            DrawMarker(20, locationCoords, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.3, 0.3, 0.2, 46, 122, 221, 100, false, true, 2, true, false, false, false)
                            sleep = false

                            if dist < data.distancetext then
                                DrawScriptText(data.coords.x, data.coords.y, data.coords.z + 0.25, data.text)
                                if IsControlJustReleased(0, 38) then
                                    OpenMenu(data.job, data.offjob, data.img)
                                end
                            end
                        end
                    end
                end
                if sleep then 
                    Wait(1000)
                end
            end
            
        end
    end)
end



function OpenMenu(job, offjob, img)
    SetNuiFocus(true, true)
    TriggerScreenblurFadeIn(0)
    SendNUIMessage({
        action = 'open',
        steamnaam = GetPlayerName(PlayerId()),
        job = job,
        offjob = offjob,
        img = img
    })
end

RegisterNUICallback("veranderjob", function(data, cb)
    TriggerServerEvent("cyclus-offduty:server:changeJob", data.job)
end)

RegisterNUICallback("close", function()
    TriggerScreenblurFadeOut(0)
    SetNuiFocus(false, false)
end)