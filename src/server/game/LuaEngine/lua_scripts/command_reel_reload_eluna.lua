-- ".reload eluna" also works
local function ElunaReload (event, player, command)
	if (command == ".reel") then
		ReloadEluna()
		player:CastSpell( player, 29422, 1 )
	end
end
RegisterPlayerEvent(42, ElunaReload)