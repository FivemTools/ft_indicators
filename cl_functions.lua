-- @Date:   2017-06-25T19:36:28+02:00
-- @Project: FiveM Tools
-- @Last modified time: 2017-06-25T20:53:22+02:00
-- @License: GNU General Public License v3.0

-- Warning
function getWarningIndicator(vehicle)

  if DecorExistOn(vehicle, "_ft_indicatiors_warning") then
    return DecorGetBool(vehicle, "_ft_indicatiors_warning")
  else
    return false
  end

end

function setWarningIndicator(vehicle, status)

  DecorSetBool(vehicle, "_ft_indicatiors_warning", status)

end

function activeWarningIndicator(vehicle)

  status = not getWarningIndicator(vehicle)
  setRightIndicator(vehicle, status)
  setLeftIndicator(vehicle, status)
  setWarningIndicator(vehicle, status)

end

-- Left
function getLeftIndicator(vehicle)

  if DecorExistOn(vehicle, "_ft_indicatiors_left") then
    return DecorGetBool(vehicle, "_ft_indicatiors_left")
  else
    return false
  end

end

function setLeftIndicator(vehicle, status)

  DecorSetBool(vehicle, "_ft_indicatiors_left", status)
  TriggerServerEvent('ft_indicators:SvSetIndicator', 'left', status)

end

function activeLeftIndicator(vehicle)

  status = not getLeftIndicator(vehicle)
  if getWarningIndicator(vehicle) then
    setWarningIndicator(vehicle, false)
    status = true
  end

  setLeftIndicator(vehicle, status)
  setRightIndicator(vehicle, false)

end

-- Right
function getRightIndicator(vehicle)

  if DecorExistOn(vehicle, "_ft_indicatiors_right") then
    return DecorGetBool(vehicle, "_ft_indicatiors_right")
  else
    return false
  end

end

function setRightIndicator(vehicle, status)

  DecorSetBool(vehicle, "_ft_indicatiors_right", status)
  TriggerServerEvent('ft_indicators:SvSetIndicator', 'right', status)

end

function activeRightIndicator(vehicle)

  status = not getRightIndicator(vehicle)
  if getWarningIndicator(vehicle) then
    setWarningIndicator(vehicle, false)
    status = true
  end

  setRightIndicator(vehicle, status)
  setLeftIndicator(vehicle, false)

end
