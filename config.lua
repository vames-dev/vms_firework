-- Hi, if you like the script, join the discord: https://discord.gg/k4YNwYxE4h

Config = {}

Config.Debug = false

Config.Core = "ESX" -- "ESX" / "QB-Core"

if Config.Core == "ESX" then
    ESX = exports['es_extended']:getSharedObject()
elseif Config.Core == "QB-Core" then
    QBCore = exports['qb-core']:GetCoreObject()
end

Config.Notification = function(message, time, type)
    if type == "success" then
        exports["vms_notify"]:Notification("FIREWORK", message, time, "#27FF09", "fa-solid fa-fire")
        -- TriggerEvent('esx:showNotification', message) --[ ESX ]
        -- TriggerEvent('QBCore:Notify', message, 'success', time) -- [ QB-Core ]

    elseif type == "error" then
        exports["vms_notify"]:Notification("FIREWORK", message, time, "#FF0909", "fa-solid fa-fire")
        -- TriggerEvent('esx:showNotification', message) --[ ESX ]
        -- TriggerEvent('QBCore:Notify', message, 'error', time) -- [ QB-Core ]
        
    end
end

Config.Translate = {
    ['CANNOT_START'] = "You can't set off several fireworks at once, wait until the current one goes off", -- Only if: Config.DisableMultiplyFireworks = true
    ['NEED_LIGHTER'] = "You need have lighter!", -- Only if: Config.NeedLighter = true
    ['YOU_PLACE_FIREWORK'] = "You place the firework!",
}

Config.Enable3DText = true -- 3DText on fireworks, shows the time to go off

Config.PlacingAnimation = {'anim@mp_fireworks', 'place_firework_3_box'} -- Animation of placing firework

Config.DisableMultiplyFireworks = false -- if you set it true, the player will be able to place one firework, the next one only after he finishes shooting

Config.NeedLighter = true
Config.LighterItem = 'bread'


Config.Fireworks = {
    [1] = {
        item = 'firework_1', -- name or nil
        itemRemovable = true, -- if it is on the item, is it to be removed after use 
        command = 'fire_1', -- name of command or nil
        shoots = 50, -- count of shots
        prop = "ind_prop_firework_03",
        timeToStart = 5500, -- +/- 5000 == 5 seconds
        timeBetweenShoots = 1250,
        particles = {
            {name = "scr_indep_fireworks", effect = "scr_indep_firework_starburst", scale = 2.0, plusHeight = 50.0, randomizeXY = true, timeToNextShoot = 120},
            {name = "proj_indep_firework", effect = "scr_indep_firework_grd_burst", scale = 2.0, plusHeight = 50.0, randomizeXY = true, timeToNextShoot = 300},
            {name = "proj_indep_firework", effect = "scr_indep_firework_air_burst", scale = 2.0, plusHeight = 50.0, randomizeXY = true, timeToNextShoot = 600},
        },
    },
    [2] = {
        item = 'firework_2',
        itemRemovable = true,
        command = 'fire_2',
        shoots = 80,
        prop = "ind_prop_firework_03",
        timeToStart = 5500,
        timeBetweenShoots = 250,
        particles = {
            {name = "scr_indep_fireworks", effect = "scr_indep_firework_trailburst", scale = 2.0, plusHeight = 10.0, randomizeXY = true, timeToNextShoot = 125},
            {name = "proj_indep_firework_v2", effect = "scr_firework_indep_burst_rwb", scale = 1.0, plusHeight = 50.0, randomizeXY = true, timeToNextShoot = 125},
            {name = "proj_xmas_firework", effect = "scr_firework_xmas_ring_burst_rgw", scale = 1.0, plusHeight = 50.0, randomizeXY = true, timeToNextShoot = 125},
        },
    },
    [3] = {
        item = 'firework_3',
        itemRemovable = true,
        command = 'fire_3',
        shoots = 80,
        prop = "ind_prop_firework_03",
        timeToStart = 5500,
        timeBetweenShoots = 250,
        particles = {
            {name = "proj_indep_firework", effect = "scr_indep_firework_air_burst", scale = 1.0, plusHeight = 50.0, randomizeXY = true, timeToNextShoot = 125},
            {name = "proj_indep_firework_v2", effect = "scr_firework_indep_spiral_burst_rwb", scale = 1.0, plusHeight = 50.0, randomizeXY = true, timeToNextShoot = 125},
            {name = "proj_indep_firework_v2", effect = "scr_firework_indep_repeat_burst_rwb", scale = 1.0, plusHeight = 50.0, randomizeXY = true, timeToNextShoot = 125},
            {name = "scr_indep_fireworks", effect = "scr_indep_firework_starburst", scale = 1.0, plusHeight = 50.0, randomizeXY = true, timeToNextShoot = 125},
        },
    },
    [4] = {
        item = 'firework_4',
        itemRemovable = true,
        command = 'fire_4',
        shoots = 50,
        prop = "ind_prop_firework_03",
        timeToStart = 5000,
        timeBetweenShoots = 550,
        particles = {
            {name = "scr_indep_fireworks", effect = "scr_indep_firework_trailburst", scale = 4.0, plusHeight = 50.0, randomizeXY = true, timeToNextShoot = 10},
        },
    },
    [5] = {
        item = 'fontain_4',
        itemRemovable = true,
        command = 'fontain_4',
        shoots = 80,
        prop = "ind_prop_firework_04",
        timeToStart = 3500,
        timeBetweenShoots = 700,
        particles = {
            {name = "scr_indep_fireworks", effect = "scr_indep_firework_fountain", scale = 0.25, plusHeight = 0.25, randomizeXY = false, timeToNextShoot = 500},
        },
    },
    --[[
    [6] = {
        item = nil,
        itemRemovable = false,
        command = '',
        shoots = 1,
        prop = "ind_prop_firework_04",
        timeToStart = 1000,
        timeBetweenShoots = 100,
        particles = {
            -- {name = "proj_indep_firework", effect = "scr_indep_firework_grd_burst", scale = 2.0, plusHeight = 50.0, randomizeXY = true, timeToNextShoot = 600},
            -- {name = "proj_indep_firework", effect = "scr_indep_firework_air_burst", scale = 2.0, plusHeight = 50.0, randomizeXY = true, timeToNextShoot = 600},

            -- {name = "proj_indep_firework_v2", effect = "scr_firework_indep_burst_rwb", scale = 1.0, plusHeight = 50.0, randomizeXY = true, timeToNextShoot = 2025},
            -- {name = "proj_indep_firework_v2", effect = "scr_firework_indep_spiral_burst_rwb", scale = 1.0, plusHeight = 50.0, randomizeXY = true, timeToNextShoot = 2025},
            -- {name = "proj_indep_firework_v2", effect = "scr_firework_indep_ring_burst_rwb", scale = 1.0, plusHeight = 50.0, randomizeXY = true, timeToNextShoot = 2025},
            -- {name = "proj_indep_firework_v2", effect = "scr_xmas_firework_burst_fizzle", scale = 1.0, plusHeight = 50.0, randomizeXY = true, timeToNextShoot = 2025},
            -- {name = "proj_indep_firework_v2", effect = "scr_firework_indep_repeat_burst_rwb", scale = 1.0, plusHeight = 50.0, randomizeXY = true, timeToNextShoot = 2025},

            -- {name = "proj_xmas_firework", effect = "scr_firework_xmas_ring_burst_rgw", scale = 1.0, plusHeight = 50.0, randomizeXY = true, timeToNextShoot = 2025},
            -- {name = "proj_xmas_firework", effect = "scr_firework_xmas_burst_rgw", scale = 1.0, plusHeight = 50.0, randomizeXY = true, timeToNextShoot = 2025},
            -- {name = "proj_xmas_firework", effect = "scr_firework_xmas_repeat_burst_rgw", scale = 1.0, plusHeight = 50.0, randomizeXY = true, timeToNextShoot = 2025},
            -- {name = "proj_xmas_firework", effect = "scr_firework_xmas_spiral_burst_rgw", scale = 1.0, plusHeight = 50.0, randomizeXY = true, timeToNextShoot = 2025},

            -- {name = "scr_indep_fireworks", effect = "scr_indep_firework_starburst", scale = 1.0, plusHeight = 50.0, randomizeXY = true, timeToNextShoot = 2025},
            -- {name = "scr_indep_fireworks", effect = "scr_indep_firework_shotburst", scale = 1.0, plusHeight = 50.0, randomizeXY = true, timeToNextShoot = 2025},
            -- {name = "scr_indep_fireworks", effect = "scr_indep_firework_trailburst", scale = 1.0, plusHeight = 50.0, randomizeXY = true, timeToNextShoot = 2025},
            -- {name = "scr_indep_fireworks", effect = "scr_indep_firework_trailburst_spawn", scale = 1.0, plusHeight = 50.0, randomizeXY = true, timeToNextShoot = 2025},
            -- {name = "scr_indep_fireworks", effect = "scr_indep_firework_burst_spawn", scale = 1.0, plusHeight = 50.0, randomizeXY = true, timeToNextShoot = 2025},
            -- {name = "scr_indep_fireworks", effect = "scr_indep_firework_fountain", scale = 1.0, plusHeight = 50.0, randomizeXY = true, timeToNextShoot = 2025},
        },
    }
    ]]
}
