--[[
  A contestable region is a region where a resource is given to
  whichever player has the most number of units for X consecutive
  seconds in the region

  -- NOTE: when making a contestable region, make sure exactly one
     unit is in the region in the editor.
]]





function map.Contestable_Create(region, unitManager, wc3api, triggers, logging)
  local contestable = {}
  contestable.error = false
  contestable.owner = wc3api.GetPlayerNeutralPassive()
  contestable.consecutiveCounter = 0
  contestable.currentBiggestPlayer = nil
  contestable.CHANGE_OWNER_COUNT = 9

  contestable.structure = unitManager.GetSingleUnitInRegionOrNil(region)

  if(contestable.structure == nil) then
    contestable.error = true
  end

  local contestableLog = {}
  contestableLog.type = logging.types.DEBUG

  function contestable.Update()
    local biggestPlayer = unitManager.GetPlayerWithMostUnitsInRegion(region)

    -- contestableLog.message = "biggestPlayer: " .. tostring(biggestPlayer)
    -- logging.Write(contestableLog)

    if biggestPlayer == contestable.currentBiggestPlayer then
      contestable.consecutiveCounter = contestable.consecutiveCounter + 1

      if contestable.consecutiveCounter >= contestable.CHANGE_OWNER_COUNT then
        contestable.owner = biggestPlayer
        contestable.consecutiveCounter = 0
        -- unitManager.ConvertUnitToOtherPlayer(contestable.structure, contestable.owner)
        -- contestableLog.message = "Contestable Owner: " .. tostring(contestable.owner)
        -- logging.Write(contestableLog)
      end
    else
      contestable.currentBiggestPlayer = biggestPlayer
      contestable.consecutiveCounter = 0
    end
  end

  return contestable
end


function map.ContestableManager_Create(editor, unitManager, wc3api, triggers, logging)
  local contestableManager = {}
  contestableManager.PERIOD = 1.0
  contestableManager.list = {}

  -- TODO: Use "region" consistently
  for _,rect in pairs(editor.contestableRects) do
    local contestable = map.Contestable_Create(rect, unitManager, wc3api, triggers, logging)
    table.insert(contestableManager.list, contestable)
  end

  local function CheckAllContestables()
    local function CheckAllContestables2()
      for k,contestable in pairs(contestableManager.list) do
        contestable.Update()
      end
    end
    xpcall(CheckAllContestables2, print)
  end

  local periodicTrigger = triggers.CreatePeriodicTrigger(contestableManager.PERIOD, CheckAllContestables)


  return contestableManager
end



function map.Contestable_Tests(testFramework)
  testFramework.Suites.ContestableSuite = {}
  testFramework.Suites.ContestableSuite.Tests = {}
  local tsc = testFramework.Suites.ContestableSuite

  -- function wc3api.BJDebugMsg(p1) end

  local unitManager = {}
  local triggers = {}
  local logging = {}
  logging.types = {}
  logging.types.DEBUG = 1
  function logging.Write(p1) end

  function unitManager.ConvertUnitToOtherPlayer(p1, p2)
  end

  function tsc.Setup() end
  function tsc.Teardown() end

  function tsc.Tests.CreateSingleContestableWithError()
    local region = {}
    local unitManager = {}
    local wc3api = {}
    function wc3api.GetPlayerNeutralPassive()
      return "neutral"
    end
    function unitManager.GetSingleUnitInRegionOrNil(region)
      return nil
    end
    function unitManager.ConvertUnitToOtherPlayer(p1, p2)
    end

    local contestable = map.Contestable_Create(region, unitManager, wc3api, triggers, logging)
    assert(contestable.error == true)
  end

  function tsc.Tests.CreateSingleContestableWithoutError()
    local region = {}
    local unitManager = {}
    local wc3api = {}
    function wc3api.GetPlayerNeutralPassive()
      return "neutral"
    end
    function unitManager.GetSingleUnitInRegionOrNil(region)
      return "unit1"
    end
    local contestable = map.Contestable_Create(region, unitManager, wc3api, triggers, logging)
    assert(contestable.error == false)
  end

  function tsc.Tests.ContestableUpdates()
    local region = {}
    local unitManager = {}
    local wc3api = {}
    function wc3api.GetPlayerNeutralPassive()
      return "neutral"
    end
    function unitManager.GetSingleUnitInRegionOrNil(region)
      return "unit1"
    end
    function unitManager.GetPlayerWithMostUnitsInRegion(region)
      return "player1"
    end
    function unitManager.ConvertUnitToOtherPlayer(p1, p2)
    end

    local contestable = map.Contestable_Create(region, unitManager, wc3api, triggers, logging)
    local player = contestable.Update()

    assert(contestable.consecutiveCounter == 0)
  end

  function tsc.Tests.ContestableResets()
    local region = {}
    local unitManager = {}
    local wc3api = {}
    function wc3api.GetPlayerNeutralPassive()
      return "neutral"
    end
    function unitManager.GetSingleUnitInRegionOrNil(region)
      return "unit1"
    end
    function unitManager.GetPlayerWithMostUnitsInRegion(region)
      return "player1"
    end
    function unitManager.ConvertUnitToOtherPlayer(p1, p2)
    end
    
    local contestable = map.Contestable_Create(region, unitManager, wc3api, triggers, logging)
    local player = contestable.Update()
    player = contestable.Update()

    function unitManager.GetPlayerWithMostUnitsInRegion(region)
      return "player2"
    end

    player = contestable.Update()

    assert(contestable.consecutiveCounter == 0)
  end

  function tsc.Tests.ContestableChangesOwner()
    local region = {}
    local unitManager = {}
    local wc3api = {}
    function wc3api.GetPlayerNeutralPassive()
      return "neutral"
    end
    function unitManager.GetSingleUnitInRegionOrNil(region)
      return "unit1"
    end
    function unitManager.GetPlayerWithMostUnitsInRegion(region)
      return "player1"
    end
    function unitManager.ConvertUnitToOtherPlayer(p1, p2)
    end

    local contestable = map.Contestable_Create(region, unitManager, wc3api, triggers, logging)
    local player = {}

    assert(contestable.owner == "neutral")

    for i=1, 10 do
      player = contestable.Update()
    end

    assert(contestable.consecutiveCounter == 0)
    assert(contestable.owner == "player1")
  end

  function tsc.Tests.ContestableManager()
    local editor = {}
    editor.region1 = {}
    editor.region2 = {}


    -- local contestableManager = ContestableManager_Create(region, editor, unitManager, wc3api, triggers)
  end

end




--[[
function map.Contestable_Create(rect, wc3api, unitManager)
  local contestable = {}
  contestable.contested = false
  contestable.unitCount = 0 -- This is used to see if the rect starts with one unit
  contestable.error = false
  contestable.owningPlayer = nil

  -- Check for contested status
  function contestable.Update()
    return unitManager.GetPlayerWithMostUnitsInRegion(rect)
  end

  local function GetContestableUnit()
    contestable.unitCount = contestable.unitCount + 1
    contestable.theUnit = wc3api.GetTriggerUnit()
    contestable.owningPlayer = wc3api.Player(wc3api.GetPlayerNeutralPassive())
    contestable.contested = false
  end
  -- wc3api.DisplayTextToPlayer(wc3api.Player(0), 0, 0, wc3api.GetPlayerName(wc3api.Player(wc3api.GetPlayerNeutralPassive())))

  -- Begin the init part:

  -- wc3api.DisplayTextToPlayer(wc3api.Player(0), 0, 0, "here1")

  -- Create a group to count the contestable units
  contestable.g = wc3api.CreateGroup()

  -- Collect each unit of the rect into the new group
  wc3api.GroupEnumUnitsInRect(contestable.g, rect, wc3api.constants.NO_FILTER)

  -- For each unit in the group, call GetContestableUnit
  wc3api.ForGroup(contestable.g, GetContestableUnit)

  -- wc3api.DisplayTextToPlayer(wc3api.Player(0), 0, 0, "here2")

  if(contestable.unitCount ~= 1) then
    contestable.error = true
  end

  -- wc3api.DisplayTextToPlayer(wc3api.Player(0), 0, 0, "here3")
  return contestable
end


function map.ContestableManager_Create(wc3api, editor, commands, players, utility)
  local contestableManager = {}
  local currentIndex = 1
  contestableManager.list = {}
  contestableManager.checkTime = 1.0

  local cts = map.Contestable_Create(editor.contestedShipyardRect1, wc3api)

  contestableManager.list[1] = cts



  -- The main routine for updating contestable states
  local function periodicContestable()
    local function periodicContestable2()
      xpcall(contestableManager.list[1].Update, print)
    end
    xpcall(periodicContestable2, print)
  end

  -- Initialize the periodic trigger to update contestables
  contestableManager.periodicTrigger = wc3api.CreateTrigger()
  wc3api.TriggerAddAction(contestableManager.periodicTrigger, periodicContestable)
  wc3api.TriggerRegisterTimerEvent(contestableManager.periodicTrigger, contestableManager.checkTime, wc3api.constants.IS_PERIODIC)


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
      wc3api.DisplayTextToPlayer(commandingPlayer, 0, 0, #contestableManager.list)
      return
    end

    -- Do nothing if the parameter makes no sense
    if(param > #contestable.list) then
      return
    end

    local displayInfo = ""

    local cinfo = contestableManager.list[param]

    -- displayInfo = displayInfo .. "[name: " .. cinfo.name .. "] - "
    displayInfo = displayInfo .. "[owner: " .. cinfo.owningPlayer .. "] - "
    wc3api.DisplayTextToPlayer(commandingPlayer, 0, 0, displayInfo)
  end
  commands.Add(contestableDetailsCommand)

  return contestableManager
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
    wc3api.GetPlayerNeutralPassive = function() return "neutral" end
  end

  function tsc.Teardown() end

  local function CreateNormalContestable()
    local rect = {}

    wc3api.ForGroup = function(p1, p2)
      p2()
    end
    local contestable = map.Contestable_Create(rect, wc3api)

    return contestable
  end

  function tsc.Tests.CreateSingleContestableWithoutError()
    local rect = {}

    wc3api.ForGroup = function(p1, p2)
      p2()
    end

    local contestable = map.Contestable_Create(rect, wc3api)

    assert(contestable.error == false)
  end

  function tsc.Tests.CreateSingleContestableWithError()
    local rect = {}

    wc3api.ForGroup = function(p1, p2)
      p2()
      p2()
    end

    local contestable = map.Contestable_Create(rect, wc3api)

    assert(contestable.error == true)
  end

  function tsc.Tests.ContestableUpdateReturnsPlayer1()
    local contestable = CreateNormalContestable()

    local units = {}
    units[1] = {}
    units[1].owningPlayer = "player1"

    local index = 1
    wc3api.GetTriggerUnit = function()
      local returnUnit = units[index]
      index = index + 1
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

    local player = contestable.Update()

    assert(player == "player1")
  end

  function tsc.Tests.ContestableUpdateReturnsPlayer3()
    local contestable = CreateNormalContestable()

    local units = {}
    units[1] = {}
    units[1].owningPlayer = "player1"
    units[2] = {}
    units[2].owningPlayer = "player2"
    units[3] = {}
    units[3].owningPlayer = "player3"
    units[4] = {}
    units[4].owningPlayer = "player3"

    local index = 1
    wc3api.GetTriggerUnit = function()
      local returnUnit = units[index]
      index = index + 1
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

    local player = contestable.Update()

    assert(player == "player3")
    
  end

  function tsc.Tests.ContestableUpdateReturnsNeutral()
    local contestable = CreateNormalContestable()

    local units = {}
    units[1] = {}
    units[1].owningPlayer = "player1"
    units[2] = {}
    units[2].owningPlayer = "player2"

    local index = 1
    wc3api.GetTriggerUnit = function()
      local returnUnit = units[index]
      index = index + 1
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

    local player = contestable.Update()

    assert(player == "neutral")
  end

  function tsc.Tests.ContestableManagerCommand()
    function map.Contestable_Create(p1, p2)
      local cts = {}
      cts.Update = function()
      end
      cts.name = "dummy"
      cts.state = "nothing"
      return cts
    end
    local cm = map.ContestableManager_Create(wc3api, editor, commands, players, utility)

    assert(cm.list[1].name == "dummy")
  end

  -- function tsc.Tests.MoreThanOneUnitInRegionChecked()
  if(false) then
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
  -- function tsc.Tests.TestContestableCommand()
  if(false) then
    normalSetup()

    local contestable = map.Contestable_Create(wc3api, editor, commands, players, utility)

    theCommand:Handler()
  end

  -- function tsc.Tests.ContestableStartsOwned()
  if(false) then
    normalSetup()

    local contestable = map.Contestable_Create(wc3api, editor, commands, players, utility)

    assert(contestable.list[1].state == contestable.states.OWNED)
  end

  --function tsc.Tests.ContestableBecomesContested()
  if(false) then
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

    -- Remove crect2 to test a single crect
    local crect2 = table.remove(contestable.list)

    assert(contestable.list[1].state == contestable.states.OWNED)

    periodicContestable()

    assert(contestable.list[1].state == contestable.states.CONTESTED)
  end

end
--]]


