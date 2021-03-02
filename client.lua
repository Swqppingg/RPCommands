-- ShowID Command
RegisterNetEvent('sendMessageShowID')
AddEventHandler('sendMessageShowID', function(id, name1, name2)
  local myId = PlayerId()
  local pid = GetPlayerFromServerId(id)
  if pid == myId then
    TriggerEvent('chatMessage', "^2ID ^0|", {0, 150, 200}, " ^2First Name: ^0" .. name1 .." ^0| ^2Last Name: ^0".. name2 .. " ")
  elseif GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(myId)), GetEntityCoords(GetPlayerPed(pid)), true) < 1.5 then
    TriggerEvent('chatMessage', "^2ID ^0|", {0, 150, 200}, " ^2First Name: ^0" .. name1 .." ^0| ^2Last Name: ^0".. name2 .. " ")
  end
end)