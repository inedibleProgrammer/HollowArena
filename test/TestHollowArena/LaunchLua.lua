-- Hollow Arena Test
function TestInit()
  local initFinished = false
  local game = {}
  local wc3api = map.RealWc3Api_Create()
  local colors = map.Colors_Create()
  local utility = map.Utility_Create()
  local commands = map.Commands_Create(wc3api)
  local clock = map.Clock_Create()
  local authenticatedNames = {"WorldEdit", "MasterLich#11192", "MagicDoor#1685"}
  local players = map.Players_Create(wc3api, commands, colors, authenticatedNames, utility)
  local gameClock = map.GameClock_Create(wc3api, clock, commands, players)
  local logging = map.Logging_Create(wc3api, gameClock, commands, players)
  local unitManager = map.UnitManager_Create(wc3api, logging, commands)
  local editor = map.Editor_Create()
  local debugTools = map.DebugTools_Create(wc3api, logging, players, commands, utility, colors)
  initFinished = true
  assert(initFinished, "Init did not finish.")


  function TestRegions()
    local function TestRegions1()
      -- Editor prepares region to have 3 red knights and 3 blue knights
      
    end
    TestRegions1()

    local function TestRegions2()
      -- Editor prepares region to have 1 Neutral town hall
      print("Player 0: " .. tostring(wc3api.Player(0)))
      print("Player Neutral: " .. tostring(wc3api.Player(wc3api.GetPlayerNeutralPassive())))
      local dummy = unitManager.CountUnitsPerPlayerInRegion(editor.TestRegion2)
      assert(dummy[wc3api.Player(wc3api.GetPlayerNeutralPassive())] == 1, "neutral does not have one unit")
      local contestable = map.Contestable_Create(editor.TestRegion2, unitManager, wc3api)
      local function periodicContestable()
        local function periodicContestable2()
          -- debugTools.Display(tostring(contestable.consecutiveCounter))
          xpcall(contestable.Update, print)
          local playerUnits = unitManager.CountUnitsPerPlayerInRegion(editor.TestRegion2)
          local p0uc = playerUnits[wc3api.Player(0)]
          local pnuc = playerUnits[wc3api.Player(wc3api.GetPlayerNeutralPassive())]
          local msg1 = "P0 unit count: " .. tostring(p0uc)
          local msg2 = "PN unit count: " .. tostring(pnuc)
          wc3api.BJDebugMsg(msg1)
          wc3api.BJDebugMsg(msg2)
        end
        xpcall(periodicContestable2, print)
      end

      local townhall = unitManager.GetSingleUnitInRegionOrNil(editor.TestRegion2)
      assert(townhall == contestable.structure, "TestRegions2: Townhall not structure")

      local periodicTrigger = wc3api.CreateTrigger()
      wc3api.TriggerAddAction(periodicTrigger, periodicContestable)
      wc3api.TriggerRegisterTimerEvent(periodicTrigger, 1.0, wc3api.constants.IS_PERIODIC)


      
    end
    xpcall(TestRegions2, print)
    
    return true
  end
  assert(TestRegions(), "Region tests did not finish.")
end

function map.LaunchLua()
  xpcall(TestInit, print)
end


