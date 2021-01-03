local box = nil
local animka = 'anim@mp_fireworks'

RegisterNetEvent('vms-firework:goooo')
AddEventHandler('vms-firework:goooo', function()
	RequestAnimDict(animka)
	local ped = GetPlayerPed(-1)
	local kordy_g = GetEntityCoords(ped)
	local strzaly = 20
	TaskPlayAnim(ped, animka, 'place_firework_3_box', -1, -8.0, 3000, 0, 0, false, false, false)
	Citizen.Wait(4000)
	ClearPedTasks(ped)  
	box = CreateObject(GetHashKey('ind_prop_firework_03'), kordy_g, true, false, false)
	PlaceObjectOnGroundProperly(box)
	FreezeEntityPosition(box, true)
	local coordy_fajerwerki = GetEntityCoords(box)
	Citizen.Wait(5000)
	repeat
	UseParticleFxAssetNextCall("scr_indep_fireworks")
	StartNetworkedParticleFxNonLoopedAtCoord("scr_indep_firework_trailburst", coordy_fajerwerki, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
	Citizen.Wait(1000)
	UseParticleFxAssetNextCall("proj_indep_firework_v2")
	StartNetworkedParticleFxNonLoopedAtCoord("scr_firework_indep_burst_rwb", coordy_fajerwerki.x, coordy_fajerwerki.y, coordy_fajerwerki.z+30, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
	UseParticleFxAssetNextCall("proj_xmas_firework")
	StartNetworkedParticleFxNonLoopedAtCoord("scr_firework_xmas_ring_burst_rgw", coordy_fajerwerki.x, coordy_fajerwerki.y, coordy_fajerwerki.z+30, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
	strzaly = strzaly - 1
	Citizen.Wait(2000)
	until (strzaly == 0)
	DeleteEntity(box)
	box = nil
end)

RegisterNetEvent('vms-firework:goooo2')
AddEventHandler('vms-firework:goooo2', function()
	RequestAnimDict(animka)
	local ped = GetPlayerPed(-1)
	local kordy_g = GetEntityCoords(ped)
	local strzaly = 20
	TaskPlayAnim(ped, animka, 'place_firework_3_box', -1, -8.0, 3000, 0, 0, false, false, false)
	Citizen.Wait(4000)
	ClearPedTasks(ped)  
	box = CreateObject(GetHashKey('ind_prop_firework_03'), kordy_g, true, false, false)
	PlaceObjectOnGroundProperly(box)
	FreezeEntityPosition(box, true)
	local coordy_fajerwerki = GetEntityCoords(box)
	Citizen.Wait(5000)
	repeat
	UseParticleFxAssetNextCall("scr_indep_fireworks")
	StartNetworkedParticleFxNonLoopedAtCoord("scr_indep_firework_starburst", coordy_fajerwerki, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
	Citizen.Wait(900)
	UseParticleFxAssetNextCall("proj_indep_firework")
	StartNetworkedParticleFxNonLoopedAtCoord("scr_indep_firework_grd_burst", coordy_fajerwerki.x, coordy_fajerwerki.y, coordy_fajerwerki.z+25, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
	strzaly = strzaly - 1
	Citizen.Wait(2000)
	until (strzaly == 0)
	DeleteEntity(box)
	box = nil
end)

RegisterNetEvent('vms-firework:goooo3')
AddEventHandler('vms-firework:goooo3', function()
	RequestAnimDict(animka)
	local ped = GetPlayerPed(-1)
	local kordy_g = GetEntityCoords(ped)
	local strzaly = 30
	TaskPlayAnim(ped, animka, 'place_firework_3_box', -1, -8.0, 3000, 0, 0, false, false, false)
	Citizen.Wait(4000)
	ClearPedTasks(ped)  
	box = CreateObject(GetHashKey('ind_prop_firework_04'), kordy_g, true, false, false)
	PlaceObjectOnGroundProperly(box)
	FreezeEntityPosition(box, true)
	local coordy_fajerwerki = GetEntityCoords(box)
	Citizen.Wait(5000)
	repeat
	UseParticleFxAssetNextCall("scr_indep_fireworks")
	StartNetworkedParticleFxNonLoopedAtCoord("scr_indep_firework_fountain", coordy_fajerwerki, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
	strzaly = strzaly - 1
	Citizen.Wait(2000)
	until (strzaly == 0)
	DeleteEntity(box)
	box = nil
end)