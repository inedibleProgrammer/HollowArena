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
      local contestable = map.Contestable_Create(editor.TestRegion2, unitManager, wc3api)
      local function periodicContestable()
        local function periodicContestable2()
          debugTools.Display("h")
          xpcall(contestable.Update, print)
        end
        xpcall(periodicContestable2, print)
      end

      local periodicTrigger = wc3api.CreateTrigger()
      wc3api.TriggerAddAction(periodicTrigger, periodicContestable)
      wc3api.TriggerRegisterTimerEvent(periodicTrigger, 1.0, wc3api.constants.IS_PERIODIC)


      
    end
    TestRegions2()
    
    return true
  end
  assert(TestRegions(), "Region tests did not finish.")
end

function map.LaunchLua()
  xpcall(TestInit, print)
end


