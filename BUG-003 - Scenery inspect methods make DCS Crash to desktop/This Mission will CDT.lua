EVENTMETA = {
   [world.event.S_EVENT_SHOT] = {
     Order = 1,
     Side = "I",
     Event = "OnEventShot",
     Text = "S_EVENT_SHOT" 
   },
   [world.event.S_EVENT_HIT] = {
     Order = 1,
     Side = "T",
     Event = "OnEventHit",
     Text = "S_EVENT_HIT" 
   },
   [world.event.S_EVENT_TAKEOFF] = {
     Order = 1,
     Side = "I",
     Event = "OnEventTakeoff",
     Text = "S_EVENT_TAKEOFF" 
   },
   [world.event.S_EVENT_LAND] = {
     Order = 1,
     Side = "I",
     Event = "OnEventLand",
     Text = "S_EVENT_LAND" 
   },
   [world.event.S_EVENT_CRASH] = {
     Order = -1,
     Side = "I",
     Event = "OnEventCrash",
     Text = "S_EVENT_CRASH" 
   },
   [world.event.S_EVENT_EJECTION] = {
     Order = 1,
     Side = "I",
     Event = "OnEventEjection",
     Text = "S_EVENT_EJECTION" 
   },
   [world.event.S_EVENT_REFUELING] = {
     Order = 1,
     Side = "I",
     Event = "OnEventRefueling",
     Text = "S_EVENT_REFUELING" 
   },
   [world.event.S_EVENT_DEAD] = {
     Order = -1,
     Side = "I",
     Event = "OnEventDead",
     Text = "S_EVENT_DEAD" 
   },
   [world.event.S_EVENT_PILOT_DEAD] = {
     Order = 1,
     Side = "I",
     Event = "OnEventPilotDead",
     Text = "S_EVENT_PILOT_DEAD" 
   },
   [world.event.S_EVENT_BASE_CAPTURED] = {
     Order = 1,
     Side = "I",
     Event = "OnEventBaseCaptured",
     Text = "S_EVENT_BASE_CAPTURED" 
   },
   [world.event.S_EVENT_MISSION_START] = {
     Order = 1,
     Side = "N",
     Event = "OnEventMissionStart",
     Text = "S_EVENT_MISSION_START" 
   },
   [world.event.S_EVENT_MISSION_END] = {
     Order = 1,
     Side = "N",
     Event = "OnEventMissionEnd",
     Text = "S_EVENT_MISSION_END" 
   },
   [world.event.S_EVENT_TOOK_CONTROL] = {
     Order = 1,
     Side = "N",
     Event = "OnEventTookControl",
     Text = "S_EVENT_TOOK_CONTROL" 
   },
   [world.event.S_EVENT_REFUELING_STOP] = {
     Order = 1,
     Side = "I",
     Event = "OnEventRefuelingStop",
     Text = "S_EVENT_REFUELING_STOP" 
   },
   [world.event.S_EVENT_BIRTH] = {
     Order = 1,
     Side = "I",
     Event = "OnEventBirth",
     Text = "S_EVENT_BIRTH" 
   },
   [world.event.S_EVENT_HUMAN_FAILURE] = {
     Order = 1,
     Side = "I",
     Event = "OnEventHumanFailure",
     Text = "S_EVENT_HUMAN_FAILURE" 
   },
   [world.event.S_EVENT_ENGINE_STARTUP] = {
     Order = 1,
     Side = "I",
     Event = "OnEventEngineStartup",
     Text = "S_EVENT_ENGINE_STARTUP" 
   },
   [world.event.S_EVENT_ENGINE_SHUTDOWN] = {
     Order = 1,
     Side = "I",
     Event = "OnEventEngineShutdown",
     Text = "S_EVENT_ENGINE_SHUTDOWN" 
   },
   [world.event.S_EVENT_PLAYER_ENTER_UNIT] = {
     Order = 1,
     Side = "I",
     Event = "OnEventPlayerEnterUnit",
     Text = "S_EVENT_PLAYER_ENTER_UNIT" 
   },
   [world.event.S_EVENT_PLAYER_LEAVE_UNIT] = {
     Order = -1,
     Side = "I",
     Event = "OnEventPlayerLeaveUnit",
     Text = "S_EVENT_PLAYER_LEAVE_UNIT" 
   },
   [world.event.S_EVENT_PLAYER_COMMENT] = {
     Order = 1,
     Side = "I",
     Event = "OnEventPlayerComment",
     Text = "S_EVENT_PLAYER_COMMENT" 
   },
   [world.event.S_EVENT_SHOOTING_START] = {
     Order = 1,
     Side = "I",
     Event = "OnEventShootingStart",
     Text = "S_EVENT_SHOOTING_START" 
   },
   [world.event.S_EVENT_SHOOTING_END] = {
     Order = 1,
     Side = "I",
     Event = "OnEventShootingEnd",
     Text = "S_EVENT_SHOOTING_END" 
   },
}

--porting in Slmod's "safestring" basic serialize
BS = function(s)
  if s == nil then
    return "\"\""
  else
    if ((type(s) == 'number') or (type(s) == 'boolean') or (type(s) == 'function') or (type(s) == 'table') or (type(s) == 'userdata') ) then
      return tostring(s)
    elseif type(s) == 'string' then
      s = string.format('%q', s)
      return s
    end
  end
end



OLS = function( tbl )  -- serialization of a table all on a single line, no comments, made to replace old get_table_string function

  lookup_table = {}
  
  local function _Serialize( tbl )

    if type(tbl) == 'table' then --function only works for tables!
    
      if lookup_table[tbl] then
        return lookup_table[object]
      end

      local tbl_str = {}
      
      lookup_table[tbl] = tbl_str
      
      tbl_str[#tbl_str + 1] = '{'

      for ind,val in pairs(tbl) do -- serialize its fields
        local ind_str = {}
        if type(ind) == "number" then
          ind_str[#ind_str + 1] = '['
          ind_str[#ind_str + 1] = tostring(ind)
          ind_str[#ind_str + 1] = ']='
        else --must be a string
          ind_str[#ind_str + 1] = '['
          ind_str[#ind_str + 1] = BS(ind)
          ind_str[#ind_str + 1] = ']='
        end

        local val_str = {}
        if ((type(val) == 'number') or (type(val) == 'boolean')) then
          val_str[#val_str + 1] = tostring(val)
          val_str[#val_str + 1] = ','
          tbl_str[#tbl_str + 1] = table.concat(ind_str)
          tbl_str[#tbl_str + 1] = table.concat(val_str)
      elseif type(val) == 'string' then
          val_str[#val_str + 1] = BS(val)
          val_str[#val_str + 1] = ','
          tbl_str[#tbl_str + 1] = table.concat(ind_str)
          tbl_str[#tbl_str + 1] = table.concat(val_str)
        elseif type(val) == 'nil' then -- won't ever happen, right?
          val_str[#val_str + 1] = 'nil,'
          tbl_str[#tbl_str + 1] = table.concat(ind_str)
          tbl_str[#tbl_str + 1] = table.concat(val_str)
        elseif type(val) == 'table' then
          if ind == "__index" then
          --  tbl_str[#tbl_str + 1] = "__index"
          --  tbl_str[#tbl_str + 1] = ','   --I think this is right, I just added it
          else

            val_str[#val_str + 1] = _Serialize(val)
            val_str[#val_str + 1] = ','   --I think this is right, I just added it
            tbl_str[#tbl_str + 1] = table.concat(ind_str)
            tbl_str[#tbl_str + 1] = table.concat(val_str)
          end
        elseif type(val) == 'function' then
          tbl_str[#tbl_str + 1] = "f() " .. tostring(ind)
          tbl_str[#tbl_str + 1] = ','   --I think this is right, I just added it
        else
          env.info( debug.traceback() )
        end
  
      end
      tbl_str[#tbl_str + 1] = '}'
      return table.concat(tbl_str)
    else
      return tostring(tbl)
    end
  end
  
  local objectreturn = _Serialize(tbl)
  return objectreturn
end


EventHandler = {}

function EventHandler:onEvent( EventData )
  
  if EventData and EventData.initiator then
    local EventText = EVENTMETA[EventData.id].Text
    
    if EventData and EventData.initiator then
      local Log = OLS( { Event = EventText, EventData = EventData } )
      env.info( Log )
      trigger.action.outText( Log, 15 ) 

      -- This will CDT DCS world.
      -- No check has been done if the initiator exists, and therefore, the following functions calls will crash DCS!
      -- This occurs when the S_EVENT_DEAD event happens, and the initiator is a SceneryObject, that is dead.

      local IniTypeName = EventData.initiator:getTypeName()
      local IniCategory = EventData.initiator:getCategory()
      Log = OLS( { IniTypeName = IniTypeName, InitCategory = IniCategory } )
      env.info( Log )
      trigger.action.outText( Log, 15 ) 

      local TgtExist = EventData.target and EventData.target:isExist()
      
      if TgtExist then
        local TgtTypeName = EventData.target:getTypeName()
        local TgtCategory = EventData.target:getCategory()
        Log = OLS( { TgrTypeName = TgtTypeName, TgtCategory = TgtCategory } )
        env.info( Log )
        trigger.action.outText( Log, 15 ) 
      
      end
      
    end
  end
end


local ID =  world.addEventHandler( EventHandler )
