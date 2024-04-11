if Cyclus.VersionCheck == 'legacy' then
    ESX = exports["es_extended"]:getSharedObject()
elseif Cyclus.VersionCheck == 'old' then
    ESX = nil
elseif Cyclus.VersionCheck == 'qb' then
    QBCore = exports['qb-core']:GetCoreObject()
end

if Cyclus.VersionCheck == 'legacy' or 'old' then
    RegisterServerEvent("cyclus-offduty:server:changeJob", function(job)
        local src = source 
        local xPlayer = ESX.GetPlayerFromId(src)
        local jobGrade = xPlayer.job.grade

        xPlayer.setJob(job, jobGrade)
        TriggerClientEvent("cyclus-offduty:server:notify", source)
    end)
elseif Cyclus.VersionCheck == 'qb' then
    RegisterServerEvent("cyclus-offduty:server:changeJob", function(job)
        local src = source 
        local xPlayer = QBCore.Functions.GetPlayer(src)
        local jobGrade = xPlayer.job.grade

        xPlayer.setJob(job, jobGrade)
        TriggerClientEvent("cyclus-offduty:server:notify", source)
    end)
end
