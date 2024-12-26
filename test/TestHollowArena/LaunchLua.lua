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
  local triggers = map.Triggers_Create(wc3api)
  local debugTools = map.DebugTools_Create(wc3api, logging, players, commands, utility, colors)
  
  initFinished = true
  assert(initFinished, "Init did not finish.")

  for _,player in pairs(players.list) do
    if(player.name == "WorldEdit" or player.name == "MasterLich#11192") then
      logging.SetPlayerOptionByID(player.id, logging.types.ALL)
    end
  end

  for _,player in pairs(players.list) do
    wc3api.SetPlayerState(player.ref, wc3api.constants.PLAYER_STATE_RESOURCE_GOLD, 2000)
    wc3api.SetPlayerState(player.ref, wc3api.constants.PLAYER_STATE_RESOURCE_LUMBER, 2000)
  end


  function TestRegions()
    local function TestRegions1()
      -- Editor prepares region to have 3 red knights and 3 blue knights

    end
    TestRegions1()

    local function TestRegions2()
      -- Editor prepares region to have 1 Neutral town hall
      -- local contestable = map.Contestable_Create(editor.TestRegion2, unitManager, wc3api)
      local contestable = map.Contestable_Create(editor.TestRegion2, unitManager, wc3api, triggers, logging, wagons)
      local function periodicContestable()
        local function periodicContestable2()
          -- debugTools.Display(tostring(contestable.consecutiveCounter))
          xpcall(contestable.Update, print)
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

    function map.TestContestedShipyard1()
      local startRectInfo = {}
      startRectInfo.centerx = wc3api.GetRectCenterX(editor.startRect)
      startRectInfo.centery = wc3api.GetRectCenterY(editor.startRect)

      local shipyardrect = {}
      shipyardrect.centerx = wc3api.GetRectCenterX(editor.contestedShipyard1)
      shipyardrect.centery = wc3api.GetRectCenterY(editor.contestedShipyard1)

      local wagons = map.Wagons_Create(wc3api, players, commands, logging, editor)
      local contestableManager = map.ContestableManager_Create(editor, unitManager, wc3api, triggers, logging, wagons)
      local dummyWagon = nil
      for k,wagon in pairs(wagons.list) do
        if(wagon.playerref == wc3api.Player(1)) then
          dummyWagon = wagon
        end
      end
      wc3api.IssueBuildOrderById(dummyWagon.unit, wc3api.FourCC("unpl"), startRectInfo.centerx, startRectInfo.centery)

      for i=0, 3 do
        wc3api.CreateUnit(wc3api.Player(1), wc3api.FourCC("hkni"), shipyardrect.centerx, shipyardrect.centery, 0)
      end

    end
    xpcall(map.TestContestedShipyard1, print)

    return true
  end
  assert(TestRegions(), "Region tests did not finish.")
end

function map.LaunchLua()
  xpcall(TestInit, print)
end


