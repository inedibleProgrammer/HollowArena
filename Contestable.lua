--[[
  A contestable region is a region where a resource is given to
  whichever player has the most number of units for X consecutive
  seconds in the region

  -- NOTE: when making a contestable region, make sure exactly one
     unit is in the region in the editor.
]]





function map.Contestable_Create(region, unitManager, wc3api, triggers, logging, wagons)
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
    local function ConvertShipyard()
      for _,wagonData in pairs(wagons.list) do
        if contestable.owner == wagonData.playerref then
          if wagonData.race == "human" then
            contestable.structure = unitManager.ConvertUnitToOtherUnit(contestable.structure, wc3api.FourCC("h001"))
          elseif wagonData.race == "orc" then
            contestable.structure = unitManager.ConvertUnitToOtherUnit(contestable.structure, wc3api.FourCC("o000"))
          elseif wagonData.race == "undead" then
            contestable.structure = unitManager.ConvertUnitToOtherUnit(contestable.structure, wc3api.FourCC("u000"))
          elseif wagonData.race == "elf" then
            contestable.structure = unitManager.ConvertUnitToOtherUnit(contestable.structure, wc3api.FourCC("e000"))
          else
            contestable.structure = unitManager.ConvertUnitToOtherUnit(contestable.structure, wc3api.FourCC("h001"))
          end
        end
      end
    end


    local biggestPlayer = unitManager.GetPlayerWithMostUnitsInRegion(region)

    -- contestableLog.message = "biggestPlayer: " .. tostring(biggestPlayer)
    -- logging.Write(contestableLog)

    if biggestPlayer == contestable.currentBiggestPlayer then
      contestable.consecutiveCounter = contestable.consecutiveCounter + 1

      if contestable.consecutiveCounter >= contestable.CHANGE_OWNER_COUNT then
        if contestable.owner == biggestPlayer then
          return
        end

        contestable.owner = biggestPlayer
        contestable.consecutiveCounter = 0
        if(contestable.type == "shipyard") then
          ConvertShipyard()
        end
        unitManager.ConvertUnitToOtherPlayer(contestable.structure, contestable.owner)
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


function map.ContestableManager_Create(editor, unitManager, wc3api, triggers, logging, wagons)
  local contestableManager = {}
  contestableManager.PERIOD = 1.0
  contestableManager.list = {}

  -- TODO: Use "region" consistently
  for _,rect in pairs(editor.contestableRects) do
    local contestable = map.Contestable_Create(rect, unitManager, wc3api, triggers, logging, wagons)

    if rect == editor.contestedShipyardRect1 or
      rect == editor.contestedShipyardRect2 or
      rect == editor.contestedShipyardRect3 or
      rect == editor.contestedShipyardRect4 or
      rect == editor.contestedShipyardRect5 or
      rect == editor.contestedShipyardRect6 or
      rect == editor.contestedShipyardRect7 or
      rect == editor.contestedShipyardRect8 or
      rect == editor.contestedShipyardRect9 or
      rect == editor.contestedShipyardRect10
    then
      contestable.type = "shipyard"
    end

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

  local wc3api = {}
  local unitManager = {}
  local triggers = {}
  local logging = {}
  logging.types = {}
  logging.types.DEBUG = 1
  function logging.Write(p1) end

  local wagons = {}
  wagons.list = {}
  local firstWagon = {}
  firstWagon.playerref = "player1"
  firstWagon.race = "elf"

  function wc3api.FourCC(p1)
    return p1
  end

  function unitManager.ConvertUnitToOtherPlayer(p1, p2)
  end

  function tsc.Setup() end
  function tsc.Teardown() end

  function tsc.Tests.CreateSingleContestableWithError()
    local region = {}
    local unitManager = {}
    function wc3api.GetPlayerNeutralPassive()
      return "neutral"
    end
    function unitManager.GetSingleUnitInRegionOrNil(region)
      return nil
    end
    function unitManager.ConvertUnitToOtherPlayer(p1, p2)
    end

    local contestable = map.Contestable_Create(region, unitManager, wc3api, triggers, logging, wagons)
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
    local contestable = map.Contestable_Create(region, unitManager, wc3api, triggers, logging, wagons)
    assert(contestable.error == false)
  end

  function tsc.Tests.ContestableUpdates()
    local region = {}
    local unitManager = {}
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

    local contestable = map.Contestable_Create(region, unitManager, wc3api, triggers, logging, wagons)
    local player = contestable.Update()

    assert(contestable.consecutiveCounter == 0)
  end

  function tsc.Tests.ContestableResets()
    local region = {}
    local unitManager = {}
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
    
    local contestable = map.Contestable_Create(region, unitManager, wc3api, triggers, logging, wagons)
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

    local contestable = map.Contestable_Create(region, unitManager, wc3api, triggers, logging, wagons)
    contestable.type = "shipyard"
    function unitManager.ConvertUnitToOtherUnit(p1, p2)
      contestable.structure = p2
    end

    local player = {}

    assert(contestable.owner == "neutral")

    for i=1, 10 do
      player = contestable.Update()
    end

    assert(contestable.consecutiveCounter == 0)
    assert(contestable.owner == "player1")
  end

  function tsc.Tests.ContestableConvertsShipyard()
    local region = {}
    local unitManager = {}
    local wagons = {}
    wagons.list = {}
    local firstWagon = {}
    firstWagon.playerref = "player1"
    firstWagon.race = "elf"
    table.insert(wagons.list, firstWagon)
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


    local contestable = map.Contestable_Create(region, unitManager, wc3api, triggers, logging, wagons)
    contestable.type = "shipyard"

    function unitManager.ConvertUnitToOtherUnit(p1, p2)
      contestable.structure = p2
      return p2
    end

    assert(contestable.owner == "neutral")

    for i=1, 10 do
      player = contestable.Update()
    end
    assert(contestable.structure == "e000")
  end

  function tsc.Tests.ContestableManager()
    local editor = {}
    editor.region1 = {}
    editor.region2 = {}


    -- local contestableManager = ContestableManager_Create(region, editor, unitManager, wc3api, triggers)
  end

end


