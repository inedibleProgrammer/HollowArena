function map.Obelisk_FindTarget(unit, wc3api)
  -- Find a random player that has at least 1 unit
  local g = wc3api.CreateGroup()
  local playerID = 0
  local groupSize = 0
  repeat -- TODO: Keep a list of living players to optimize this
    playerID = wc3api.GetRandomInt(0, 11)
    wc3api.GroupEnumUnitsOfPlayer(g, wc3api.Player(playerID), wc3api.constants.NO_FILTER)
    groupSize = wc3api.BlzGroupGetSize(g)
  until (groupSize > 0)


  -- Find a random unit of that player to attack
  local randIndex = wc3api.GetRandomInt(0, groupSize)
  local unitTarget = wc3api.BlzGroupUnitAt(g, randIndex)
  wc3api.DestroyGroup(g)
  return unitTarget
end

function map.Obelisk_Create(x, y, player, wc3api, unitList, gamestate)
  local obelisk = {}
  obelisk.counter = 0

  function obelisk.Update()
    local function DetermineUnitToSpawn()
      local u = nil
      local isHero = true
      local levelRestraint = true
      local badUnit = false
      local attemptCounter = 10

      -- Select a random unit that is not a hero, and meets the level restraint:
      while( ((isHero == true) or (levelRestraint == true) or (badUnit == true)) and (attemptCounter >= 0) ) do
        local r = wc3api.GetRandomInt(1, #unitList.allUnitList)
        local uID = unitList.allUnitList[r]

        isHero = wc3api.IsHeroUnitId(wc3api.FourCC(unitList.allUnitList[r]))
        levelRestraint = (wc3api.GetFoodUsed(FourCC(uID)) > gamestate.terrorLevel)

        if(gamestate.terrorLevel < 1) then
          if(uID == "obai" -- Baine
             or uID == "nmed" -- Medivh
             or uID == "hcth" -- Captain
             or uID == "uktn") -- Kel'Thuzad
          then
            badUnit = true
          end
        end

        if(uID == "nspc") then -- Support column
          badUnit = true
        end

        if(isHero or levelRestraint) then
          -- Do nothing
        else
          if(badUnit) then
            -- Do nothing
          else
            -- u = wc3api.CreateUnit(this.player, wc3api.FourCC(unitList.allUnitList[r]), x, y, 0.0)
            return unitList.allUnitList[r]
          end
        end

        attemptCounter = attemptCounter - 1
      end
    end

    local function Modify(unit)
      wc3api.SetUnitCreepGuard(unit, false)
      wc3api.RemoveGuardPosition(unit)
      -- wc3api.SetUnitColor(unit,

      local currentHP = wc3api.BlzGetUnitMaxHP(unit)
      currentHP = currentHP + (100 * gamestate.unitSteroidCounter)
      wc3api.BlzSetUnitMaxHP(unit, currentHP)
      wc3api.SetUnitLifePercentBJ(unit, 100.0)
    end

    obelisk.counter = obelisk.counter + 1

    if(obelisk.counter >= gamestate.terrorSpawnPeriod) then
      obelisk.counter = 0

      for i=0, gamestate.terrorSpawnCount do
        local unitIDToSpawn = DetermineUnitToSpawn()
        local spawnedUnit = wc3api.CreateUnit(player, wc3api.FourCC(unitIDToSpawn), x, y, 0)
        Modify(spawnedUnit)
        local target = map.Obelisk_FindTarget(spawnedUnit, wc3api)
        wc3api.IssuePointOrder(spawnedUnit, "attack", wc3api.GetUnitX(target), wc3api.GetUnitY(target))
      end

    end
  end

  obelisk.u = wc3api.CreateUnit(player, wc3api.FourCC("nico"), x, y, 0)
  wc3api.BlzSetUnitMaxHP(obelisk.u, 500)
  wc3api.PingMinimapEx(x, y, 5, 255, 0, 0, false)

  return obelisk
end


function map.ObeliskManager_Create(wc3api, gamestate, editor, triggers, unitList)
  local obeliskManager = {}
  obeliskManager.UPDATE_PERIOD = 1.0
  obeliskManager.list = {}
  obeliskManager.spawnCounter = 0
  obeliskManager.lazyCheckCounter = 0
  obeliskManager.currentTerror = 1
  obeliskManager.LAZY_CHECK_PERIOD = 5
  obeliskManager.upgradeCounter = 0

  local function GetRandomRect()
    local randint = wc3api.GetRandomInt(1, #editor.obeliskRects)
    local randomRect = editor.obeliskRects[randint]
    return randomRect
  end

  local function GetRandomPointInRect(rect)
    local xmin = wc3api.GetRectMinX(rect)
    local xmax = wc3api.GetRectMaxX(rect)
    local ymin = wc3api.GetRectMinY(rect)
    local ymax = wc3api.GetRectMaxY(rect)

    local randx = wc3api.GetRandomReal(xmin, xmax)
    local randy = wc3api.GetRandomReal(ymin, ymax)
    local randpoint = {}
    randpoint.x = randx
    randpoint.y = randy
    return randpoint
  end

  local function HandleObelisks()
    local function HandleObelisks2()
      -- Create an obelisk every gamestate.time
      if(obeliskManager.spawnCounter == gamestate.obeliskSpawnPeriod) then
        obeliskManager.spawnCounter = 0

        local obeliskRect = GetRandomRect()
        local point = GetRandomPointInRect(obeliskRect)
        local terrorPlayer = wc3api.Player(editor.terrors[obeliskManager.currentTerror].playerID)

        local obelisk = map.Obelisk_Create(point.x, point.y, terrorPlayer, wc3api, unitList, gamestate)
        table.insert(obeliskManager.list, obelisk)

        obeliskManager.currentTerror = obeliskManager.currentTerror + 1
      end

      -- Check each obelisk
      for _, obelisk in pairs(obeliskManager.list) do
        obelisk.Update()
      end
      obeliskManager.spawnCounter = obeliskManager.spawnCounter + 1

      if(obeliskManager.upgradeCounter >= gamestate.terrorUpgradePeriod) then
        obeliskManager.upgradeCounter = 0

        if(gamestate.terrorLevel >= 10) then
          gamestate.unitSteroidCounter = gamestate.unitSteroidCounter + 1
        else
          gamestate.terrorLevel = gamestate.terrorLevel + 1
        end
      end
      obeliskManager.upgradeCounter = obeliskManager.upgradeCounter + 1

      if(obeliskManager.currentTerror > 4) then
        obeliskManager.currentTerror = 1
      end

      if(obeliskManager.lazyCheckCounter >= obeliskManager.LAZY_CHECK_PERIOD) then
        local function OrderLazyUnits()
          local function IsIdle()
            local u = wc3api.GetEnumUnit()
            if( (wc3api.GetUnitCurrentOrder(u) ~= 851983) ) then
              local target = map.Obelisk_FindTarget(u, wc3api)
              wc3api.IssuePointOrder(u, "attack", wc3api.GetUnitX(target), wc3api.GetUnitY(target))
            end
          end

          for _,terror in pairs(editor.terrors) do
            local g = wc3api.CreateGroup()
            local terrorPlayer = wc3api.Player(terror.playerID)

            wc3api.GroupEnumUnitsOfPlayer(g, terrorPlayer, wc3api.constants.NO_FILTER)
            wc3api.ForGroup(g, IsIdle)


            wc3api.DestroyGroup(g)
          end
        end
        obeliskManager.lazyCheckCounter = 0
        OrderLazyUnits()
      end
    end
    obeliskManager.lazyCheckCounter = obeliskManager.lazyCheckCounter + 1
    xpcall(HandleObelisks2, print)
  end

  obeliskManager.periodicTrigger = triggers.CreatePeriodicTrigger(obeliskManager.UPDATE_PERIOD, HandleObelisks)

  return obeliskManager
end




function map.Obelisk_Tests(testFramework)
  testFramework.Suites.ObeliskSuite = {}
  testFramework.Suites.ObeliskSuite.Tests = {}
  local tsc = testFramework.Suites.ObeliskSuite

  local utility = map.Utility_Create()

  local realWc3Api = map.RealWc3Api_Create()
  local wc3api = {}
  wc3api.constants = realWc3Api.constants
  function wc3api.FourCC()
  end
  local unitCounter = 0
  function wc3api.CreateUnit()
    local unit = "unit" .. tostring(unitCounter)
    unitCounter = unitCounter + 1
    return unit
  end
  function wc3api.BlzSetUnitMaxHp()
  end
  function wc3api.PingMinimapEx()
  end

  local unitList = map.UnitList_Create(utility)

  local triggers = {}
  local captureAction = nil
  function triggers.CreatePeriodicTrigger(p1, action)
    captureAction = action
  end

  function tsc.Setup()
    unitCounter = 0
  end
  function tsc.Teardown() end

  local OBELISK_SPAWN_PERIOD = 5
  local TERROR_SPAWN_COUNT = 3
  local TERROR_SPAWN_PERIOD = 2

  local function NormalSetup()
    local setup = {}

    setup.x = 0
    setup.y = 0
    setup.player = {}
    setup.utility = map.Utility_Create()

    setup.gamestate =
      {
          obeliskSpawnPeriod = OBELISK_SPAWN_PERIOD,
          terrorSpawnCount = TERROR_SPAWN_COUNT,
          terrorSpawnPeriod = TERROR_SPAWN_PERIOD,
      }
    return setup
  end

  function tsc.Tests.ObeliskCreated()
    local setup = NormalSetup()

    local obelisk = map.Obelisk_Create(setup.x, setup.y, setup.player, wc3api, unitList, setup.gamestate)

    assert(unitCounter == 1)
  end

  function tsc.Tests.ObeliskUpdated()
    local setup = NormalSetup()

    local obelisk = map.Obelisk_Create(setup.x, setup.y, setup.player, wc3api, unitList, setup.gamestate)

    obelisk.Update()

    assert(unitCounter == 1)
  end

  function tsc.Tests.ObeliskSpawnsUnits()
    local setup = NormalSetup()

    local obelisk = map.Obelisk_Create(setup.x, setup.y, setup.player, wc3api, unitList, setup.gamestate)

    for i=0, TERROR_SPAWN_PERIOD do
      obelisk.Update()
    end

    assert(unitCounter == 1 + TERROR_SPAWN_COUNT)
  end

  function tsc.Tests.ObeliskCreatesUnitAndResetsCounter()
    local setup = NormalSetup()

    local obelisk = map.Obelisk_Create(setup.x, setup.y, setup.player, wc3api, unitList, setup.gamestate)

    obelisk.counter = TERROR_SPAWN_PERIOD - 1

    obelisk.Update()

    assert(obelisk.counter == 0)
  end

  function tsc.Tests.ObeliskManagerSpawnCounterInitialized()
    local setup = NormalSetup()

    local obeliskManager = map.ObeliskManager_Create(wc3api, setup.gamestate, setup.editor, triggers)

    assert(obeliskManager.counter == 0)
  end

  function tsc.Tests.ObeliskManagerSpawnObelisk()
    local setup = NormalSetup()

    local obeliskManager = map.ObeliskManager_Create(wc3api, setup.gamestate, setup.editor, triggers, unitList)

    for i=0,OBELISK_SPAWN_PERIOD do
      -- captureAction()
    end

    -- assert(#obeliskManager.list == 1)
  end
end
