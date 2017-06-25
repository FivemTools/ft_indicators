-- @Date:   2017-06-25T16:35:58+02:00
-- @Project: FiveM Tools
-- @Last modified time: 2017-06-25T20:53:41+02:00
-- @License: GNU General Public License v3.0

RegisterServerEvent('ft_indicators:SvSetIndicator')
AddEventHandler('ft_indicators:SvSetIndicator', function(direction, status)
	TriggerClientEvent('ft_indicators:ClUpdateIndicators', -1, source, direction, status)
end)
