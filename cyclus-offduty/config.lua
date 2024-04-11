Cyclus = {}

-- Framework settings
Cyclus.VersionCheck = 'legacy' -- 'legacy' ESX Legacy (1.9.0 or +)  |  'old' ESX outdated (1.7.5 or -)  |  'qb' QB-verions
Cyclus.OXUse = false -- Option to use ox-target (ONLY if server-version is legacy), this enables spawning NPC's where you can interact the UI trough ox-target  [true = on, false = off]


-- OFF-DUTY settings
Cyclus.OffDuty = {
    {
        job = 'police', -- Job name of the specific service
        offjob = 'offpolice', -- Off-Job of the specific service 
        pedCoords = vector4(437.2370, -978.1722, 30.6896, 180.7632), -- Place/coord where the defined ped will spawn
        pedModel = "mp_m_securoguard_01", -- Model of the ped (https://docs.fivem.net/docs/game-references/ped-models/)
        coords = vector3(441.8991, -982.3894, 30.7424), -- Coords to go on-duty and off-duty
        text = '[~b~E~w~] Interactie', -- Drawtext or ox-target label thats displayed at specific coords
        distancetext = 1, -- Distance between player and coords (DrawText)
        distancemarker = 4, -- Distance between player and coords (DrawMarker)
        img = "https://cdn.discordapp.com/attachments/985133441651732490/988015833185910834/politie.png" -- Link for image that is displayed in the UI
    },
    {
        job = 'ambulance', -- Job name of the specific service
        offjob = 'offambulance', -- Off-Job of the specific service
        pedCoords = vector4(298.4236, -584.4792, 43.2608, 73.1603), -- Place/coord where the defined ped will spawn
        pedModel = "s_m_m_paramedic_01", -- Model of the ped (https://docs.fivem.net/docs/game-references/ped-models/)
        coords = vector3(339.2108, -589.6216, 43.2841), --  -- Coords to go on-duty and off-duty
        text = '[~b~E~w~] Interactie', -- Drawtext or ox-target label thats displayed at specific coords
        distancetext = 1, -- Distance between player and coords (DrawText)
        distancemarker = 4, -- Distance between player and coords (DrawMarker)
        img = "https://cdn.discordapp.com/attachments/985133441651732490/988018868968624198/veiligheidsregio.png" -- Link for image that is displayed in the UI
    },
    {
        job = 'mechanic', -- Job name of the specific service
        offjob = 'offmechanic', -- Off-Job of the specific service
        pedCoords = vector4(801.7994, -902.9090, 25.2515, 91.3230), -- Place/coord where the defined ped will spawn
        pedModel = "mp_m_waremech_01", -- Model of the ped (https://docs.fivem.net/docs/game-references/ped-models/)
        coords = vector3(805.7999, -885.3664, 25.2508), --  -- Coords to go on-duty and off-duty
        text = '[~b~E~w~] Interactie', -- Drawtext or ox-target label thats displayed at specific coords
        distancetext = 1, -- Distance between player and coords (DrawText)
        distancemarker = 4, -- Distance between player and coords (DrawMarker)
        img = "https://cdn.discordapp.com/attachments/985133441651732490/988017452547997766/anwb.png" -- Link for image that is displayed in the UI
    },
    {
        job = 'firefighter', -- Job name of the specific service
        offjob = 'offfirefighter', -- Off-Job of the specific service
        pedCoords = vector4(201.1926, -1646.3732, 29.8032, 191.8938), -- Place/coord where the defined ped will spawn
        pedModel = "s_m_y_fireman_01", -- Model of the ped (https://docs.fivem.net/docs/game-references/ped-models/)
        coords = vector3(197.9642, -1647.3796, 29.8032), --  -- Coords to go on-duty and off-duty
        text = '[~b~E~w~] Interactie', -- Drawtext or ox-target label thats displayed at specific coords
        distancetext = 1, -- Distance between player and coords (DrawText)
        distancemarker = 4, -- Distance between player and coords (DrawMarker)
        img = "https://cdn.discordapp.com/attachments/985133441651732490/988018059925139466/brandweer.png" -- Link for image that is displayed in the UI
    }
}