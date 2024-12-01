--[[
  A contestable region is a region where a resource is given to
  whichever player has the most number of units for X consecutive
  seconds in the region

  -- NOTE: when making a contestable region, make sure exactly one
     unit is in the region in the editor.
]]



function map.Contestable_Create(wc3api, editor, commands, players, utility)
  local contestable = {}
  local currentIndex = 1
  contestable.list = {}
  contestable.states = {
    OWNED = 1,
    CONTESTED = 2,
  }
  local contestableCheckTime = 1.0

  local function switchUnitToPlayer(unit, player)
    -- local baseID = wc3api.GetUnitTypeId(theBuilding)
    -- local basex = wc3api.GetUnitX(theBuilding)
    -- local basey = wc3api.GetUnitY(theBuilding)
    -- local baseface = wc3api.GetUnitFacing(theBuilding)
    -- wc3api.RemoveUnit(theBuilding)
    -- wc3api.RemoveUnit(wagonData.unit)
    -- wagonData.unit = nil
    -- wc3api.CreateUnit(wagonData.playerref, baseID, basex, basey, baseface)
  end

  -- Go through all rects and set them up
  for _,crect in pairs(editor.contestableRects) do
    -- cinfo contains the information about a contestable
    local cinfo = {}
    cinfo.unitCount = 0
    local function setupCrect()
      cinfo.unitCount = cinfo.unitCount + 1
      -- The unit is the contestable unit
      cinfo.cUnit = wc3api.GetTriggerUnit()
      -- cinfo.name = wc3api.GetUnitName(cinfo.cUnit) -- This is apparently broken?
      cinfo.name = tostring(currentIndex)
      cinfo.counter = 0
      cinfo.owningPlayer = wc3api.GetPlayerNeutralPassive()
      cinfo.state = contestable.states.OWNED
    end

    -- Create a group of units to count the contestable units
    cinfo.g = wc3api.CreateGroup()

    -- Collect each unit of the rect into the new group
    wc3api.GroupEnumUnitsInRect(cinfo.g, crect, wc3api.constants.NO_FILTER)

    -- For each unit in the group, call setupCrect
    wc3api.ForGroup(cinfo.g, setupCrect)

    if(cinfo.unitCount ~= 1) then
      cinfo.error = true
    end

    cinfo.crect = crect
    contestable.list[currentIndex] = cinfo
    currentIndex = currentIndex + 1
    -- wc3api.DestroyGroup(cinfo.g)
    -- cinfo.g = nil
  end

  -- The main routine for updating contestable states
  local function periodicContestable()
    local function periodicContestable2()
      -- Returns true if region is contested
      local function checkRegion(cinfo)
        local playerUnits = {}
        local function countPlayerUnits()
          local theUnit = wc3api.GetTriggerUnit()
          print(theUnit)
          local owningPlayer = wc3api.GetOwningPlayer(theUnit)
          print(owningPlayer)
          playerUnits[owningPlayer].count = playerUnits[owningPlayer].count + 1
        end
        wc3api.GroupEnumUnitsInRect(cinfo.g, crect, wc3api.constants.NO_FILTER)
        wc3api.ForGroup(cinfo.g, countPlayerUnits)

        local biggest = 0
        local biggestPlayer = nil
        for k,v in pairs(playerUnits) do
          if v.count > biggest then
            biggest = v.count
            biggestPlayer = k
          end
        end
      end
      for _, cinfo in pairs(contestable.list) do
        if (cinfo.state == contestable.states.OWNED) then
          local contested = checkRegion(cinfo)
        elseif (cinfo.state == contestable.states.CONTESTED) then
        end
      end
    end
    xpcall(periodicContestable2, print)
  end

  -- Initialize the periodic trigger to update contestables
  contestable.periodicTrigger = wc3api.CreateTrigger()
  wc3api.TriggerAddAction(contestable.periodicTrigger, periodicContestable)
  wc3api.TriggerRegisterTimerEvent(contestable.periodicTrigger, contestableCheckTime, wc3api.constants.IS_PERIODIC)

  -- Commands:
  -- contestable: displays number of contestables
  -- contestable 1: shows information regarding the first contestable (current state, owned by whom)
  local contestableDetailsCommand = {}
  contestableDetailsCommand.activator = "-contestable"
  contestableDetailsCommand.users = players.AUTHENTICATED_PLAYERS
  function contestableDetailsCommand:Handler()
    local commandingPlayer = wc3api.GetTriggerPlayer()
    -- "-contestable 1"
    local cmdString = wc3api.GetEventPlayerChatString()
    --
    local splitString = utility.Split(cmdString)
    -- Get the actual parameter. if tonumber returns nil,
    -- then the user only typed "-contestable"
    local param = tonumber(table.remove(splitString))

    if(type(param) == type(nil)) then
      wc3api.DisplayTextToPlayer(commandingPlayer, 0, 0, #contestable.list)
      return
    end

    -- Do nothing if the parameter makes no sense
    if(param > #contestable.list) then
      return
    end

    local displayInfo = ""

    local cinfo = contestable.list[param]

    displayInfo = displayInfo .. "[name: " .. cinfo.name .. "] - "
    displayInfo = displayInfo .. "[state: " .. cinfo.state .. "] - "
    wc3api.DisplayTextToPlayer(commandingPlayer, 0, 0, displayInfo)
  end
  commands.Add(contestableDetailsCommand)

  return contestable
end

function map.Contestable_Tests(testFramework)
  testFramework.Suites.ContestableSuite = {}
  testFramework.Suites.ContestableSuite.Tests = {}
  local tsc = testFramework.Suites.ContestableSuite
  local wc3api = {}
  local editor = {}
  local commands = {}
  local players = {}
  local utility = {}

  local theCommand = {}
  local infoToDisplay = ""

  -- Capture the contestable's periodicContestable
  local periodicContestable = {}

  function tsc.Setup()
    theCommand = {}
    infoToDisplay = ""
    wc3api.constants = {}
    wc3api.constants.NO_FILTER = nil
    editor.contestableRects = {}
    wc3api.GroupEnumUnitsInRect = function(p1, p2, p3) end
    wc3api.ForGroup = function(p1, p2) end
    wc3api.CreateGroup = function() end
    wc3api.DestroyGroup = function() end
    wc3api.GetTriggerUnit = function() end
    wc3api.CreateTrigger = function() end
    wc3api.TriggerAddAction = function(p1, p2) end
    wc3api.TriggerRegisterTimerEvent = function(p1, p2, p3) end
    wc3api.GetEventPlayerChatString = function() end
    wc3api.GetTriggerPlayer = function() end
    wc3api.DisplayTextToPlayer = function(p1, p2, p3, p4) end
    utility.Split = function(p1) end
    commands.Add = function(p1) end
    wc3api.GetUnitName = function(p1) end
    wc3api.GetPlayerNeutralPassive = function() end
  end

  function tsc.Teardown() end

  function tsc.Tests.MoreThanOneUnitInRegionChecked()
    editor.contestableRects.crect1 = "crect1"
    editor.contestableRects.crect2 = "crect2"
    wc3api.ForGroup = function(p1, p2)
      -- If ForGroup calls the function p2 more than once,
      -- that means there's more than one unit in the group.
      -- Treat that as an error.
      p2()
      p2()
    end

    local contestable = map.Contestable_Create(wc3api, editor, commands, players, utility)

    for _, cinfo in pairs(contestable.list) do
      assert(cinfo.error == true)
    end
  end

  function normalSetup()
    wc3api.GetPlayerNeutralPassive = function()
      return "passive"
    end
    wc3api.DisplayTextToPlayer = function(p1, p2, p3, p4)
      infoToDisplay = p4
    end
    utility.Split = function(p1)
      local commandWords = {}
      table.insert(commandWords, "1")
      return commandWords
    end
    commands.Add = function(p1)
      theCommand = p1
    end
    wc3api.GetUnitName = function(p1)
      return "dummy"
    end

    editor.contestableRects.crect1 = "crect1"
    editor.contestableRects.crect2 = "crect2"
    wc3api.ForGroup = function(p1, p2)
      -- ForGroup calls setupCrect
      p2()
    end

    wc3api.GetTriggerUnit = function()
      local dummyUnit = {}
      return dummyUnit
    end

    wc3api.TriggerAddAction = function(p1, p2)
      periodicContestable = p2
    end
  end

  -- This test was used to build Contestable_Create, but there is no assert
  function tsc.Tests.TestContestableCommand()
    normalSetup()

    local contestable = map.Contestable_Create(wc3api, editor, commands, players, utility)

    theCommand:Handler()
  end

  function tsc.Tests.ContestableStartsOwned()
    normalSetup()

    local contestable = map.Contestable_Create(wc3api, editor, commands, players, utility)

    assert(contestable.list[1].state == contestable.states.OWNED)
  end

  function tsc.Tests.ContestableBecomesContested()
    normalSetup()

    local contestable = map.Contestable_Create(wc3api, editor, commands, players, utility)

    local units = {}
    units[1] = {}
    units[1].owningPlayer = "player1"
    units[2] = {}
    units[2].owningPlayer = "player1"
    units[3] = {}
    units[3].owningPlayer = "player2"

    local unitIndex = 1
    wc3api.GetTriggerUnit = function()
      local returnUnit = units[unitIndex]
      unitIndex = unitIndex + 1
      return returnUnit
    end

    wc3api.GetOwningPlayer = function(unit)
      return unit.owningPlayer
    end

    wc3api.ForGroup = function(p1, p2)
      for k,v in pairs(units) do
        p2()
      end
    end

    assert(contestable.list[1].state == contestable.states.OWNED)

    periodicContestable()

    assert(contestable.list[1].state == contestable.states.CONTESTED)
  end

end
