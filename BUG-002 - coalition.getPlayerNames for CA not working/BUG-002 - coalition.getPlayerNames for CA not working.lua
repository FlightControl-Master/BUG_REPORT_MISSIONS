

function ShowPlayers()

  local CoalitionsData = { AlivePlayersRed = coalition.getPlayers( coalition.side.RED ), AlivePlayersBlue = coalition.getPlayers( coalition.side.BLUE ) }
  for CoalitionId, CoalitionData in pairs( CoalitionsData ) do
    for UnitId, UnitData in pairs( CoalitionData ) do
      if UnitData and UnitData:isExist() then
      
        local UnitName = UnitData:getName()
        local PlayerName = UnitData:getPlayerName()

        trigger.action.outText( PlayerName .. " in " .. UnitName, 5 ) 
      end
    end
  end
  
end

