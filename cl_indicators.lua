-- @Date:   2017-06-25T16:35:50+02:00
-- @Project: FiveM Tools
-- @Last modified time: 2017-06-25T21:17:08+02:00
-- @License: GNU General Public License v3.0

-- Init --
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

		-- Complet join this server
		if NetworkIsSessionStarted() then
			DecorRegister("_ft_indicatiors_left", 1)
			DecorRegister("_ft_indicatiors_right", 1)
			DecorRegister("_ft_indicatiors_warning", 2)
			break
		end
	end
end)

-- Keypad --
Citizen.CreateThread(function()
    while true do

      Citizen.Wait(0)
      local playerPed = GetPlayerPed(-1)

      if IsPedInAnyVehicle(playerPed, true) then

        local vehicle = GetVehiclePedIsIn(playerPed, false)
				Citizen.Trace("id: " .. vehicle .. "\n")

				if GetPedInVehicleSeat(vehicle, -1) == playerPed then

	    		if IsControlJustPressed(1, Config.left) and GetLastInputMethod(2) then -- left
	          activeLeftIndicator(vehicle)
	    		end

	    		if IsControlJustPressed(1, Config.right) and GetLastInputMethod(2) then --right
	          activeRightIndicator(vehicle)
	    		end

					if IsControlJustPressed(1, Config.warning) and GetLastInputMethod(2) then -- warning
						activeWarningIndicator(vehicle)
					end

				end

      end

    end
end)

RegisterNetEvent('ft_indicators:ClUpdateIndicators')
AddEventHandler('ft_indicators:ClUpdateIndicators', function(playerId, direction, status)
  Citizen.CreateThread(function()

			local player = GetPlayerFromServerId(playerId)
			local playerPed = GetPlayerPed(player)

      if IsPedInAnyVehicle(playerPed, true) then

				local vehicle = GetVehiclePedIsIn(playerPed, false)
    		if direction == 'left' then
    			SetVehicleIndicatorLights(vehicle, 1, status)
    		elseif direction == 'right' then
    			SetVehicleIndicatorLights(vehicle, 0, status)
    		end

      end

  end)
end)
