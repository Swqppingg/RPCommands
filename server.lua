-- Twitter Command
if Config.twitter then
RegisterCommand("twt", function(source, args, raw)
        if #args <= 0 then
        TriggerClientEvent('chatMessage', source, "^1Please provide a message.")
        else
        local message = table.concat(args, " ")
        local steam = GetPlayerName(source)
        args = table.concat(args, ' ')
        TriggerClientEvent('chatMessage', -1, "TWITTER | ".. GetPlayerName(source) .."", { 30, 144, 255 }, message)
    end
end)
end

-- Dispatch Command
if Config.dispatch then
RegisterCommand("dispatch", function(source, args, raw)
        if #args <= 0 then
        TriggerClientEvent('chatMessage', source, "^1Please provide a message.")
        else
        local message = table.concat(args, " ")
        TriggerClientEvent('chatMessage', -1, "Dispatch | ".. GetPlayerName(source) .."", { 30, 144, 255 }, message)
    end
end)
end

-- Darkweb Command
if Config.darkweb then
RegisterCommand("darkweb", function(source, args, raw)
        if #args <= 0 then
        TriggerClientEvent('chatMessage', source, "^1Please provide a message.")
        else
        local message = table.concat(args, " ")
        local steam = GetPlayerName(source)
        args = table.concat(args, ' ')
        TriggerClientEvent('chatMessage', -1, "Dark Web", { 33, 33, 38 }, message)
    end
end)
end

-- News Command
if Config.news then
RegisterCommand("news", function(source, args, raw)
        if #args <= 0 then
        TriggerClientEvent('chatMessage', source, "^1Please provide a message.")
        else
        local message = table.concat(args, " ")
        local steam = GetPlayerName(source)
        args = table.concat(args, ' ')
        TriggerClientEvent('chatMessage', -1, "NEWS | ".. GetPlayerName(source) .."", { 194, 255, 51 }, message)
    end
end)
end

-- Do Command
if Config.doo then
RegisterCommand("do", function(source, args, raw)
        if #args <= 0 then
        TriggerClientEvent('chatMessage', source, "^1Please provide a message.")
        else
        local message = table.concat(args, " ")
        TriggerClientEvent('chatMessage', -1, "Do | ".. GetPlayerName(source) .."", { 51, 153, 255 }, message)
    end
end)
end

-- OOC Command
if Config.ooc then
RegisterCommand("ooc", function(source, args, raw)
        if #args <= 0 then
        TriggerClientEvent('chatMessage', source, "^1Please provide a message.")
        else
        local message = table.concat(args, " ")
        local steam = GetPlayerName(source)
        args = table.concat(args, ' ')
        TriggerClientEvent('chatMessage', -1, "OOC | ".. GetPlayerName(source) .."", { 128, 128, 128 }, message)
    end
end)
end

-- Me Command
if Config.me then
RegisterCommand("me", function(source, args, raw)
        if #args <= 0 then
        TriggerClientEvent('chatMessage', source, "^1Please provide a message.")
        else
        local message = table.concat(args, " ")
        local steam = GetPlayerName(source)
        args = table.concat(args, ' ')
        TriggerClientEvent('chatMessage', -1, "Me | ".. GetPlayerName(source) .."", { 255, 0, 0 }, message)
    end
end)
end

-- ShowID Command
if Config.showid then
RegisterCommand("showid", function(source, color, msg)
	cm = stringsplit(msg, " ")
		CancelEvent()
		if tablelength(cm) == 3 then
			local firsname = tostring(cm[2])
			local lastname = tostring(cm[3])
		    TriggerClientEvent("sendMessageShowID", -1, source, firsname, lastname)
		else
		    TriggerClientEvent('chatMessage', source, "Use the following format:", {255, 0, 0}, "/showid [First Name] [Last Name]")
	    end
	end)
end


  
function stringsplit(inputstr, sep)
    if sep == nil then
        sep = "%s"
    end
    local t={} ; i=1
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
        t[i] = str
        i = i + 1
    end
    return t
end



function tablelength(T)
	local count = 0
	for _ in pairs(T) do count = count + 1 end
	return count
end


-- Version Check
Citizen.CreateThread(
	function()
		local vRaw = LoadResourceFile(GetCurrentResourceName(), 'version.json')
		if vRaw and Config.versionCheck then
			local v = json.decode(vRaw)
			PerformHttpRequest(
				'https://raw.githubusercontent.com/Swqppingg/RPCommands/main/version.json',
				function(code, res, headers)
					if code == 200 then
						local rv = json.decode(res)
						if rv.version ~= v.version then
							print(
								([[^1
-------------------------------------------------------
RPCommands
UPDATE: %s AVAILABLE
CHANGELOG: %s
-------------------------------------------------------
^0]]):format(
									rv.version,
									rv.changelog
								)
							)
						end
					else
						print('^RPCommands was unable to check version^0')
					end
				end,
				'GET'
			)
		end
	end
)
