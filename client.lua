local function DrawText3D(coords, text)
    local camCoords = GetFinalRenderedCamCoord()
    local distance = #(coords - camCoords)
    local scale = (0.8 / distance) * 2
    local fov = (1 / GetGameplayCamFov()) * 100
    scale = scale * fov
    SetTextScale(0.0 * scale, 0.55 * scale)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextDropShadow()
    SetTextColour(240, 240, 240, 185)
    BeginTextCommandDisplayText('STRING')
    SetTextCentre(true)
    AddTextComponentSubstringPlayerName(text)
    SetDrawOrigin(coords.xyz, 0)
    EndTextCommandDisplayText(0.0, 0.0)
    ClearDrawOrigin()
end

local function reqAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        RequestAnimDict(dict)
        Wait(2)
    end
end

local function reqParticle(dict)
	RequestNamedPtfxAsset(dict)
    while not HasNamedPtfxAssetLoaded(dict) do
        Wait(1)
    end
end

for k, v in pairs(Config.Fireworks) do
	if v.command then
		RegisterCommand(v.command, function(source, args, rawCommand)
			TriggerEvent('vms_firework:startFirework', k)
		end)
	end
end

local hasBox = nil
RegisterNetEvent('vms_firework:startFirework', function(type)
	if Config.DisableMultiplyFireworks then
		if hasBox then 
			return Config.Notification(Config.Translate['CANNOT_START'], 4500, 'error')
		end
	end
	if Config.Fireworks[type] then
		local myFirework = Config.Fireworks[type]
		local myPed = PlayerPedId()
		local myOffset = GetOffsetFromEntityInWorldCoords(myPed, 0, .6, 0)
		local fireworkShoots = myFirework.shoots
		local secondsToStart = myFirework.timeToStart
		reqAnimDict(Config.PlacingAnimation[1])
		TaskPlayAnim(myPed, Config.PlacingAnimation[1], Config.PlacingAnimation[2], -1, -8.0, 3000, 0, 0, false, false, false)
		Citizen.Wait((GetAnimDuration(Config.PlacingAnimation[1], Config.PlacingAnimation[2]) * 1000) - 2050)
		hasBox = CreateObject(myFirework.prop, myOffset.x, myOffset.y, myOffset.z, true, false, false)
		PlaceObjectOnGroundProperly(hasBox)
		FreezeEntityPosition(hasBox, true)
		Config.Notification(Config.Translate['YOU_PLACE_FIREWORK'], 4500, 'success')
		local boxCoords = GetEntityCoords(hasBox)
		while secondsToStart > 0 do
			secondsToStart = secondsToStart - 5
			if Config.Enable3DText then
				DrawText3D(boxCoords, secondsToStart/1000)
			end
			Citizen.Wait(0)
		end

		for k, v in pairs(myFirework.particles) do
			reqParticle(v.name)
		end

		while fireworkShoots ~= 0 do
			fireworkShoots = fireworkShoots - 1
			for k, v in pairs(myFirework.particles) do
				UseParticleFxAsset(v.name)
				local effect = StartNetworkedParticleFxNonLoopedAtCoord(
					v.effect, 
					boxCoords.x + (v.randomizeXY == true and math.random(-10, 10) or 0.0), 
					boxCoords.y + (v.randomizeXY == true and math.random(-10, 10) or 0.0), 
					boxCoords.z + v.plusHeight, 
					0.0, 
					0.0, 
					0.0, 
					v.scale, 
					false, 
					false, 
					false
				)
				if Config.Debug then
					print('[ Shoots left: '..fireworkShoots..' ]', "ID: "..k, v.name, v.effect)
				end
				Citizen.Wait(v.timeToNextShoot)
			end
			Citizen.Wait(myFirework.timeBetweenShoots or 300)
		end
		NetworkFadeOutEntity(hasBox, true, false)
		if Config.Debug then
			print('Prop is removed')
		end
		Citizen.Wait(5000)
		DeleteEntity(hasBox)
		hasBox = nil
	end
end)

RegisterNetEvent('vms_firework:notification', function(message, time, type)
	Config.Notification(Config.Translate[message], time, type)
end)