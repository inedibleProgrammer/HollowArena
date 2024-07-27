gg_rct_startRect = nil
gg_snd_Warning = nil
gg_snd_Tension = nil
gg_trg_LaunchLua = nil
gg_trg_Melee_Initialization = nil
gg_rct_wormwoodRect = nil
function InitGlobals()
end

function InitSounds()
gg_snd_Warning = CreateSound("Sound/Interface/Warning.flac", false, false, false, 0, 0, "DefaultEAXON")
SetSoundParamsFromLabel(gg_snd_Warning, "Warning")
SetSoundDuration(gg_snd_Warning, 1903)
SetSoundVolume(gg_snd_Warning, 80)
gg_snd_Tension = CreateSound("Sound/Music/mp3Music/Tension.flac", false, true, true, 0, 0, "SpellsEAX")
SetSoundParamsFromLabel(gg_snd_Tension, "Tension")
SetSoundDuration(gg_snd_Tension, 19527)
SetSoundChannel(gg_snd_Tension, 11)
SetSoundVolume(gg_snd_Tension, 127)
SetSoundDistances(gg_snd_Tension, 600.0, 3500.0)
SetSoundDistanceCutoff(gg_snd_Tension, 3000.0)
end

function CreateAllItems()
local itemID

BlzCreateItemWithSkin(FourCC("gold"), 8008.3, 8227.2, FourCC("gold"))
BlzCreateItemWithSkin(FourCC("gold"), 7854.8, 8193.7, FourCC("gold"))
BlzCreateItemWithSkin(FourCC("gold"), 7842.3, 8330.0, FourCC("gold"))
BlzCreateItemWithSkin(FourCC("tpow"), 6875.6, 5718.4, FourCC("tpow"))
end

function CreateNeutralPassiveBuildings()
local p = Player(PLAYER_NEUTRAL_PASSIVE)
local u
local unitID
local t
local life

u = BlzCreateUnitWithSkin(p, FourCC("ngol"), -6080.0, 5120.0, 270.000, FourCC("ngol"))
SetResourceAmount(u, 12500)
u = BlzCreateUnitWithSkin(p, FourCC("ngol"), -6080.0, -5696.0, 270.000, FourCC("ngol"))
SetResourceAmount(u, 12500)
u = BlzCreateUnitWithSkin(p, FourCC("ngol"), -11648.0, -12608.0, 270.000, FourCC("ngol"))
SetResourceAmount(u, 12500)
u = BlzCreateUnitWithSkin(p, FourCC("ngol"), -6848.0, -14976.0, 270.000, FourCC("ngol"))
SetResourceAmount(u, 12500)
u = BlzCreateUnitWithSkin(p, FourCC("ngol"), -3584.0, -10752.0, 270.000, FourCC("ngol"))
SetResourceAmount(u, 12500)
u = BlzCreateUnitWithSkin(p, FourCC("ngol"), -128.0, -11392.0, 270.000, FourCC("ngol"))
SetResourceAmount(u, 12500)
u = BlzCreateUnitWithSkin(p, FourCC("ngol"), 6848.0, -10048.0, 270.000, FourCC("ngol"))
SetResourceAmount(u, 12500)
u = BlzCreateUnitWithSkin(p, FourCC("ngol"), 9152.0, -12416.0, 270.000, FourCC("ngol"))
SetResourceAmount(u, 12500)
u = BlzCreateUnitWithSkin(p, FourCC("ngol"), 12416.0, -7104.0, 270.000, FourCC("ngol"))
SetResourceAmount(u, 12500)
u = BlzCreateUnitWithSkin(p, FourCC("ngol"), 8384.0, -6592.0, 270.000, FourCC("ngol"))
SetResourceAmount(u, 12500)
u = BlzCreateUnitWithSkin(p, FourCC("ngol"), -896.0, -5632.0, 270.000, FourCC("ngol"))
SetResourceAmount(u, 12500)
u = BlzCreateUnitWithSkin(p, FourCC("ngol"), -3520.0, -1024.0, 270.000, FourCC("ngol"))
SetResourceAmount(u, 12500)
u = BlzCreateUnitWithSkin(p, FourCC("hshy"), -5792.0, 2720.0, 270.000, FourCC("hshy"))
u = BlzCreateUnitWithSkin(p, FourCC("hshy"), -8800.0, -5344.0, 270.000, FourCC("hshy"))
u = BlzCreateUnitWithSkin(p, FourCC("hshy"), -9824.0, -13088.0, 270.000, FourCC("hshy"))
u = BlzCreateUnitWithSkin(p, FourCC("hshy"), -5024.0, -12960.0, 270.000, FourCC("hshy"))
u = BlzCreateUnitWithSkin(p, FourCC("hshy"), -1504.0, -9760.0, 270.000, FourCC("hshy"))
u = BlzCreateUnitWithSkin(p, FourCC("hshy"), 7648.0, -12768.0, 270.000, FourCC("hshy"))
u = BlzCreateUnitWithSkin(p, FourCC("hshy"), 10208.0, -12064.0, 270.000, FourCC("hshy"))
u = BlzCreateUnitWithSkin(p, FourCC("hshy"), 12576.0, -7776.0, 270.000, FourCC("hshy"))
u = BlzCreateUnitWithSkin(p, FourCC("nshp"), 1600.0, 9216.0, 270.000, FourCC("nshp"))
u = BlzCreateUnitWithSkin(p, FourCC("nmrk"), -2304.0, -7424.0, 270.000, FourCC("nmrk"))
SetUnitColor(u, ConvertPlayerColor(0))
u = BlzCreateUnitWithSkin(p, FourCC("ngme"), -1856.0, -6976.0, 270.000, FourCC("ngme"))
u = BlzCreateUnitWithSkin(p, FourCC("ngad"), -2752.0, -6976.0, 270.000, FourCC("ngad"))
u = BlzCreateUnitWithSkin(p, FourCC("nmr8"), -1856.0, -7936.0, 270.000, FourCC("nmr8"))
SetUnitColor(u, ConvertPlayerColor(9))
u = BlzCreateUnitWithSkin(p, FourCC("ntav"), -2752.0, -7808.0, 270.000, FourCC("ntav"))
SetUnitColor(u, ConvertPlayerColor(0))
u = BlzCreateUnitWithSkin(p, FourCC("ngol"), 3520.0, 8128.0, 270.000, FourCC("ngol"))
SetResourceAmount(u, 12500)
u = BlzCreateUnitWithSkin(p, FourCC("ovln"), 12096.0, -2560.0, 270.000, FourCC("ovln"))
u = BlzCreateUnitWithSkin(p, FourCC("nfoh"), 1664.0, -1792.0, 270.000, FourCC("nfoh"))
u = BlzCreateUnitWithSkin(p, FourCC("nmoo"), -4864.0, 6720.0, 270.000, FourCC("nmoo"))
u = BlzCreateUnitWithSkin(p, FourCC("hshy"), -288.0, -6496.0, 270.000, FourCC("hshy"))
u = BlzCreateUnitWithSkin(p, FourCC("hshy"), 8160.0, -8096.0, 270.000, FourCC("hshy"))
u = BlzCreateUnitWithSkin(p, FourCC("ngol"), 5824.0, 7232.0, 270.000, FourCC("ngol"))
SetResourceAmount(u, 12500)
u = BlzCreateUnitWithSkin(p, FourCC("hvlt"), -6720.0, 7872.0, 270.000, FourCC("hvlt"))
u = BlzCreateUnitWithSkin(p, FourCC("ncop"), -5824.0, 2432.0, 270.000, FourCC("ncop"))
end

function CreatePlayerBuildings()
end

function CreatePlayerUnits()
end

function CreateAllUnits()
CreateNeutralPassiveBuildings()
CreatePlayerBuildings()
CreatePlayerUnits()
end

function CreateRegions()
local we

gg_rct_startRect = Rect(-2816.0, 5472.0, -1408.0, 6880.0)
gg_rct_wormwoodRect = Rect(4832.0, 8832.0, 6400.0, 9504.0)
end

map = {}
map.version = "0.0.0"
map.commit = "234cb440898c387d58c8adaaa1ef5b1d9f994ba0"
function map.Editor_Create()
  local editor = {}

  editor.startRect = gg_rct_startRect
  editor.wormwoodRect = gg_rct_wormwoodRect
  editor.wormwoodPlayerID = 20



  return editor
end

function map.HollowArena_Initialize()
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

  -- game.worldEdit = players.GetPlayerByName("WorldEdit")
  -- logging.SetPlayerOptionByID(game.worldEdit.id, logging.types.ALL)

  for _,player in pairs(players.list) do
    if(player.name == "WorldEdit" or player.name == "MasterLich#11192") then
      logging.SetPlayerOptionByID(player.id, logging.types.ALL)
    end
  end

  local gameStatusLog = {}
  gameStatusLog.type = logging.types.INFO
  gameStatusLog.message = "Game Start"
  logging.Write(gameStatusLog)

  wc3api.MeleeStartingVisibility()
  wc3api.MeleeStartingHeroLimit()
  wc3api.MeleeGrantHeroItems()

  local startingResources = map.StartingResources_Create(wc3api, players)
  local wagons = map.Wagons_Create(wc3api, players, commands, logging, editor)
  local wormwood = map.Wormwood_Create(wc3api, editor, players)
end

function map.Wagons_Create(wc3api, players, commands, logging, editor)
  local wagons = {}
  wagons.list = {}

  local startRectInfo = {}
  startRectInfo.centerx = wc3api.GetRectCenterX(editor.startRect)
  startRectInfo.centery = wc3api.GetRectCenterY(editor.startRect)

  function wagons.WagonBuildingAction()
    local function WagonBuildingAction2()
      -- GetTriggerUnit() returns the building instead of the builder BUG
      -- https://www.hiveworkshop.com/threads/how-to-get-building-unit.274883/
      local theBuilding = wc3api.GetConstructingStructure()
      local thePlayer = wc3api.GetTriggerPlayer()
      local playerName = wc3api.GetPlayerName(thePlayer)

      for _,wagonData in pairs(wagons.list) do
        if(wagonData.built == true) then return end
        if(thePlayer == wagonData.playerref) then
          if(wc3api.IsUnitInRange(wagonData.unit, theBuilding, 120)) then
            local baseID = wc3api.GetUnitTypeId(theBuilding)
            local basex = wc3api.GetUnitX(theBuilding)
            local basey = wc3api.GetUnitY(theBuilding)
            local baseface = wc3api.GetUnitFacing(theBuilding)
            wc3api.RemoveUnit(theBuilding)
            wc3api.RemoveUnit(wagonData.unit)
            wagonData.unit = nil
            wc3api.CreateUnit(wagonData.playerref, baseID, basex, basey, baseface)
            wagonData.built = true

            local wagonLog = {}
            wagonLog.type = logging.types.INFO
            wagonLog.message = playerName .. " builds town hall"
            logging.Write(wagonLog)
          end
        end
      end
    end
    xpcall(WagonBuildingAction2, print)
  end

  local finishBuildingTrigger = wc3api.CreateTrigger()
  wc3api.TriggerAddAction(finishBuildingTrigger, wagons.WagonBuildingAction)

  local function MakeWagon(player)
    local wagonData = {}
    wagonData.built = false
    wagonData.playerref = player.ref

    wc3api.TriggerRegisterPlayerUnitEvent(finishBuildingTrigger,
                                          player.ref,
                                          wc3api.constants.EVENT_PLAYER_UNIT_CONSTRUCT_START,
                                          wc3api.constants.NO_FILTER)

    wagonData.unit = wc3api.CreateUnit(player.ref,
                                       wc3api.FourCC("h000"),
                                       startRectInfo.centerx,
                                       startRectInfo.centery,
                                       0.00)

    wc3api.SetUnitMoveSpeed(wagonData.unit, 3000)
    wc3api.UnitAddAbility(wagonData.unit, wc3api.FourCC("AEbl")) -- blink
    wc3api.SetUnitAbilityLevel(wagonData.unit, wc3api.FourCC("AEbl"), 3)
    wc3api.BlzSetUnitMaxMana(wagonData.unit, 500)
    wc3api.BlzSetUnitRealField(wagonData.unit, wc3api.constants.UNIT_RF_MANA, 300)
    wc3api.BlzSetUnitRealField(wagonData.unit, wc3api.constants.UNIT_RF_MANA_REGENERATION, 5)
    wc3api.BlzSetUnitName(wagonData.unit, player.name)
    table.insert(wagons.list, wagonData)
  end

  for _, player in pairs(players.list) do
    if(player.mapcontrol == wc3api.constants.MAP_CONTROL_USER and
       player.playerslotstate == wc3api.constants.PLAYER_SLOT_STATE_PLAYING) then

      MakeWagon(player)
    end
  end




  return wagons
end



function map.Wagons_Tests(testFramework)
  testFramework.Suites.WagonsSuite = {}
  testFramework.Suites.WagonsSuite.Tests = {}
  local tsc = testFramework.Suites.WagonsSuite

  local wc3api = {}
  wc3api.constants = {}
  -- wc3api.constants = map.RealWc3Api_Create().constants
  function wc3api.GetRectCenterX() end
  function wc3api.GetRectCenterY() end
  function wc3api.CreateTrigger() end
  function wc3api.TriggerAddAction() end
  function wc3api.TriggerRegisterPlayerUnitEvent() end
  function wc3api.FourCC() end
  function wc3api.CreateUnit() end
  function wc3api.UnitAddAbility() end
  function wc3api.SetUnitAbilityLevel() end
  function wc3api.BlzSetUnitMaxMana() end
  function wc3api.BlzSetUnitRealField() end
  function wc3api.BlzSetUnitName() end
  function wc3api.GetConstructingStructure() end
  function wc3api.GetTriggerPlayer() return "p1ref" end
  function wc3api.IsUnitInRange() return true end
  function wc3api.GetUnitTypeId() end
  function wc3api.GetUnitX() end
  function wc3api.GetUnitY() end
  function wc3api.GetUnitFacing() end
  function wc3api.RemoveUnit() end
  function wc3api.SetUnitMoveSpeed() end
  function wc3api.SetPlayerState() end
  function wc3api.GetPlayerName() return "name" end

  local players = {}
  players.list = {}
  local p1 = {}
  p1.ref = "p1ref"
  local p2 = {}
  p2.ref = "p2ref"
  table.insert(players.list, p1)
  table.insert(players.list, p2)

  local commands = {}

  local logging = {}
  logging.types = {}
  function logging.Write() end

  local editor = {}


  function tsc.Setup() end
  function tsc.Teardown() end

  function tsc.Tests.WagonsCreated()
    -- p1.playerslotstate = wc3api.constants.PLAYER_SLOT_STATE_PLAYING
    -- p2.playerslotstate = wc3api.constants.PLAYER_SLOT_STATE_PLAYING
    assert(p1.ref == "p1ref")
    wc3api.constants.MAP_CONTROL_USER = "user"
    wc3api.constants.PLAYER_SLOT_STATE_PLAYING = "playing"

    p1.playerslotstate = "playing"
    p2.playerslotstate = "playing"
    p1.mapcontrol = "user"
    p2.mapcontrol = "user"
    local wagons = map.Wagons_Create(wc3api, players, commands, logging, editor)

    local testWagon
    local otherWagon
    for _,wagonData in pairs(wagons.list) do
      if(wagonData.playerref == "p1ref") then
        testWagon = wagonData
      end
      if(wagonData.playerref == "p2ref") then
        otherWagon = wagonData
      end
    end

    wagons.WagonBuildingAction()

    assert(testWagon.built == true)
    assert(otherWagon.built == false)
  end
end
function map.StartingResources_Create(wc3api, players)
  local startingResources = {}

  local function GiveResourcesToAllPlayers()
    local function GiveResourcesToAllPlayers2()
      for _,player in pairs(players.list) do
        wc3api.SetPlayerState(player.ref, wc3api.constants.PLAYER_STATE_RESOURCE_GOLD, 2000)
        wc3api.SetPlayerState(player.ref, wc3api.constants.PLAYER_STATE_RESOURCE_LUMBER, 2000)
      end
    end
    xpcall(GiveResourcesToAllPlayers2, print)
  end

  local startingResourcesTrigger = wc3api.CreateTrigger()
  wc3api.TriggerAddAction(startingResourcesTrigger, GiveResourcesToAllPlayers)

  wc3api.TriggerExecute(startingResourcesTrigger)

  wc3api.DestroyTrigger(startingResourcesTrigger)

  return startingResources
end
--[[
  The third angel blew his trumpet, and a great star fell from heaven,
  blazing like a torch, and it fell on a third of the rivers and on
  the springs of water.  The name of the star is Wormwood.  A third of
  the waters became wormwood, and many died from the water, because it
  was made bitter.  (Rev 8:10-11)
-- ]]

function map.Wormwood_Create(wc3api, editor, players)
  local wormwood = {}

  local wormwoodRectInfo = {}
  wormwoodRectInfo.centerx = wc3api.GetRectCenterX(editor.wormwoodRect)
  wormwoodRectInfo.centery = wc3api.GetRectCenterY(editor.wormwoodRect)

  wormwood.player = players.GetPlayerByID(editor.wormwoodPlayerID)

  wormwood.unit = wc3api.CreateUnit(wormwood.player.ref,
                                    wc3api.FourCC("nbal"),
                                    wormwoodRectInfo.centerx,
                                    wormwoodRectInfo.centery,
                                    270.0)


  wc3api.BlzSetUnitName(wormwood.unit, "Wormwood")
  wc3api.BlzSetUnitMaxHP(wormwood.unit, 100000)
  wc3api.SetUnitState(wormwood.unit, UNIT_STATE_LIFE, 100000.0)
  wc3api.BlzSetUnitRealField(wormwood.unit, wc3api.constants.UNIT_RF_HIT_POINTS_REGENERATION_RATE, 10)
  wc3api.BlzSetUnitBaseDamage(wormwood.unit, 500, wc3api.constants.WEAPON_INDEX_GROUND)
  wc3api.BlzSetUnitBaseDamage(wormwood.unit, 500, wc3api.constants.WEAPON_INDEX_AIR)
  wc3api.BlzSetUnitArmor(wormwood.unit, 150)
  wc3api.SetUnitScale(wormwood.unit, 2.0, 0.0, 0.0)
  wc3api.SetUnitVertexColor(wormwood.unit, 100, 100, 100, 255)

  local function WormwoodDiesAction()
    -- https://www.hiveworkshop.com/threads/best-way-to-detect-if-a-unit-is-dead-or-not.269052/
    local function WormwoodDiesAction2()
      local deadUnit = wc3api.GetDyingUnit()
      -- if(wc3api.IsUnitType(wormwood.unit, wc3api.constants.UNIT_TYPE_DEAD)) then
      if(deadUnit == wormwood.unit) then
        for _,player in pairs(players.list) do
          wc3api.CustomVictoryDialogBJ(player.ref)
        end
      else
        print("nothing")
      end
    end
    xpcall(WormwoodDiesAction2, print)
  end

  local wormwoodDeadTrigger = wc3api.CreateTrigger()
  wc3api.TriggerRegisterPlayerUnitEvent(wormwoodDeadTrigger,
                                        wormwood.player.ref,
                                        wc3api.constants.EVENT_PLAYER_UNIT_DEATH,
                                        wc3api.constants.NO_FILTER)
  wc3api.TriggerAddAction(wormwoodDeadTrigger, WormwoodDiesAction)

  return wormwood
end
function map.Commands_Create(wc3api)
  local commands = {}
  commands.list = {}
  commands.count = 0

  function commands.Add(command)
    if (#command.users <= 0) then
      return
    end

    command.trigger = wc3api.CreateTrigger()
    wc3api.TriggerAddAction(command.trigger, command.Handler)

    for _,user in pairs(command.users) do
      wc3api.TriggerRegisterPlayerChatEvent(command.trigger, user, command.activator, wc3api.constants.NO_EXACT_MATCH)
    end

    table.insert(commands.list, command)
    commands.count = commands.count + 1
  end

  return commands
end



function map.Commands_Tests(testFramework)
  testFramework.Suites.CommandsSuite = {}
  testFramework.Suites.CommandsSuite.Tests = {}
  local tsc = testFramework.Suites.CommandsSuite
  local wc3api = {}
  wc3api.constants = map.RealWc3Api_Create().constants

  function wc3api.CreateTrigger()
    return {}
  end

  function wc3api.TriggerAddAction(trigger, handler)
    assert(type(trigger) ~= "nil")
    assert(type(handler) == "function")
  end

  function wc3api.GetEventPlayerChatString()
    return ""
  end

  function wc3api.Player()
  end

  function wc3api.TriggerRegisterPlayerChatEvent() end

  function tsc.Setup() end
  function tsc.Teardown() end

  function tsc.Tests.DummyTest()
    assert(true)
  end

  function tsc.Tests.AddNewCommand()
    local commands = map.Commands_Create(wc3api)

    local dummyCmd = {}
    dummyCmd.activator = "-dummy"
    dummyCmd.users = {wc3api.Player(0)}
    dummyCmd.dummyVar = 0
    function dummyCmd:Handler()
      cmdString = wc3api.GetPlayerChatString()
      self.dummyVar = 1
    end

    -- commands.Add(dummyCmd)
    -- assert(commands.length == 1)

    -- dummyCmd:Handler("-dummy param1 param2")
    -- assert(dummyCmd.dummyVar == 1)
  end
end


function map.TestFramework_Create()
  local testFramework = {}
  testFramework.Suites = {}

  function testFramework.TestRunner()
    for _, suite in pairs(testFramework.Suites) do
      for _, test in pairs(suite.Tests) do
        suite.Setup()
        test()
        suite.Teardown()
      end
    end
  end

  return testFramework
end

function map.Utility_Create()
  local utility = {}

  function utility.Split(inputStr, sep)
    if sep == nil then
      sep = " "
    end
    local t = {}
    for str in string.gmatch(inputStr, "([^"..sep.."]+)") do
      table.insert(t, str)
    end
    return t
  end

  return utility
end




function map.Utility_Tests(testFramework)
  testFramework.Suites.UtilitySuite = {}
  testFramework.Suites.UtilitySuite.Tests = {}
  local tsu = testFramework.Suites.UtilitySuite

  function tsu.Setup() end
  function tsu.Teardown() end

  function tsu.Tests.SplitTest()
    local utility = map.Utility_Create()
    local dummyString = "This is a test 113."
    local splitString = utility.Split(dummyString)

    assert(#splitString == 5)
    assert(table.remove(splitString) == "113.")
    assert(table.remove(splitString) == "test")
    assert(table.remove(splitString) == "a")
    assert(table.remove(splitString) == "is")
    assert(table.remove(splitString) == "This")
  end
end

function map.GameClock_Create(wc3api, clock, commands, players)
  local gameClock = {}
  gameClock.wc3api = wc3api
  gameClock.clock = clock
  gameClock.commands = commands
  gameClock.players = players
  -- print("GameClock_Create")

  function gameClock.ClockTick()
    -- print("ClockTick start")
    -- DisplayTextToForce(GetPlayersAll(), "ClockTick start")
    -- DisplayTextToForce(GetPlayersAll(), gameClock.clock.seconds)
    gameClock.clock.Tick()
    -- collectgarbage("collect")
    -- print("ClockTick end")
  end

  -- print("gameclock setup")
  gameClock.trigger = wc3api.CreateTrigger()
  wc3api.TriggerRegisterTimerEvent(gameClock.trigger, 1.00, true)
  wc3api.TriggerAddAction(gameClock.trigger, gameClock.ClockTick)
  -- print("gameclock finish")

  local displayTimeCommand = {}
  displayTimeCommand.activator = "-time"
  displayTimeCommand.users = players.ALL_PLAYERS
  function displayTimeCommand.Handler()
    wc3api.DisplayTextToPlayer(wc3api.GetTriggerPlayer(), 0, 0, gameClock.clock.GetTimeString())
  end
  commands.Add(displayTimeCommand)

  return gameClock
end


function map.GameClock_Tests(testFramework)
  testFramework.Suites.GameClockSuite = {}
  testFramework.Suites.GameClockSuite.Tests = {}
  local tsc = testFramework.Suites.GameClockSuite
  local wc3api = {}
  wc3api.constants = map.RealWc3Api_Create().constants

  function wc3api.CreateTrigger()
    return {}
  end

  function wc3api.TriggerAddAction(trigger, handler)
    assert(type(trigger) ~= "nil")
    assert(type(handler) == "function")
  end

  function wc3api.GetEventPlayerChatString()
    return ""
  end

  function wc3api.Player() return "dummy player ref" end
  function wc3api.GetPlayerId() return 0 end
  function wc3api.TriggerRegisterTimerEvent() end
  function wc3api.TriggerAddAction() end
  function wc3api.GetBJMaxPlayers() return 1 end
  function wc3api.GetPlayerName() end
  function wc3api.GetPlayerRace() end
  function wc3api.GetPlayerTeam() end
  function wc3api.GetPlayerColor() end
  function wc3api.GetPlayerController() end
  function wc3api.GetPlayerSlotState() end
  function wc3api.TriggerRegisterPlayerChatEvent() end
  function wc3api.TriggerRegisterPlayerEvent() end

  function tsc.Setup() end
  function tsc.Teardown() end

  function tsc.Tests.DummyTest()
    assert(true)
  end

  function tsc.Tests.CreateClock()
    --[[
      local clock = map.Clock_Create()
      local commands = map.Commands_Create(wc3api)
      local colors = map.Colors_Create()
      local players = map.Players_Create(wc3api, commands, colors)
      local gameClock = map.GameClock_Create(wc3api, clock, commands, players)
    --]]

    assert(true)
  end

end
function map.Clock_Create()
  local clock = {}
  clock.seconds = 0

  function clock.Tick()
    clock.seconds = clock.seconds + 1
  end

  function clock.TimeElapsed()
    local timeElapsed = {}
    timeElapsed.hours = 0
    timeElapsed.minutes = 0
    timeElapsed.seconds = 0
    local tempSeconds = clock.seconds

    while tempSeconds >= 3600 do
      tempSeconds = tempSeconds - 3600
      timeElapsed.hours = timeElapsed.hours + 1
    end

    while tempSeconds >= 60 do
      tempSeconds = tempSeconds - 60
      timeElapsed.minutes = timeElapsed.minutes + 1
    end

    timeElapsed.seconds = tempSeconds

    return timeElapsed
  end

  function clock.GetTimeString()
    local timeString = ""
    local timeElapsed = clock.TimeElapsed()

    timeString = tostring(timeElapsed.hours) .. ":" .. tostring(timeElapsed.minutes) .. ":" .. tostring(timeElapsed.seconds)
    -- timeString = string.format("10:07:00", timeElapsed.hours, timeElapsed.minutes, timeElapsed.seconds) -- This doesn't work in wc3 for some reason

    return timeString
  end

  return clock
end

function map.Clock_Tests(testFramework)
  testFramework.Suites.ClockSuite = {}
  testFramework.Suites.ClockSuite.Tests = {}
  local tsc = testFramework.Suites.ClockSuite
  local wc3api = {}
  wc3api.constants = map.RealWc3Api_Create().constants

  function tsc.Setup() end
  function tsc.Teardown() end

  function tsc.Tests.DummyTest()
    assert(true)
  end

  function tsc.Tests.HoursMinutesSeconds()
    local clock = map.Clock_Create()
    clock.seconds = 8192
    assert(clock.TimeElapsed().hours == 2, "hours wrong")
    assert(clock.TimeElapsed().minutes == 16, "minutes wrong")
    assert(clock.TimeElapsed().seconds == 32, "seconds wrong")
  end

  function tsc.Tests.HoursMinutesSeconds2()
    local clock = map.Clock_Create()
    clock.seconds = 3600
    assert(clock.TimeElapsed().hours == 1, "hours wrong")
    assert(clock.TimeElapsed().minutes == 0, "minutes wrong")
    assert(clock.TimeElapsed().seconds == 0, "seconds wrong")
  end

  function tsc.Tests.GetTimeAsString()
    local clock = map.Clock_Create()
    clock.seconds = 8192
    assert(clock.GetTimeString() == "2:16:32")
    clock.seconds = 3600
    assert(clock.GetTimeString() == "1:0:0")
  end
end


function map.Players_Create(wc3api, commands, colors, authenticatedNames, utility)
  local players = {}

  players.list = {}
  players.ALL_PLAYERS = {}
  players.AUTHENTICATED_PLAYERS = {}

  function players.GetPlayerByName(name)
    for _,player in pairs(players.list) do
      if player.name == name then
        return player
      end
    end
    return nil
  end

  function players.GetPlayerByID(id)
    for _,player in pairs(players.list) do
      if player.id == id then
        return player
      end
    end
    return nil
  end

  local function PlayerLeavingAction()
    local p = wc3api.GetTriggerPlayer()
    local pname = wc3api.GetPlayerName(p)
    local player = players.GetPlayerByName(pname)

    -- print(gp.coloredName .. " has left the game")
    -- local coloredPName = colors.GetColoredString(pname, colors.GetColor_N(player.id + 1).text)
    wc3api.BJDebugMsg(player.coloredname .. " has left the game.")
  end

  players.playerLeavingTrigger = wc3api.CreateTrigger()
  wc3api.TriggerAddAction(players.playerLeavingTrigger, PlayerLeavingAction)
  for i=0, wc3api.GetBJMaxPlayers() do
    local player = {}
    player.ref = wc3api.Player(i)
    player.id = wc3api.GetPlayerId(player.ref)
    player.name = wc3api.GetPlayerName(player.ref)
    player.coloredname = colors.GetColoredString(player.name, colors.GetColor_N(player.id + 1).text)
    player.race = wc3api.GetPlayerRace(player.ref)
    player.team = wc3api.GetPlayerTeam(player.ref)
    player.playercolor = wc3api.GetPlayerColor(player.ref)
    player.mapcontrol = wc3api.GetPlayerController(player.ref)
    player.playerslotstate = wc3api.GetPlayerSlotState(player.ref)

    table.insert(players.ALL_PLAYERS, player.ref)

    wc3api.TriggerRegisterPlayerEvent(players.playerLeavingTrigger, player.ref, wc3api.constants.EVENT_PLAYER_LEAVE)

    table.insert(players.list, player)
  end

  local function TryAddPlayerName(playerName, toList)
    local player = players.GetPlayerByName(playerName)
    if(player ~= nil) then
      table.insert(toList, player.ref)
    end
  end

  for _,name in pairs(authenticatedNames) do
    TryAddPlayerName(name, players.AUTHENTICATED_PLAYERS)
  end

  local showPlayersCommand = {}
  showPlayersCommand.activator = "-players"
  showPlayersCommand.users = players.ALL_PLAYERS
  function showPlayersCommand.Handler()
    local commandingPlayer = wc3api.GetTriggerPlayer()
    local cmdString = wc3api.GetEventPlayerChatString()
    local splitString = utility.Split(cmdString)

    local pageParam = table.remove(splitString)
    if(pageParam == "1") then
      for i=0, 13 do
        local player = players.GetPlayerByID(i)
        if(player ~= nil) then
          local playerInfo = "(" .. player.id + 1 .. ")" .. " " .. player.coloredname ..  " " .. colors.GetColor_N(player.id + 1).text
          wc3api.DisplayTextToPlayer(commandingPlayer, 0, 0, playerInfo)
        end
      end
    elseif(pageParam == "2") then
      for i=14, 23 do
        local player = players.GetPlayerByID(i)
        if(player ~= nil) then
          local playerInfo = "(" .. player.id + 1 .. ")" .. " " .. player.coloredname ..  " " .. colors.GetColor_N(player.id + 1).text
          wc3api.DisplayTextToPlayer(commandingPlayer, 0, 0, playerInfo)
        end
      end
    end
  end
  commands.Add(showPlayersCommand)


  local allyPlayerCommand = {}
  allyPlayerCommand.activator = "-ally"
  allyPlayerCommand.users = players.ALL_PLAYERS
  function allyPlayerCommand.Handler()
    local cmdString = wc3api.GetEventPlayerChatString()
    local commandingPlayer = wc3api.GetTriggerPlayer()

    local splitString = utility.Split(cmdString)
    local playerColorNumber = table.remove(splitString)
    local otherPlayer = players.GetPlayerByID(tonumber(playerColorNumber) - 1)

    if(otherPlayer ~= nil) then
      wc3api.SetPlayerAlliance(commandingPlayer, otherPlayer.ref,
                               wc3api.constants.ALLIANCE_PASSIVE, true)
      wc3api.SetPlayerAlliance(commandingPlayer, otherPlayer.ref,
                               wc3api.constants.ALLIANCE_SHARED_SPELLS, true)
    end
  end
  commands.Add(allyPlayerCommand)

  local unallyPlayerCommand = {}
  unallyPlayerCommand.activator = "-unally"
  unallyPlayerCommand.users = players.ALL_PLAYERS
  function unallyPlayerCommand.Handler()
    local cmdString = wc3api.GetEventPlayerChatString()
    local commandingPlayer = wc3api.GetTriggerPlayer()

    local splitString = utility.Split(cmdString)
    local playerColorNumber = table.remove(splitString)
    local otherPlayer = players.GetPlayerByID(tonumber(playerColorNumber) - 1)

    if(otherPlayer ~= nil) then
      wc3api.SetPlayerAlliance(commandingPlayer, otherPlayer.ref,
                               wc3api.constants.ALLIANCE_PASSIVE, false)
      wc3api.SetPlayerAlliance(commandingPlayer, otherPlayer.ref,
                               wc3api.constants.ALLIANCE_SHARED_SPELLS, false)
    end
  end
  commands.Add(unallyPlayerCommand)

  local visionPlayerCommand = {}
  visionPlayerCommand.activator = "-vision"
  visionPlayerCommand.users = players.ALL_PLAYERS
  function visionPlayerCommand.Handler()
    local cmdString = wc3api.GetEventPlayerChatString()
    local commandingPlayer = wc3api.GetTriggerPlayer()

    local splitString = utility.Split(cmdString)
    local playerColorNumber = table.remove(splitString)
    local otherPlayer = players.GetPlayerByID(tonumber(playerColorNumber) - 1)

    if(otherPlayer ~= nil) then
      wc3api.SetPlayerAlliance(commandingPlayer, otherPlayer.ref,
                               wc3api.constants.ALLIANCE_SHARED_VISION, true)
    end
  end
  commands.Add(visionPlayerCommand)

  local unvisionPlayerCommand = {}
  unvisionPlayerCommand.activator = "-unvision"
  unvisionPlayerCommand.users = players.ALL_PLAYERS
  function unvisionPlayerCommand.Handler()
    local cmdString = wc3api.GetEventPlayerChatString()
    local commandingPlayer = wc3api.GetTriggerPlayer()

    local splitString = utility.Split(cmdString)
    local playerColorNumber = table.remove(splitString)
    local otherPlayer = players.GetPlayerByID(tonumber(playerColorNumber) - 1)

    if(otherPlayer ~= nil) then
      wc3api.SetPlayerAlliance(commandingPlayer, otherPlayer.ref,
                               wc3api.constants.ALLIANCE_SHARED_VISION, false)
    end
  end
  commands.Add(unvisionPlayerCommand)

  local cameraCommand = {}
  cameraCommand.activator = "-camera"
  cameraCommand.users = players.ALL_PLAYERS
  function cameraCommand.Handler()
    local cmdString = wc3api.GetEventPlayerChatString()
    local commandingPlayer = wc3api.GetTriggerPlayer()

    local splitString = utility.Split(cmdString)
    local distance = tonumber(table.remove(splitString))
    wc3api.SetCameraFieldForPlayer(commandingPlayer,
                                   wc3api.constants.CAMERA_FIELD_TARGET_DISTANCE,
                                   distance, 1.00)
  end
  commands.Add(cameraCommand)



  return players
end



function map.Players_Tests(testFramework)
  testFramework.Suites.PlayersSuite = {}
  testFramework.Suites.PlayersSuite.Tests = {}
  local tsc = testFramework.Suites.PlayersSuite
  local wc3api = {}
  local commands = {}
  local colors = {}
  local utility = {}
  local authenticatedNames = { "authenticatedName1", "authenticatedName2" }
  wc3api.constants = map.RealWc3Api_Create().constants

  --luacheck: push ignore
  function wc3api.CreateTrigger() return {} end
  function wc3api.TriggerAddAction(trigger, handler)
    assert(type(trigger) ~= "nil")
    assert(type(handler) == "function")
  end
  function wc3api.GetTriggerPlayer() return "GetTriggerPlayer" end
  function wc3api.GetEventPlayerChatString() return "" end
  function wc3api.TriggerRegisterPlayerEvent() return "" end
  function wc3api.Player() return {dummy = "dummy"} end
  function wc3api.GetBJMaxPlayers() return 26 end
  function wc3api.GetPlayerId(player) return 0 end
  function wc3api.GetPlayerName(player) return "name" end
  function colors.GetColor_N(p1) return {text = "text"} end
  function colors.GetColoredString(p1, p2) return "coloredstring" end
  function wc3api.GetPlayerRace(player) return "race" end
  function wc3api.GetPlayerTeam(player) return "team" end
  function wc3api.GetPlayerColor(player) return "color" end
  function wc3api.GetPlayerController(player) return "controller" end
  function wc3api.GetPlayerSlotState(player) return "slotstate" end
  function wc3api.SetPlayerAlliance() end
  function utility.Split() return {"1"} end

  local storedCommands = {}
  function commands.Add(command)
    table.insert(storedCommands, command)
  end
  --luacheck: pop

  function tsc.Setup() end
  function tsc.Teardown() end

  function tsc.Tests.DummyTest()
    assert(true)
  end

  function tsc.Tests.AddAuthenticatedPlayers()
    local firstTime = true
    function wc3api.GetPlayerName(player)
      if firstTime then
        firstTime = false
        return "authenticatedName1"
      end
      return "noname"
    end
    local players = map.Players_Create(wc3api, commands, colors, authenticatedNames, utility)

    assert(#players.AUTHENTICATED_PLAYERS > 0, "AUTHENTICATED_PLAYERS EMPTY")
    assert(#players.AUTHENTICATED_PLAYERS == 1)
  end

  function tsc.Tests.ShowPlayers()
    local players = map.Players_Create(wc3api, commands, colors, authenticatedNames, utility)
    local fnCalled = false

    function wc3api.DisplayTextToPlayer(p1, p2, p3, p4)
      fnCalled = true
    end

    for _,command in pairs(storedCommands) do
      if(command.activator == "-players") then
        command.Handler()
        assert(fnCalled == true)
      end
    end
  end

  function tsc.Tests.AllyPlayer()
    local players = map.Players_Create(wc3api, commands, colors, authenticatedNames, utility)

    for _,command in pairs(storedCommands) do
      if(command.activator == "-ally") then
        command.Handler()
      end
    end

  end

end



function map.Logging_Create(wc3api, gameClock, commands, players)
  local logging = {}
  logging.wc3api = wc3api
  logging.gameClock = gameClock
  logging.commands = commands
  logging.players = players

  logging.messages = {}
  logging.count = 0
  logging.types = {
    TRACE = {bin = "000001", name = "TRACE"},
    DEBUG = {bin = "000010", name = "DEBUG"},
    INFO =  {bin = "000100", name = "INFO"},
    WARN =  {bin = "001000", name = "WARN"},
    ERROR = {bin = "010000", name = "ERROR"},
    FATAL = {bin = "100000", name = "FATAL"},
    ALL =   {bin = "111111", name = "ALL"},
    NONE =  {bin = "000000", name = "NONE"}
  }
  logging.playerOptions = {}

  for _,player in pairs(players.list) do
    playerLogOptions = {}
    playerLogOptions.id = player.id
    playerLogOptions.visibility = logging.types.NONE

    table.insert(logging.playerOptions, playerLogOptions)
  end

  function logging.Write(logMessage)
    -- print("logging.Write")
    -- print("1"))
    local logString = tostring(logging.count) .. "#" .. logging.gameClock.clock.GetTimeString() .. "#" .. logMessage.type.name .. "#" .. logMessage.message
    -- print("2")

    for _,player in pairs(players.list) do
      -- print("3")
      for _,playerLogOptions in pairs(logging.playerOptions) do
        -- print("4")
        if(playerLogOptions.id == player.id) then
          -- print("5")
          local playerVisibilityOptionBinary = tonumber(playerLogOptions.visibility.bin, 2)
          local logMessageTypeBinary = tonumber(logMessage.type.bin, 2)
          -- print("6")
          -- print(playerVisibilityOptionBinary)
          -- print(logMessageTypeBinary)
          -- print(playerVisibilityOptionBinary & logMessageTypeBinary)
          if (playerVisibilityOptionBinary & logMessageTypeBinary) > 0 then
            -- print("7")
            wc3api.DisplayTextToPlayer(player.ref, 0, 0, logString)
          end
        end
      end
    end

    table.insert(logging.messages, logMessage)
    logging.count = logging.count + 1
  end


  function logging.SetPlayerOptionByID(id, option)
    for _,playerLogOptions in pairs(logging.playerOptions) do
      if playerLogOptions.id == id then
        for _,visibilityOption in pairs(logging.types) do
          if(option == visibilityOption) then
            playerLogOptions.visibility = option
          end
        end
      end
    end
  end

  return logging
end


function map.Logging_Tests(testFramework)
  testFramework.Suites.LoggingSuite = {}
  testFramework.Suites.LoggingSuite.Tests = {}
  local tsc = testFramework.Suites.LoggingSuite
  local wc3api = {}
  wc3api.constants = map.RealWc3Api_Create().constants

  function tsc.Setup() end
  function tsc.Teardown() end

  function tsc.Tests.DummyTest()
    assert(true)
  end

  --luacheck: push ignore
  function tsc.Tests.DisplayMessagesForSpecificPlayers()
    local gameClock = {}
    gameClock.clock = {}
    local commands = {}
    local players = {}
    players.list = {}
    local player1 = {}
    player1.id = 0
    local player2 = {}
    player2.id = 1
    table.insert(players.list, player1)
    table.insert(players.list, player2)
    local logging = map.Logging_Create(wc3api, gameClock, commands, players)

    function gameClock.clock.GetTimeString() return "0:0:0" end

    local testCalled = 0
    function wc3api.DisplayTextToPlayer(p1, p2, p3, p4)
      testCalled = testCalled + 1
    end


    logging.SetPlayerOptionByID(1,logging.types.DEBUG)

    local logMessage = {}
    logMessage.message = "This is a dummy"
    logMessage.type = logging.types.DEBUG
    logging.Write(logMessage)

    assert(logging.count == 1)
    assert(testCalled == 1)
  end
  --luacheck: pop

end
function map.DebugTools_Create(wc3api, logging, players, commands, utility, colors)
  local debugTools = {}

  local authenticatedUsers = {}
  local debugLog = {}
  debugLog.type = logging.types.DEBUG
  debugLog.message = ""

  local versionCommand = {}
  versionCommand.activator = "-version"
  versionCommand.users = players.ALL_PLAYERS
  function versionCommand.Handler()
    local commandingPlayer = wc3api.GetTriggerPlayer()
    local mapVer = "Map Version: " .. map.version
    local mapCommit = "Map Commit: " .. map.commit

    wc3api.DisplayTextToPlayer(commandingPlayer, 0, 0, mapVer)
    wc3api.DisplayTextToPlayer(commandingPlayer, 0, 0, mapCommit)
  end

  local function GetResourceData()
    local data = {}

    local cmdString = wc3api.GetEventPlayerChatString()
    local splitString = utility.Split(cmdString)

    data.commandingPlayer = players.GetPlayerByName(wc3api.GetPlayerName(wc3api.GetTriggerPlayer()))

    data.amount = tonumber(table.remove(splitString))
    if(data.amount < 0) then
      data = nil
    end

    local playerID = tonumber(table.remove(splitString))
    if(playerID < 0 or playerID > wc3api.GetBJMaxPlayers()) then
      data = nil
    end

    if(data ~= nil) then
      data.receivingPlayer = players.GetPlayerByID(playerID)
    end

    return data
  end

  -- Usage: "-gold 0 10000"
  local setGoldCommand = {}
  setGoldCommand.activator = "-gold"
  setGoldCommand.users = players.AUTHENTICATED_PLAYERS
  function setGoldCommand.Handler()
    local data = GetResourceData()

    if(data ~= nil) then
      wc3api.SetPlayerState(data.receivingPlayer.ref, wc3api.constants.PLAYER_STATE_RESOURCE_GOLD, data.amount)
      debugLog.message = data.commandingPlayer.coloredname .. " set player " .. data.receivingPlayer.coloredname .. " gold to amount " .. data.amount
      logging.Write(debugLog)
    end
  end

  -- Usage: "-wood 0 10000"
  local setWoodCommand = {}
  setWoodCommand.activator = "-wood"
  setWoodCommand.users = players.AUTHENTICATED_PLAYERS
  function setWoodCommand.Handler()
    local data = GetResourceData()

    if(data ~= nil) then
      wc3api.SetPlayerState(data.receivingPlayer.ref, wc3api.constants.PLAYER_STATE_RESOURCE_LUMBER, data.amount)
      debugLog.message = data.commandingPlayer.coloredname .. " set player " .. data.receivingPlayer.coloredname .. " wood to amount " .. data.amount
      logging.Write(debugLog)
    end
  end

  local killUnitCommand = {}
  killUnitCommand.activator = "-kill"
  killUnitCommand.users = players.AUTHENTICATED_PLAYERS
  function killUnitCommand.Handler()
    local commandingPlayer = wc3api.GetTriggerPlayer()
    local g = wc3api.CreateGroup()
    wc3api.GroupEnumUnitsSelected(g, commandingPlayer, wc3api.constants.NO_FILTER)
    local function KillUnit()
      local u = wc3api.GetEnumUnit()
      wc3api.KillUnit(u)
      u = nil
    end
    wc3api.ForGroup(g, KillUnit)
    wc3api.DestroyGroup(g)
    g = nil
  end

  local removeUnitCommand = {}
  removeUnitCommand.activator = "-remove"
  removeUnitCommand.users = players.AUTHENTICATED_PLAYERS
  function removeUnitCommand.Handler()
    local commandingPlayer = wc3api.GetTriggerPlayer()
    local g = wc3api.CreateGroup()
    wc3api.GroupEnumUnitsSelected(g, commandingPlayer, wc3api.constants.NO_FILTER)
    local function RemoveUnit()
      local u = wc3api.GetEnumUnit()
      wc3api.RemoveUnit(u)
      u = nil
    end
    wc3api.ForGroup(g, RemoveUnit)
    wc3api.DestroyGroup(g)
    g = nil
  end


  commands.Add(versionCommand)
  commands.Add(setGoldCommand)
  commands.Add(setWoodCommand)
  commands.Add(killUnitCommand)
  commands.Add(removeUnitCommand)

  return debugTools
end
function map.UnitManager_Create(wc3api, logging, commands)
  local unitManager = {}
  unitManager.wc3api = wc3api
  unitManager.logging = logging
  unitManager.commands = commands


  function unitManager.ScanAllUnitsOwnedByPlayer(player)
    local group g = wc3api.CreateGroup()

    local function filterUnits()
      return true
    end

    wc3api.GroupEnumUnitsOfPlayer(g, player.ref, wc3api.Filter(filterUnits))

    local function testGroups()
      local function testGroups2()
        local testGroupLog = {}
        testGroupLog.type = logging.types.DEBUG
        local u = wc3api.GetEnumUnit()
        local uid = wc3api.GetUnitTypeId(u)
        local uname = wc3api.GetObjectName(uid)

        testGroupLog.message = "unitname: " .. uname

        logging.Write(testGroupLog)
      end
      xpcall(testGroups2, print)
    end

    wc3api.ForGroup(g, testGroups)
  end

  return unitManager
end
function map.Colors_Create()
  local colors = {}
  colors.ColorList = {}

  function colors.AddColor(text, number, hexCode)
    local color = {}
    color.text = text
    color.number = number
    color.hexCode = hexCode

    table.insert(colors.ColorList, color)
  end

  -- This function returns a color object from text
  function colors.GetColor_T(t)
    for _,v in ipairs(colors.ColorList) do
      if t == v.text then
        return v
      end
    end
  end

  function colors.GetColor_N(n)
    for _,v in ipairs(colors.ColorList) do
      if n == v.number then
        return v
      end
    end
  end

  function colors.GetColorCode(text)
    for _,v in ipairs(colors.ColorList) do
      if text == v.text then
        return v.hexCode
      end
    end
  end

  function colors.GetColoredString(normalString, colorName)
    local coloredString = "|c" .. colors.GetColorCode(colorName) .. normalString  .. "|r"
    return coloredString
  end

  colors.AddColor("red", 1, "00FF0303")
  colors.AddColor("blue", 2, "000042FF")
  colors.AddColor("teal", 3, "001CE6B9")
  colors.AddColor("purple", 4, "00540081")
  colors.AddColor("yellow", 5, "00FFFC00")
  colors.AddColor("orange", 6, "00FE8A0E")
  colors.AddColor("green", 7, "0020C000")
  colors.AddColor("pink", 8, "00E55BB0")
  colors.AddColor("gray", 9, "00959697")
  colors.AddColor("light_blue", 10, "007EBFF1")
  colors.AddColor("dark_green", 11, "00106246")
  colors.AddColor("brown", 12, "004E2A04")
  colors.AddColor("maroon", 13, "009B0000")
  colors.AddColor("navy", 14, "000000C3")
  colors.AddColor("turquoise", 15, "0000EAFF")
  colors.AddColor("violet", 16, "00BE00FE")
  colors.AddColor("wheat", 17, "00EBCD87")
  colors.AddColor("peach", 18, "00F8A48B")
  colors.AddColor("mint", 19, "00BFFF80")
  colors.AddColor("lavender", 20, "00DCB9EB")
  colors.AddColor("coal", 21, "00282828")
  colors.AddColor("snow", 22, "00EBF0FF")
  colors.AddColor("emerald", 23, "0000781E")
  colors.AddColor("peanut", 24, "00A46F33")
  colors.AddColor("some_weird_green", 25, "0022744F")
  colors.AddColor("gold", 26, "00FFD700")
  colors.AddColor("bright_blue", 27, "0019CAF6")

  return colors
end

function map.Colors_Tests(testFramework)
  testFramework.Suites.ColorsSuite = {}
  testFramework.Suites.ColorsSuite.Tests = {}
  local tsc = testFramework.Suites.ColorsSuite


  function tsc.Setup() end
  function tsc.Teardown() end

  function tsc.Tests.DummyTest()
    assert(true)
  end
end
--luacheck: push ignore

function map.RealWc3Api_Create()
  local realWc3Api = {}

  realWc3Api.constants = {}
  realWc3Api.constants.NO_FILTER = nil
  realWc3Api.constants.EXACT_MATCH = true
  realWc3Api.constants.NO_EXACT_MATCH = false

  realWc3Api.constants.WEAPON_INDEX_GROUND = 0
  realWc3Api.constants.WEAPON_INDEX_AIR = 1

  realWc3Api.constants.bj_FORCE_ALL_PLAYERS = nil
  realWc3Api.constants.EVENT_PLAYER_LEAVE = EVENT_PLAYER_LEAVE

  realWc3Api.constants.EVENT_PLAYER_UNIT_ATTACKED = EVENT_PLAYER_UNIT_ATTACKED
  realWc3Api.constants.EVENT_PLAYER_UNIT_RESCUED = EVENT_PLAYER_UNIT_RESCUED
  realWc3Api.constants.EVENT_PLAYER_UNIT_DEATH = EVENT_PLAYER_UNIT_DEATH
  realWc3Api.constants.EVENT_PLAYER_UNIT_DECAY = EVENT_PLAYER_UNIT_DECAY
  realWc3Api.constants.EVENT_PLAYER_UNIT_DETECTED = EVENT_PLAYER_UNIT_DETECTED
  realWc3Api.constants.EVENT_PLAYER_UNIT_HIDDEN = EVENT_PLAYER_UNIT_HIDDEN
  realWc3Api.constants.EVENT_PLAYER_UNIT_SELECTED = EVENT_PLAYER_UNIT_SELECTED
  realWc3Api.constants.EVENT_PLAYER_UNIT_DESELECTED = EVENT_PLAYER_UNIT_DESELECTED
  realWc3Api.constants.EVENT_PLAYER_UNIT_CONSTRUCT_START = EVENT_PLAYER_UNIT_CONSTRUCT_START
  realWc3Api.constants.EVENT_PLAYER_UNIT_CONSTRUCT_CANCEL = EVENT_PLAYER_UNIT_CONSTRUCT_CANCEL
  realWc3Api.constants.EVENT_PLAYER_UNIT_CONSTRUCT_FINISH = EVENT_PLAYER_UNIT_CONSTRUCT_FINISH
  realWc3Api.constants.EVENT_PLAYER_UNIT_UPGRADE_START = EVENT_PLAYER_UNIT_UPGRADE_START
  realWc3Api.constants.EVENT_PLAYER_UNIT_UPGRADE_CANCEL = EVENT_PLAYER_UNIT_UPGRADE_CANCEL
  realWc3Api.constants.EVENT_PLAYER_UNIT_UPGRADE_FINISH = EVENT_PLAYER_UNIT_UPGRADE_FINISH
  realWc3Api.constants.EVENT_PLAYER_UNIT_TRAIN_START = EVENT_PLAYER_UNIT_TRAIN_START
  realWc3Api.constants.EVENT_PLAYER_UNIT_TRAIN_CANCEL = EVENT_PLAYER_UNIT_TRAIN_CANCEL
  realWc3Api.constants.EVENT_PLAYER_UNIT_TRAIN_FINISH = EVENT_PLAYER_UNIT_TRAIN_FINISH
  realWc3Api.constants.EVENT_PLAYER_UNIT_RESEARCH_START = EVENT_PLAYER_UNIT_RESEARCH_START
  realWc3Api.constants.EVENT_PLAYER_UNIT_RESEARCH_CANCEL = EVENT_PLAYER_UNIT_RESEARCH_CANCEL
  realWc3Api.constants.EVENT_PLAYER_UNIT_RESEARCH_FINISH = EVENT_PLAYER_UNIT_RESEARCH_FINISH
  realWc3Api.constants.EVENT_PLAYER_UNIT_ISSUED_ORDER = EVENT_PLAYER_UNIT_ISSUED_ORDER
  realWc3Api.constants.EVENT_PLAYER_UNIT_ISSUED_POINT_ORDER = EVENT_PLAYER_UNIT_ISSUED_POINT_ORDER
  realWc3Api.constants.EVENT_PLAYER_UNIT_ISSUED_TARGET_ORDER = EVENT_PLAYER_UNIT_ISSUED_TARGET_ORDER
  realWc3Api.constants.EVENT_PLAYER_UNIT_ISSUED_UNIT_ORDER = EVENT_PLAYER_UNIT_ISSUED_UNIT_ORDER
  realWc3Api.constants.EVENT_PLAYER_HERO_LEVEL = EVENT_PLAYER_HERO_LEVEL
  realWc3Api.constants.EVENT_PLAYER_HERO_SKILL = EVENT_PLAYER_HERO_SKILL
  realWc3Api.constants.EVENT_PLAYER_HERO_REVIVABLE = EVENT_PLAYER_HERO_REVIVABLE
  realWc3Api.constants.EVENT_PLAYER_HERO_REVIVE_START = EVENT_PLAYER_HERO_REVIVE_START
  realWc3Api.constants.EVENT_PLAYER_HERO_REVIVE_CANCEL = EVENT_PLAYER_HERO_REVIVE_CANCEL
  realWc3Api.constants.EVENT_PLAYER_HERO_REVIVE_FINISH = EVENT_PLAYER_HERO_REVIVE_FINISH
  realWc3Api.constants.EVENT_PLAYER_UNIT_SUMMON = EVENT_PLAYER_UNIT_SUMMON
  realWc3Api.constants.EVENT_PLAYER_UNIT_DROP_ITEM = EVENT_PLAYER_UNIT_DROP_ITEM
  realWc3Api.constants.EVENT_PLAYER_UNIT_PICKUP_ITEM = EVENT_PLAYER_UNIT_PICKUP_ITEM
  realWc3Api.constants.EVENT_PLAYER_UNIT_USE_ITEM = EVENT_PLAYER_UNIT_USE_ITEM
  realWc3Api.constants.EVENT_PLAYER_UNIT_LOADED = EVENT_PLAYER_UNIT_LOADED
  realWc3Api.constants.EVENT_PLAYER_UNIT_DAMAGED = EVENT_PLAYER_UNIT_DAMAGED
  realWc3Api.constants.EVENT_PLAYER_UNIT_DAMAGING = EVENT_PLAYER_UNIT_DAMAGING

  realWc3Api.constants.UNIT_TYPE_HERO = UNIT_TYPE_HERO
  realWc3Api.constants.UNIT_TYPE_DEAD = UNIT_TYPE_DEAD
  realWc3Api.constants.UNIT_TYPE_STRUCTURE = UNIT_TYPE_STRUCTURE
  realWc3Api.constants.UNIT_TYPE_FLYING = UNIT_TYPE_FLYING
  realWc3Api.constants.UNIT_TYPE_GROUND = UNIT_TYPE_GROUND
  realWc3Api.constants.UNIT_TYPE_ATTACKS_FLYING = UNIT_TYPE_ATTACKS_FLYING
  realWc3Api.constants.UNIT_TYPE_ATTACKS_GROUND = UNIT_TYPE_ATTACKS_GROUND
  realWc3Api.constants.UNIT_TYPE_MELEE_ATTACKER = UNIT_TYPE_MELEE_ATTACKER
  realWc3Api.constants.UNIT_TYPE_RANGED_ATTACKER = UNIT_TYPE_RANGED_ATTACKER
  realWc3Api.constants.UNIT_TYPE_GIANT = UNIT_TYPE_GIANT
  realWc3Api.constants.UNIT_TYPE_SUMMONED = UNIT_TYPE_SUMMONED
  realWc3Api.constants.UNIT_TYPE_STUNNED = UNIT_TYPE_STUNNED
  realWc3Api.constants.UNIT_TYPE_PLAGUED = UNIT_TYPE_PLAGUED
  realWc3Api.constants.UNIT_TYPE_SNARED = UNIT_TYPE_SNARED
  realWc3Api.constants.UNIT_TYPE_UNDEAD = UNIT_TYPE_UNDEAD
  realWc3Api.constants.UNIT_TYPE_MECHANICAL = UNIT_TYPE_MECHANICAL
  realWc3Api.constants.UNIT_TYPE_PEON = UNIT_TYPE_PEON
  realWc3Api.constants.UNIT_TYPE_SAPPER = UNIT_TYPE_SAPPER
  realWc3Api.constants.UNIT_TYPE_TOWNHALL = UNIT_TYPE_TOWNHALL
  realWc3Api.constants.UNIT_TYPE_ANCIENT = UNIT_TYPE_ANCIENT
  realWc3Api.constants.UNIT_TYPE_TAUREN = UNIT_TYPE_TAUREN
  realWc3Api.constants.UNIT_TYPE_POISONED = UNIT_TYPE_POISONED
  realWc3Api.constants.UNIT_TYPE_POLYMORPHED = UNIT_TYPE_POLYMORPHED
  realWc3Api.constants.UNIT_TYPE_SLEEPING = UNIT_TYPE_SLEEPING
  realWc3Api.constants.UNIT_TYPE_RESISTANT = UNIT_TYPE_RESISTANT
  realWc3Api.constants.UNIT_TYPE_ETHEREAL = UNIT_TYPE_ETHEREAL
  realWc3Api.constants.UNIT_TYPE_MAGIC_IMMUNE = UNIT_TYPE_MAGIC_IMMUNE

  realWc3Api.constants.UNIT_RF_HP = UNIT_RF_HP
  realWc3Api.constants.UNIT_RF_HIT_POINTS_REGENERATION_RATE = UNIT_RF_HIT_POINTS_REGENERATION_RATE
  realWc3Api.constants.UNIT_RF_MANA = UNIT_RF_MANA
  realWc3Api.constants.UNIT_RF_MANA_REGENERATION = UNIT_RF_MANA_REGENERATION

  realWc3Api.constants.UNIT_STATE_LIFE = UNIT_STATE_LIFE
  realWc3Api.constants.UNIT_STATE_MAX_LIFE = UNIT_STATE_MAX_LIFE
  realWc3Api.constants.UNIT_STATE_MANA = UNIT_STATE_MANA
  realWc3Api.constants.UNIT_STATE_MAX_MANA = UNIT_STATE_MAX_MANA

  realWc3Api.constants.PLAYER_STATE_RESOURCE_GOLD = PLAYER_STATE_RESOURCE_GOLD
  realWc3Api.constants.PLAYER_STATE_RESOURCE_LUMBER = PLAYER_STATE_RESOURCE_LUMBER

  realWc3Api.constants.PLAYER_SLOT_STATE_EMPTY = PLAYER_SLOT_STATE_EMPTY
  realWc3Api.constants.PLAYER_SLOT_STATE_PLAYING = PLAYER_SLOT_STATE_PLAYING
  realWc3Api.constants.PLAYER_SLOT_STATE_LEFT = PLAYER_SLOT_STATE_LEFT

  realWc3Api.constants.MAP_CONTROL_USER = MAP_CONTROL_USER
  realWc3Api.constants.MAP_CONTROL_COMPUTER = MAP_CONTROL_COMPU
  realWc3Api.constants.MAP_CONTROL_RESCUABLE = MAP_CONTROL_RESCU
  realWc3Api.constants.MAP_CONTROL_NEUTRAL = MAP_CONTROL_NEUTR
  realWc3Api.constants.MAP_CONTROL_CREEP = MAP_CONTROL_CREEP
  realWc3Api.constants.MAP_CONTROL_NONE = MAP_CONTROL_NONE

  realWc3Api.constants.ALLIANCE_SHARED_XP = ALLIANCE_SHARED_XP
  realWc3Api.constants.ALLIANCE_SHARED_SPELLS = ALLIANCE_SHARED_SPELLS
  realWc3Api.constants.ALLIANCE_SHARED_VISION = ALLIANCE_SHARED_VISION
  realWc3Api.constants.ALLIANCE_SHARED_CONTROL = ALLIANCE_SHARED_CONTROL
  realWc3Api.constants.ALLIANCE_SHARED_ADVANCED_CONTROL = ALLIANCE_SHARED_ADVANCED_CONTROL

  realWc3Api.constants.CAMERA_FIELD_TARGET_DISTANCE = CAMERA_FIELD_TARGET_DISTANCE

  function realWc3Api.BJDebugMsg(msg)
    return BJDebugMsg(msg)
  end

  function realWc3Api.CreateTrigger()
    return CreateTrigger()
  end

  function realWc3Api.DestroyTrigger(whichTrigger)
    return DestroyTrigger(whichTrigger)
  end

  function realWc3Api.TriggerSleepAction(timeout)
    return TriggerSleepAction(timeout)
  end

  function realWc3Api.Condition(func)
    return Condition(func)
  end

  function realWc3Api.DestroyCondition(c)
    return DestroyCondition(c)
  end

  function realWc3Api.Filter(func)
    return Filter(func)
  end

  function realWc3Api.DestroyFilter(f)
    return DestroyFilter(f)
  end

  function realWc3Api.DestroyBoolExpr(e)
    return DestroyBoolExpr(e)
  end

  function realWc3Api.TriggerRegisterUnitInRange(whichTrigger, whichUnit, range, filter)
    return TriggerRegisterUnitInRange(whichTrigger, whichUnit, range, filter)
  end

  function realWc3Api.TriggerRemoveCondition(whichTrigger, whichCondition)
    return TriggerRemoveCondition(whichTrigger, whichCondition)
  end

  function realWc3Api.TriggerClearConditions(whichTrigger)
    return TriggerClearConditions(whichTrigger)
  end

  function realWc3Api.TriggerRemoveAction(whichTrigger, whichAction)
    return TriggerRemoveAction(whichTrigger, whichAction)
  end

  function realWc3Api.TriggerClearActions(whichTrigger)
    return TriggerClearActions(whichTrigger)
  end

  function realWc3Api.TriggerSleepAction(timeout)
    return TriggerSleepAction(timeout)
  end

  function realWc3Api.TriggerWaitForSound(s, offset)
    return TriggerWaitForSound(s, offset)
  end

  function realWc3Api.TriggerExecute(whichTrigger)
    return TriggerExecute(whichTrigger)
  end

  function realWc3Api.TriggerEvaluate(whichTrigger)
    return TriggerEvaluate(whichTrigger)
  end

  function realWc3Api.TriggerExecuteWait(whichTrigger)
    return TriggerExecuteWait(whichTrigger)
  end

  function realWc3Api.TriggerSyncStart()
    return TriggerSyncStart()
  end

  function realWc3Api.TriggerSyncReady()
    return TriggerSyncReady()
  end

  function realWc3Api.TriggerRegisterPlayerChatEvent(whichTrigger, whichPlayer, chatMessageToDetect, exactMatchOnly)
    return TriggerRegisterPlayerChatEvent(whichTrigger, whichPlayer, chatMessageToDetect, exactMatchOnly)
  end

  function realWc3Api.GetEventPlayerState()
    return GetEventPlayerState()
  end

  function realWc3Api.TriggerRegisterPlayerEvent(whichTrigger, whichPlayer, whichPlayerEvent)
    return TriggerRegisterPlayerEvent(whichTrigger, whichPlayer, whichPlayerEvent)
  end

  function realWc3Api.TriggerRegisterPlayerUnitEvent(whichTrigger, whichPlayer, whichPlayerUnitEvent, filter)
    return TriggerRegisterPlayerUnitEvent(whichTrigger, whichPlayer, whichPlayerUnitEvent, filter)
  end

  function realWc3Api.TriggerRegisterUnitStateEvent(whichTrigger, whichUnit, whichState, opcode, limitval)
    return TriggerRegisterUnitStateEvent(whichTrigger, whichUnit, whichState, opcode, limitval)
  end

  function realWc3Api.TriggerRegisterDeathEvent(whichTrigger, whichWidget)
    return TriggerRegisterDeathEvent(whichTrigger, whichWidget)
  end

  function realWc3Api.GetEventPlayerChatString()
    return GetEventPlayerChatString()
  end

  function realWc3Api.Player(playerNum)
    return Player(playerNum)
  end

  function realWc3Api.TriggerAddAction(whichTrigger, actionFunc)
    return TriggerAddAction(whichTrigger, actionFunc)
  end

  function realWc3Api.TriggerRegisterTimerEvent(whichTrigger, timeout, periodic)
    return TriggerRegisterTimerEvent(whichTrigger, timeout, periodic)
  end

  function realWc3Api.DisplayTimedTextToPlayer(toPlayer, x, y, duration, message)
    return DisplayTimedTextToPlayer(toPlayer, x, y, duration, message)
  end

  function realWc3Api.DisplayTextToPlayer(toPlayer, x, y, message)
    return DisplayTextToPlayer(toPlayer, x, y, message)
  end

  function realWc3Api.GetPlayers()
    return GetPlayers()
  end

  function realWc3Api.GetBJMaxPlayers()
    return GetBJMaxPlayers()
  end

  function realWc3Api.GetPlayerId(whichPlayer)
    return GetPlayerId(whichPlayer)
  end

  function realWc3Api.GetPlayerName(whichPlayer)
    return GetPlayerName(whichPlayer)
  end

  function realWc3Api.GetPlayerRace(whichPlayer)
    return GetPlayerRace(whichPlayer)
  end

  function realWc3Api.GetPlayerTeam(whichPlayer)
    return GetPlayerTeam()
  end

  function realWc3Api.GetPlayerAlliance(sourcePlayer, otherPlayer, whichAllianceSetting)
    return GetPlayerAlliance(sourcePlayer, otherPlayer, whichAllianceSetting)
  end

  function realWc3Api.SetPlayerAlliance(sourcePlayer, otherPlayer, whichAllianceSetting, value)
    return SetPlayerAlliance(sourcePlayer, otherPlayer, whichAllianceSetting, value)
  end

  function realWc3Api.GetPlayerColor(whichPlayer)
    return GetPlayerColor(whichPlayer)
  end

  function realWc3Api.GetPlayerController(whichPlayer)
    return GetPlayerController(whichPlayer)
  end

  function realWc3Api.GetPlayerSlotState(whichPlayer)
    return GetPlayerSlotState(whichPlayer)
  end

  function realWc3Api.GetPlayerState(whichPlayer, whichPlayerState)
    return GetPlayerState(whichPlayer, whichPlayerState)
  end

  function realWc3Api.SetPlayerState(whichPlayer, whichPlayerState, value)
    return SetPlayerState(whichPlayer, whichPlayerState, value)
  end

  function realWc3Api.GetTriggerPlayer()
    return GetTriggerPlayer()
  end

  function realWc3Api.TriggerRegisterEnterRectSimple(trig, r)
    return TriggerRegisterEnterRectSimple(trig, r)
  end

  function realWc3Api.GetTriggerUnit()
    return GetTriggerUnit()
  end

  function realWc3Api.GetLevelingUnit()
    return GetLevelingUnit()
  end

  function realWc3Api.GetLearningUnit()
    return GetLearningUnit()
  end

  function realWc3Api.GetLearnedSkill()
    return GetLearnedSkill()
  end

  function realWc3Api.GetLearnedSkillLevel()
    return GetLearnedSkillLevel()
  end

  function realWc3Api.GetRevivableUnit()
    return GetRevivableUnit()
  end

  function realWc3Api.GetRevivingUnit()
    return GetRevivingUnit()
  end

  function realWc3Api.GetAttacker()
    return GetAttacker()
  end

  function realWc3Api.GetRescuer()
    return GetRescuer()
  end

  function realWc3Api.GetDyingUnit()
    return GetDyingUnit()
  end

  function realWc3Api.GetKillingUnit()
    return GetKillingUnit()
  end

  function realWc3Api.GetDecayingUnit()
    return GetDecayingUnit()
  end

  function realWc3Api.GetResearchingUnit()
    return GetResearchingUnit()
  end

  function realWc3Api.GetResearched()
    return GetResearched()
  end

  function realWc3Api.GetTrainedUnitType()
    return GetTrainedUnitType()
  end

  function realWc3Api.GetTrainedUnit()
    return GetTrainedUnit()
  end

  function realWc3Api.GetDetectedUnit()
    return GetDetectedUnit()
  end

  function realWc3Api.GetSummoningUnit()
    return GetSummoningUnit()
  end

  function realWc3Api.GetSummonedUnit()
    return GetSummonedUnit()
  end

  function realWc3Api.GetTransportUnit()
    return GetTransportUnit()
  end

  function realWc3Api.GetLoadedUnit()
    return GetLoadedUnit()
  end

  function realWc3Api.GetSellingUnit()
    return GetSellingUnit()
  end

  function realWc3Api.GetSoldUnit()
    return GetSoldUnit()
  end

  function realWc3Api.GetBuyingUnit()
    return GetBuyingUnit()
  end

  function realWc3Api.GetSoldItem()
    return GetSoldItem()
  end

  function realWc3Api.GetChangingUnit()
    return GetChangingUnit()
  end

  function realWc3Api.GetChangingUnitPrevOwner()
    return GetChangingUnitPrevOwner()
  end

  function realWc3Api.GetManipulatingUnit()
    return GetManipulatingUnit()
  end

  function realWc3Api.GetManipulatedItem()
    return GetManipulatedItem()
  end

  function realWc3Api.BlzGetAbsorbingItem()
    return BlzGetAbsorbingItem()
  end

  function realWc3Api.BlzGetManipulatedItemWasAbsorbed()
    return BlzGetManipulatedItemWasAbsorbed()
  end

  function realWc3Api.BlzGetStackingItemSource()
    return BlzGetStackingItemSource()
  end

  function realWc3Api.BlzGetStackingItemTarget()
    return BlzGetStackingItemTarget()
  end

  function realWc3Api.BlzGetStackingItemTargetPreviousCharges()
    return BlzGetStackingItemTargetPreviousCharges()
  end

  function realWc3Api.GetOrderedUnit()
    return GetOrderedUnit()
  end

  function realWc3Api.GetIssuedOrderId()
    return GetIssuedOrderId()
  end

  function realWc3Api.GetOrderPointX()
    return GetOrderPointX()
  end

  function realWc3Api.GetOrderPointY()
    return GetOrderPointY()
  end

  function realWc3Api.GetOrderTarget()
    return GetOrderTarget()
  end

  function realWc3Api.GetOrderTargetDestructable()
    return GetOrderTargetDestructable()
  end

  function realWc3Api.GetOrderTargetItem()
    return GetOrderTargetItem()
  end

  function realWc3Api.GetOrderTargetUnit()
    return GetOrderTargetUnit()
  end

  function realWc3Api.GetSpellAbilityUnit()
    return GetSpellAbilityUnit()
  end

  function realWc3Api.GetSpellAbilityId()
    return GetSpellAbilityId()
  end

  function realWc3Api.GetSpellAbility()
    return GetSpellAbility()
  end

  function realWc3Api.GetSpellTargetX()
    return GetSpellTargetX()
  end

  function realWc3Api.GetSpellTargetY()
    return GetSpellTargetY()
  end

  function realWc3Api.GetSpellTargetDestructable()
    return GetSpellTargetDestructable()
  end

  function realWc3Api.GetSpellTargetItem()
    return GetSpellTargetItem()
  end

  function realWc3Api.GetSpellTargetUnit()
    return GetSpellTargetUnit()
  end

  function realWc3Api.BlzSetUnitName(whichUnit, name)
    return BlzSetUnitName(whichUnit, name)
  end

  function realWc3Api.GetUnitName()
    return GetUnitName()
  end

  function realWc3Api.SetUnitMoveSpeed(whichUnit, newSpeed)
    return SetUnitMoveSpeed(whichUnit, newSpeed)
  end

  function realWc3Api.GetUnitMoveSpeed(whichUnit)
    return GetUnitMoveSpeed(whichUnit)
  end

  function realWc3Api.BlzGetUnitBooleanField(whichUnit, whichField)
    return BlzGetUnitBooleanField(whichUnit, whichField)
  end

  function realWc3Api.BlzGetUnitIntegerField(whichUnit, whichField)
    return BlzGetUnitIntegerField(whichUnit, whichField)
  end

  function realWc3Api.BlzGetUnitRealField(whichUnit, whichField)
    return BlzGetUnitRealField(whichUnit, whichField)
  end

  function realWc3Api.BlzGetUnitStringField(whichUnit, whichField)
    return BlzGetUnitStringField(whichUnit, whichField)
  end

  function realWc3Api.SetUnitState(whichUnit, whichUnitState, newVal)
    return SetUnitState(whichUnit, whichUnitState, newVal)
  end

  function realWc3Api.GetUnitState(whichUnit, whichUnitState)
    return GetUnitState(whichUnit, whichUnitState)
  end

  function realWc3Api.BlzSetUnitBooleanField(whichUnit, whichField, value)
    return BlzSetUnitBooleanField(whichUnit, whichField, value)
  end

  function realWc3Api.BlzSetUnitIntegerField(whichUnit, whichField, value)
    return BlzSetUnitIntegerField(whichUnit, whichField, value)
  end

  function realWc3Api.BlzSetUnitRealField(whichUnit, whichField, value)
    return BlzSetUnitRealField(whichUnit, whichField, value)
  end

  function realWc3Api.BlzSetUnitStringField(whichUnit, whichField, value)
    return BlzSetUnitStringField(whichUnit, whichField, value)
  end

  function realWc3Api.SetUnitState(whichUnit, whichUnitState, newVal)
    return SetUnitState(whichUnit, whichUnitState, newVal)
  end

  function realWc3Api.BlzGetUnitBaseDamage(whichUnit, weaponIndex)
    return BlzGetUnitBaseDamage(whichUnit, weaponIndex)
  end

  function realWc3Api.BlzGetUnitArmor(whichUnit)
    return BlzGetUnitArmor(whichUnit)
  end

  function realWc3Api.BlzSetUnitArmor(whichUnit, armorAmount)
    return BlzSetUnitArmor(whichUnit, armorAmount)
  end

  function realWc3Api.BlzUnitHideAbility(whichUnit, abilId, flag)
    return BlzUnitHideAbility(whichUnit, abilId, flag)
  end

  function realWc3Api.BlzUnitDisableAbility(whichUnit, abilId, flag, hideUI)
    return BlzUnitDisableAbility(whichUnit, abilId, flag, hideUI)
  end

  function realWc3Api.BlzUnitCancelTimedLife(whichUnit)
    return BlzUnitCancelTimedLife(whichUnit)
  end

  function realWc3Api.BlzIsUnitSelectable(whichUnit)
    return BlzIsUnitSelectable(whichUnit)
  end

  function realWc3Api.BlzIsUnitInvulnerable(whichUnit)
    return BlzIsUnitInvulnerable(whichUnit)
  end

  function realWc3Api.BlzUnitInterruptAttack(whichUnit)
    return BlzUnitInterruptAttack(whichUnit)
  end

  function realWc3Api.BlzGetUnitCollisionSize(whichUnit)
    return BlzGetUnitCollisionSize(whichUnit)
  end

  function realWc3Api.BlzGetAbilityManaCost(abilId, level)
    return BlzGetAbilityManaCost(abilId, level)
  end

  function realWc3Api.BlzGetAbilityCooldown(abilId, level)
    return BlzGetAbilityCooldown(abilId, level)
  end

  function realWc3Api.BlzSetUnitAbilityCooldown(whichUnit, abilId, level, cooldown)
    return BlzSetUnitAbilityCooldown(whichUnit, abilId, level, cooldown)
  end

  function realWc3Api.BlzGetUnitAbilityCooldown(whichUnit, abilId, level)
    return BlzGetUnitAbilityCooldown(whichUnit, abilId, level)
  end

  function realWc3Api.BlzGetUnitAbilityCooldownRemaining(whichUnit, abilId)
    return BlzGetUnitAbilityCooldownRemaining(whichUnit, abilId)
  end

  function realWc3Api.BlzEndUnitAbilityCooldown(whichUnit, abilCode)
    return BlzEndUnitAbilityCooldown(whichUnit, abilCode)
  end

  function realWc3Api.BlzStartUnitAbilityCooldown(whichUnit, abilCode, cooldown)
    return BlzStartUnitAbilityCooldown(whichUnit, abilCode, cooldown)
  end

  function realWc3Api.BlzGetUnitAbilityManaCost(whichUnit, abilId, level)
    return BlzGetUnitAbilityManaCost(whichUnit, abilId, level)
  end

  function realWc3Api.BlzSetUnitAbilityManaCost(whichUnit, abilId, level, manaCost)
    return BlzSetUnitAbilityManaCost(whichUnit, abilId, level, manaCost)
  end

  function realWc3Api.BlzSetUnitBaseDamage(whichUnit, baseDamage, weaponIndex)
    return BlzSetUnitBaseDamage(whichUnit, baseDamage, weaponIndex)
  end

  function realWc3Api.SetUnitPosition(whichUnit, newX, newY)
    return SetUnitPosition(whichUnit, newX, newY)
  end

  function realWc3Api.SetUnitScale(whichUnit, scaleX, scaleY, scaleZ)
    return SetUnitScale(whichUnit, scaleX, scaleY, scaleZ)
  end

  function realWc3Api.SetUnitVertexColor(whichUnit, red, green, blue, alpha)
    return SetUnitVertexColor(whichUnit, red, green, blue, alpha)
  end

  function realWc3Api.QueueUnitAnimation(whichUnit, whichAnimation)
    return QueueUnitAnimation(whichUnit, whichAnimation)
  end

  function realWc3Api.SetUnitAnimationByIndex(whichUnit, whichAnimation)
    return SetUnitAnimationByIndex(whichUnit, whichAnimation)
  end

  function realWc3Api.SetUnitAnimationWithRarity(whichUnit, whichAnimation, rarity)
    return SetUnitAnimationWithRarity(whichUnit, whichAnimation, rarity)
  end

  function realWc3Api.AddUnitAnimationProperties(whichUnit, animProperties, add)
    return AddUnitAnimationProperties(whichUnit, animProperties, add)
  end

  function realWc3Api.SetUnitLookAt(whichUnit, whichBone, lookAtTarget, offsetX, offsetY, offsetZ)
    return SetUnitLookAt(whichUnit, whichBone, lookAtTarget, offsetX, offsetY, offsetZ)
  end

  function realWc3Api.SetUnitRescuable(whichUnit, byWhichPlayer, flag)
    return SetUnitRescuable(whichUnit, byWhichPlayer, flag)
  end

  function realWc3Api.SetHeroStr(whichHero, newStr, permanent)
    return SetHeroStr(whichHero, newStr, permanent)
  end

  function realWc3Api.SetHeroAgi(whichHero, newAgi, permanent)
    return SetHeroAgi(whichHero, newAgi, permanent)
  end

  function realWc3Api.SetHeroInt(whichHero, newInt, permanent)
    return SetHeroInt(whichHero, newInt, permanent)
  end

  function realWc3Api.GetHeroStr(whichHero, includeBonuses)
    return GetHeroStr(whichHero, includeBonuses)
  end

  function realWc3Api.GetHeroAgi(whichHero, includeBonuses)
    return GetHeroAgi(whichHero, includeBonuses)
  end

  function realWc3Api.GetHeroInt(whichHero, includeBonuses)
    return GetHeroInt(whichHero, includeBonuses)
  end

  function realWc3Api.UnitStripHeroLevel(whichHero, howManyLevels)
    return UnitStripHeroLevel(whichHero, howManyLevels)
  end

  function realWc3Api.GetHeroXP(whichHero)
    return GetHeroXP(whichHero)
  end

  function realWc3Api.SetHeroXP(whichHero, newXpVal, showEyeCandy)
    return SetHeroXP(whichHero, newXpVal, showEyeCandy)
  end

  function realWc3Api.GetHeroSkillPoints(whichHero)
    return GetHeroSkillPoints(whichHero)
  end

  function realWc3Api.UnitModifySkillPoints(whichHero, skillPointDelta)
    return UnitModifySkillPoints(whichHero, skillPointDelta)
  end

  function realWc3Api.AddHeroXP(whichHero, xpToAdd, showEyeCandy)
    return AddHeroXP(whichHero, xpToAdd, showEyeCandy)
  end

  function realWc3Api.SetHeroLevel(whichHero, level, showEyeCandy)
    return SetHeroLevel(whichHero, level, showEyeCandy)
  end

  function realWc3Api.GetHeroLevel(whichHero)
    return GetHeroLevel(whichHero)
  end

  function realWc3Api.GetUnitLevel(whichUnit)
    return GetUnitLevel(whichUnit)
  end

  function realWc3Api.SuspendHeroXP(whichHero, flag)
    return SuspendHeroXP(whichHero, flag)
  end

  function realWc3Api.IsSuspendedXP(whichHero)
    return IsSuspendedXP(whichHero)
  end

  function realWc3Api.SelectHeroSkill(whichHero, abilcode)
    return SelectHeroSkill(whichHero, abilcode)
  end

  function realWc3Api.KillUnit(whichUnit)
    return KillUnit(whichUnit)
  end

  function realWc3Api.RemoveUnit(whichUnit)
    return RemoveUnit(whichUnit)
  end

  function realWc3Api.FourCC(typeId)
    return FourCC(typeId)
  end

  function realWc3Api.CreateUnitByName(whichPlayer, unitname, x, y, face)
    return CreateUnitByName(whichPlayer, unitname, x, y, face)
  end

  function realWc3Api.CreateUnit(id, unitid, x, y, face)
    return CreateUnit(id, unitid, x, y, face)
  end

  function realWc3Api.GetUnitAbilityLevel(whichUnit, abilcode)
    return GetUnitAbilityLevel(whichUnit, abilcode)
  end

  function realWc3Api.DecUnitAbilityLevel(whichUnit, abilcode)
    return DecUnitAbilityLevel(whichUnit, abilcode)
  end

  function realWc3Api.IncUnitAbilityLevel(whichUnit, abilcode)
    return IncUnitAbilityLevel(whichUnit, abilcode)
  end

  function realWc3Api.SetUnitAbilityLevel(whichUnit, abilcode, level)
    return SetUnitAbilityLevel(whichUnit, abilcode, level)
  end

  function realWc3Api.UnitAddAbility(whichUnit, abilityId)
    return UnitAddAbility(whichUnit, abilityId)
  end

  function realWc3Api.UnitRemoveAbility(whichUnit, abilityId)
    return UnitRemoveAbility(whichUnit, abilityId)
  end

  function realWc3Api.UnitMakeAbilityPermanent(whichUnit, permanent, abilityId)
    return UnitMakeAbilityPermanent(whichUnit, permanent, abilityId)
  end

  function realWc3Api.BlzGetUnitMaxMana(whichUnit)
    return BlzGetUnitMaxMana(whichUnit)
  end

  function realWc3Api.BlzSetUnitMaxMana(whichUnit, mana)
    return BlzSetUnitMaxMana(whichUnit, mana)
  end

  function realWc3Api.BlzSetUnitMaxHP(whichUnit, hp)
    return BlzSetUnitMaxHP(whichUnit, hp)
  end

  function realWc3Api.BlzGetUnitMaxHP(whichUnit)
    return BlzGetUnitMaxHP(whichUnit)
  end

  function realWc3Api.GetHeroProperName(whichHero)
    return GetHeroProperName(whichHero)
  end

  function realWc3Api.IsHeroUnitId(unitId)
    return IsHeroUnitId(unitId)
  end

  function realWc3Api.GetObjectName(objectId)
    return GetObjectName(objectId)
  end

  function realWc3Api.GetUnitTypeId(whichUnit)
    return GetUnitTypeId(whichUnit)
  end

  function realWc3Api.GetConstructingStructure()
    return GetConstructingStructure()
  end

  function realWc3Api.GetCancelledStructure()
    return GetCancelledStructure()
  end

  function realWc3Api.GetConstructedStructure()
    return GetConstructedStructure()
  end

  function realWc3Api.UnitSetConstructionProgress(whichUnit, constructionPercentage)
    return UnitSetConstructionProgress(whichUnit, constructionPercentage)
  end

  function realWc3Api.CreateGroup()
    return CreateGroup()
  end

  function realWc3Api.DestroyGroup(whichGroup)
    return DestroyGroup(whichGroup)
  end

  function realWc3Api.GroupAddUnit(whichGroup, whichUnit)
    return GroupAddUnit(whichGroup, whichUnit)
  end

  function realWc3Api.GroupRemoveUnit(whichGroup, whichUnit)
    return GroupRemoveUnit(whichGroup, whichUnit)
  end

  function realWc3Api.GroupClear(whichGroup)
    return GroupClear(WhichGroup)
  end

  function realWc3Api.GetEnumUnit()
    return GetEnumUnit()
  end

  function realWc3Api.GroupEnumUnitsOfType(whichGroup, unitname, filter)
    return GroupEnumUnitsOfType(whichGroup, unitname, filter)
  end

  function realWc3Api.GroupEnumUnitsOfPlayer(whichGroup, whichPlayer, filter)
    return GroupEnumUnitsOfPlayer(whichGroup, whichPlayer, filter)
  end

  function realWc3Api.GroupEnumUnitsOfTypeCounted(whichGroup, unitname, filter, countLimit)
    return GroupEnumUnitsOfTypeCounted(whichGroup, unitname, filter, countLimit)
  end

  function realWc3Api.GroupEnumUnitsInRect(whichGroup, r, filter)
    return GroupEnumUnitsInRect(whichGroup, r, filter)
  end

  function realWc3Api.GroupEnumUnitsInRectCounted(whichGroup, r, filter, countLimit)
    return GroupEnumUnitsInRectCounted(whichGroup, r, filter, countLimit)
  end

  function realWc3Api.GroupEnumUnitsInRange(whichGroup, x, y, radius, filter)
    return GroupEnumUnitsInRange(whichGroup, x, y, radius, filter)
  end

  function realWc3Api.GroupImmediateOrder(whichGroup, order)
    return GroupImmediateOrder(whichGroup, order)
  end

  function realWc3Api.IsUnitInRange(whichUnit, otherUnit, distance)
    return IsUnitInRange(whichUnit, otherUnit, distance)
  end

  function realWc3Api.GroupEnumUnitsInRangeCounted(whichGroup, x, y, radius, filter, countLimit)
    return GroupEnumUnitsInRangeCounted(whichGroup, x, y, radius, filter, countLimit)
  end

  function realWc3Api.GroupEnumUnitsSelected(whichGroup, whichPlayer, filter)
    return GroupEnumUnitsSelected(whichGroup, whichPlayer, filter)
  end

  function realWc3Api.GroupImmediateOrder(whichGroup, order)
    return GroupImmediateOrder(whichGroup, order)
  end

  function realWc3Api.GroupImmediateOrderById(whichGroup, order)
    return GroupImmediateOrderById(whichGroup, order)
  end

  function realWc3Api.GroupPointOrder(whichGroup, order, x, y)
    return GroupPointOrder(whichGroup, order, x, y)
  end

  function realWc3Api.GroupPointOrderById(whichGroup, order, x, y)
    return GroupPointOrderById(whichGroup, order, x, y)
  end

  function realWc3Api.GroupTargetOrderById(whichGroup, order, targetWidget)
    return GroupTargetOrderById(whichGroup, order, targetWidget)
  end

  function realWc3Api.ForGroup(whichGroup, callback)
    return ForGroup(whichGroup, callback)
  end

  function realWc3Api.FirstOfGroup(whichGroup)
    return FirstOfGroup(whichGroup)
  end

  function realWc3Api.IsUnitInRangeXY(whichUnit, x, y, distance)
    return IsUnitInRangeXY(whichUnit, x, y, distance)
  end

  function realWc3Api.GetUnitX(whichUnit)
    return GetUnitX(whichUnit)
  end

  function realWc3Api.GetUnitY(whichUnit)
    return GetUnitY(whichUnit)
  end

  function realWc3Api.GetUnitFacing(whichUnit)
    return GetUnitFacing(whichUnit)
  end

  function realWc3Api.GroupImmediateOrderById(whichGroup, order)
    return GroupImmediateOrderById(whichGroup, order)
  end

  function realWc3Api.GroupPointOrder(whichGroup, order, x, y)
    return GroupPointOrder(whichGroup, order, x, y)
  end

  function realWc3Api.GroupTargetOrderById(whichGroup, order, targetWidget)
    return GroupTargetOrderById(whichGroup, order, targetWidget)
  end

  function realWc3Api.GroupTargetOrder(whichGroup, order, targetWidget)
    return GroupTargetOrder(whichGroup, order, targetWidget)
  end

  function realWc3Api.Rect(minx, miny, maxx, maxy)
    return Rect(minx, miny, maxx, maxy)
  end

  function realWc3Api.RemoveRect(whichRect)
    return RemoveRect(whichRect)
  end

  function realWc3Api.SetRect(whichRect, minx, miny, maxx, maxy)
    return SetRect(whichRect, minx, miny, maxx, maxy)
  end

  function realWc3Api.GetRectCenterX(whichRect)
    return GetRectCenterX(whichRect)
  end

  function realWc3Api.GetRectCenterY(whichRect)
    return GetRectCenterY(whichRect)
  end

  function realWc3Api.GetRectMinX(whichRect)
    return GetRectMinX(whichRect)
  end

  function realWc3Api.GetRectMinY(whichRect)
    return GetRectMinY(whichRect)
  end

  function realWc3Api.GetRectMaxX(whichRect)
    return GetRectMaxX(whichRect)
  end

  function realWc3Api.GetRectMaxY(whichRect)
    return GetRectMaxY(whichRect)
  end

  function realWc3Api.CreateRegion()
    return CreateRegion()
  end

  function realWc3Api.RemoveRegion(whichRegion)
    return RemoveRegion(whichRegion)
  end

  function realWc3Api.RegionAddRect(whichRegion, r)
    return RegionAddRect(whichRegion, r)
  end

  function realWc3Api.GetWorldBounds()
    return GetWorldBounds()
  end

  function realWc3Api.PlayMusic(musicName)
    return PlayMusic(musicName)
  end

  function realWc3Api.PlayMusicEx(musicName, frommsecs, fadeinmsecs)
    return PlayMusicEx(musicName, frommsecs, fadeinmsecs)
  end

  function realWc3Api.StopMusic(fadeOut)
    return StopMusic(fadeOut)
  end

  function realWc3Api.ResumeMusic()
    return ResumeMusic()
  end

  function realWc3Api.PlayThematicMusic(musicFileName)
    return PlayThematicMusic(musicFileName)
  end

  function realWc3Api.PlayThematicMusicEx(musicFileName, frommsecs)
    return PlayThematicMusicEx(musicFileName, frommsecs)
  end

  function realWc3Api.EndThematicMusic()
    return EndThematicMusic()
  end

  function realWc3Api.SetCameraFieldForPlayer(whichPlayer, whichField, value, duration)
    return SetCameraFieldForPlayer(whichPlayer, whichField, value, duration)
  end

  function realWc3Api.MeleeStartingVisibility()
    return MeleeStartingVisibility()
  end

  function realWc3Api.MeleeStartingHeroLimit()
    return MeleeStartingHeroLimit()
  end

  function realWc3Api.MeleeGrantHeroItems()
    return MeleeGrantHeroItems()
  end

  function realWc3Api.MeleeVictoryDialogBJ(whichPlayer, leftGame)
    return MeleeVictoryDialogBJ(whichPlayer, leftGame)
  end

  function realWc3Api.CustomVictoryDialogBJ(whichPlayer)
    return CustomVictoryDialogBJ(whichPlayer)
  end

  return realWc3Api
end
--luacheck: pop

-- Hollow Arena

function map.UnitTests()
  local testFramework = map.TestFramework_Create()
  map.Wagons_Tests(testFramework)
  xpcall(testFramework.TestRunner, print)
end

function map.LaunchLua()
  -- print("Map Start")
  -- map.UnitTests()
  -- map.Game_Start()
  xpcall(map.HollowArena_Initialize, print)
  -- print("Map End")
end

map.UnitTests()



function Trig_LaunchLua_Actions()
    map.LaunchLua()
end

function InitTrig_LaunchLua()
gg_trg_LaunchLua = CreateTrigger()
TriggerAddAction(gg_trg_LaunchLua, Trig_LaunchLua_Actions)
end

function InitCustomTriggers()
InitTrig_LaunchLua()
end

function RunInitializationTriggers()
ConditionalTriggerExecute(gg_trg_LaunchLua)
end

function InitCustomPlayerSlots()
SetPlayerStartLocation(Player(0), 0)
SetPlayerColor(Player(0), ConvertPlayerColor(0))
SetPlayerRacePreference(Player(0), RACE_PREF_RANDOM)
SetPlayerRaceSelectable(Player(0), true)
SetPlayerController(Player(0), MAP_CONTROL_USER)
SetPlayerStartLocation(Player(1), 1)
SetPlayerColor(Player(1), ConvertPlayerColor(1))
SetPlayerRacePreference(Player(1), RACE_PREF_RANDOM)
SetPlayerRaceSelectable(Player(1), true)
SetPlayerController(Player(1), MAP_CONTROL_USER)
SetPlayerStartLocation(Player(2), 2)
SetPlayerColor(Player(2), ConvertPlayerColor(2))
SetPlayerRacePreference(Player(2), RACE_PREF_RANDOM)
SetPlayerRaceSelectable(Player(2), true)
SetPlayerController(Player(2), MAP_CONTROL_USER)
SetPlayerStartLocation(Player(3), 3)
SetPlayerColor(Player(3), ConvertPlayerColor(3))
SetPlayerRacePreference(Player(3), RACE_PREF_RANDOM)
SetPlayerRaceSelectable(Player(3), true)
SetPlayerController(Player(3), MAP_CONTROL_USER)
SetPlayerStartLocation(Player(4), 4)
SetPlayerColor(Player(4), ConvertPlayerColor(4))
SetPlayerRacePreference(Player(4), RACE_PREF_RANDOM)
SetPlayerRaceSelectable(Player(4), true)
SetPlayerController(Player(4), MAP_CONTROL_USER)
SetPlayerStartLocation(Player(5), 5)
SetPlayerColor(Player(5), ConvertPlayerColor(5))
SetPlayerRacePreference(Player(5), RACE_PREF_RANDOM)
SetPlayerRaceSelectable(Player(5), true)
SetPlayerController(Player(5), MAP_CONTROL_USER)
SetPlayerStartLocation(Player(6), 6)
SetPlayerColor(Player(6), ConvertPlayerColor(6))
SetPlayerRacePreference(Player(6), RACE_PREF_RANDOM)
SetPlayerRaceSelectable(Player(6), true)
SetPlayerController(Player(6), MAP_CONTROL_USER)
SetPlayerStartLocation(Player(7), 7)
SetPlayerColor(Player(7), ConvertPlayerColor(7))
SetPlayerRacePreference(Player(7), RACE_PREF_RANDOM)
SetPlayerRaceSelectable(Player(7), true)
SetPlayerController(Player(7), MAP_CONTROL_USER)
SetPlayerStartLocation(Player(8), 8)
SetPlayerColor(Player(8), ConvertPlayerColor(8))
SetPlayerRacePreference(Player(8), RACE_PREF_RANDOM)
SetPlayerRaceSelectable(Player(8), true)
SetPlayerController(Player(8), MAP_CONTROL_USER)
SetPlayerStartLocation(Player(9), 9)
SetPlayerColor(Player(9), ConvertPlayerColor(9))
SetPlayerRacePreference(Player(9), RACE_PREF_RANDOM)
SetPlayerRaceSelectable(Player(9), true)
SetPlayerController(Player(9), MAP_CONTROL_USER)
SetPlayerStartLocation(Player(10), 10)
SetPlayerColor(Player(10), ConvertPlayerColor(10))
SetPlayerRacePreference(Player(10), RACE_PREF_RANDOM)
SetPlayerRaceSelectable(Player(10), true)
SetPlayerController(Player(10), MAP_CONTROL_USER)
SetPlayerStartLocation(Player(11), 11)
SetPlayerColor(Player(11), ConvertPlayerColor(11))
SetPlayerRacePreference(Player(11), RACE_PREF_RANDOM)
SetPlayerRaceSelectable(Player(11), true)
SetPlayerController(Player(11), MAP_CONTROL_USER)
SetPlayerStartLocation(Player(20), 12)
ForcePlayerStartLocation(Player(20), 12)
SetPlayerColor(Player(20), ConvertPlayerColor(20))
SetPlayerRacePreference(Player(20), RACE_PREF_UNDEAD)
SetPlayerRaceSelectable(Player(20), false)
SetPlayerController(Player(20), MAP_CONTROL_COMPUTER)
SetPlayerStartLocation(Player(22), 13)
ForcePlayerStartLocation(Player(22), 13)
SetPlayerColor(Player(22), ConvertPlayerColor(22))
SetPlayerRacePreference(Player(22), RACE_PREF_UNDEAD)
SetPlayerRaceSelectable(Player(22), false)
SetPlayerController(Player(22), MAP_CONTROL_COMPUTER)
SetPlayerStartLocation(Player(23), 14)
ForcePlayerStartLocation(Player(23), 14)
SetPlayerColor(Player(23), ConvertPlayerColor(23))
SetPlayerRacePreference(Player(23), RACE_PREF_UNDEAD)
SetPlayerRaceSelectable(Player(23), false)
SetPlayerController(Player(23), MAP_CONTROL_COMPUTER)
end

function InitCustomTeams()
SetPlayerTeam(Player(0), 0)
SetPlayerTeam(Player(1), 0)
SetPlayerTeam(Player(2), 0)
SetPlayerTeam(Player(3), 0)
SetPlayerTeam(Player(4), 0)
SetPlayerTeam(Player(5), 0)
SetPlayerTeam(Player(6), 0)
SetPlayerTeam(Player(7), 0)
SetPlayerTeam(Player(8), 0)
SetPlayerTeam(Player(9), 0)
SetPlayerTeam(Player(10), 0)
SetPlayerTeam(Player(11), 0)
SetPlayerTeam(Player(20), 1)
SetPlayerState(Player(20), PLAYER_STATE_ALLIED_VICTORY, 1)
SetPlayerTeam(Player(22), 1)
SetPlayerState(Player(22), PLAYER_STATE_ALLIED_VICTORY, 1)
SetPlayerTeam(Player(23), 1)
SetPlayerState(Player(23), PLAYER_STATE_ALLIED_VICTORY, 1)
SetPlayerAllianceStateAllyBJ(Player(20), Player(22), true)
SetPlayerAllianceStateAllyBJ(Player(20), Player(23), true)
SetPlayerAllianceStateAllyBJ(Player(22), Player(20), true)
SetPlayerAllianceStateAllyBJ(Player(22), Player(23), true)
SetPlayerAllianceStateAllyBJ(Player(23), Player(20), true)
SetPlayerAllianceStateAllyBJ(Player(23), Player(22), true)
SetPlayerAllianceStateVisionBJ(Player(20), Player(22), true)
SetPlayerAllianceStateVisionBJ(Player(20), Player(23), true)
SetPlayerAllianceStateVisionBJ(Player(22), Player(20), true)
SetPlayerAllianceStateVisionBJ(Player(22), Player(23), true)
SetPlayerAllianceStateVisionBJ(Player(23), Player(20), true)
SetPlayerAllianceStateVisionBJ(Player(23), Player(22), true)
SetPlayerAllianceStateControlBJ(Player(20), Player(22), true)
SetPlayerAllianceStateControlBJ(Player(20), Player(23), true)
SetPlayerAllianceStateControlBJ(Player(22), Player(20), true)
SetPlayerAllianceStateControlBJ(Player(22), Player(23), true)
SetPlayerAllianceStateControlBJ(Player(23), Player(20), true)
SetPlayerAllianceStateControlBJ(Player(23), Player(22), true)
SetPlayerAllianceStateFullControlBJ(Player(20), Player(22), true)
SetPlayerAllianceStateFullControlBJ(Player(20), Player(23), true)
SetPlayerAllianceStateFullControlBJ(Player(22), Player(20), true)
SetPlayerAllianceStateFullControlBJ(Player(22), Player(23), true)
SetPlayerAllianceStateFullControlBJ(Player(23), Player(20), true)
SetPlayerAllianceStateFullControlBJ(Player(23), Player(22), true)
end

function InitAllyPriorities()
SetStartLocPrioCount(0, 1)
SetStartLocPrio(0, 0, 11, MAP_LOC_PRIO_HIGH)
SetStartLocPrioCount(1, 5)
SetStartLocPrio(1, 0, 2, MAP_LOC_PRIO_LOW)
SetStartLocPrio(1, 1, 8, MAP_LOC_PRIO_LOW)
SetStartLocPrio(1, 2, 9, MAP_LOC_PRIO_HIGH)
SetStartLocPrio(1, 3, 10, MAP_LOC_PRIO_HIGH)
SetStartLocPrio(1, 4, 11, MAP_LOC_PRIO_HIGH)
SetStartLocPrioCount(2, 3)
SetStartLocPrio(2, 0, 1, MAP_LOC_PRIO_LOW)
SetStartLocPrio(2, 1, 3, MAP_LOC_PRIO_HIGH)
SetStartLocPrio(2, 2, 9, MAP_LOC_PRIO_LOW)
SetStartLocPrioCount(3, 2)
SetStartLocPrio(3, 0, 2, MAP_LOC_PRIO_HIGH)
SetStartLocPrio(3, 1, 9, MAP_LOC_PRIO_HIGH)
SetStartLocPrioCount(4, 3)
SetStartLocPrio(4, 0, 5, MAP_LOC_PRIO_HIGH)
SetStartLocPrio(4, 1, 6, MAP_LOC_PRIO_HIGH)
SetStartLocPrio(4, 2, 7, MAP_LOC_PRIO_LOW)
SetStartLocPrioCount(5, 2)
SetStartLocPrio(5, 0, 4, MAP_LOC_PRIO_HIGH)
SetStartLocPrio(5, 1, 7, MAP_LOC_PRIO_LOW)
SetStartLocPrioCount(6, 2)
SetStartLocPrio(6, 0, 4, MAP_LOC_PRIO_LOW)
SetStartLocPrio(6, 1, 7, MAP_LOC_PRIO_HIGH)
SetStartLocPrioCount(7, 1)
SetStartLocPrio(7, 0, 6, MAP_LOC_PRIO_HIGH)
SetStartLocPrioCount(8, 2)
SetStartLocPrio(8, 0, 9, MAP_LOC_PRIO_HIGH)
SetStartLocPrio(8, 1, 10, MAP_LOC_PRIO_LOW)
SetStartLocPrioCount(9, 3)
SetStartLocPrio(9, 0, 1, MAP_LOC_PRIO_LOW)
SetStartLocPrio(9, 1, 3, MAP_LOC_PRIO_HIGH)
SetStartLocPrio(9, 2, 8, MAP_LOC_PRIO_HIGH)
SetStartLocPrioCount(10, 4)
SetStartLocPrio(10, 0, 1, MAP_LOC_PRIO_HIGH)
SetStartLocPrio(10, 1, 8, MAP_LOC_PRIO_HIGH)
SetStartLocPrio(10, 2, 9, MAP_LOC_PRIO_LOW)
SetStartLocPrio(10, 3, 11, MAP_LOC_PRIO_HIGH)
SetStartLocPrioCount(11, 3)
SetStartLocPrio(11, 0, 0, MAP_LOC_PRIO_HIGH)
SetStartLocPrio(11, 1, 1, MAP_LOC_PRIO_HIGH)
SetStartLocPrio(11, 2, 10, MAP_LOC_PRIO_HIGH)
SetStartLocPrioCount(12, 3)
SetStartLocPrio(12, 0, 0, MAP_LOC_PRIO_HIGH)
SetStartLocPrio(12, 1, 1, MAP_LOC_PRIO_LOW)
SetStartLocPrio(12, 2, 3, MAP_LOC_PRIO_LOW)
SetEnemyStartLocPrioCount(12, 4)
SetEnemyStartLocPrio(12, 0, 1, MAP_LOC_PRIO_HIGH)
SetEnemyStartLocPrio(12, 1, 2, MAP_LOC_PRIO_LOW)
SetEnemyStartLocPrio(12, 2, 3, MAP_LOC_PRIO_LOW)
SetEnemyStartLocPrio(12, 3, 13, MAP_LOC_PRIO_HIGH)
SetEnemyStartLocPrioCount(13, 6)
SetEnemyStartLocPrio(13, 0, 4, MAP_LOC_PRIO_LOW)
SetEnemyStartLocPrio(13, 1, 5, MAP_LOC_PRIO_LOW)
SetEnemyStartLocPrio(13, 2, 7, MAP_LOC_PRIO_LOW)
SetEnemyStartLocPrio(13, 3, 8, MAP_LOC_PRIO_LOW)
SetEnemyStartLocPrio(13, 4, 9, MAP_LOC_PRIO_LOW)
SetEnemyStartLocPrio(13, 5, 10, MAP_LOC_PRIO_LOW)
SetEnemyStartLocPrioCount(14, 1)
end

function main()
SetCameraBounds(-15616.0 + GetCameraMargin(CAMERA_MARGIN_LEFT), -15872.0 + GetCameraMargin(CAMERA_MARGIN_BOTTOM), 15616.0 - GetCameraMargin(CAMERA_MARGIN_RIGHT), 15360.0 - GetCameraMargin(CAMERA_MARGIN_TOP), -15616.0 + GetCameraMargin(CAMERA_MARGIN_LEFT), 15360.0 - GetCameraMargin(CAMERA_MARGIN_TOP), 15616.0 - GetCameraMargin(CAMERA_MARGIN_RIGHT), -15872.0 + GetCameraMargin(CAMERA_MARGIN_BOTTOM))
SetDayNightModels("Environment\\DNC\\DNCLordaeron\\DNCLordaeronTerrain\\DNCLordaeronTerrain.mdl", "Environment\\DNC\\DNCLordaeron\\DNCLordaeronUnit\\DNCLordaeronUnit.mdl")
NewSoundEnvironment("Default")
SetAmbientDaySound("BlackCitadelDay")
SetAmbientNightSound("BlackCitadelNight")
SetMapMusic("Music", true, 0)
InitSounds()
CreateRegions()
CreateAllItems()
CreateAllUnits()
InitBlizzard()
InitGlobals()
InitCustomTriggers()
RunInitializationTriggers()
end

function config()
SetMapName("TRIGSTR_001")
SetMapDescription("TRIGSTR_003")
SetPlayers(15)
SetTeams(15)
SetGamePlacement(MAP_PLACEMENT_TEAMS_TOGETHER)
DefineStartLocation(0, -6464.0, 4608.0)
DefineStartLocation(1, -6592.0, -5760.0)
DefineStartLocation(2, -11264.0, -12096.0)
DefineStartLocation(3, -6528.0, -14464.0)
DefineStartLocation(4, 7872.0, -6912.0)
DefineStartLocation(5, 11904.0, -6656.0)
DefineStartLocation(6, 6528.0, -10496.0)
DefineStartLocation(7, 9216.0, -11712.0)
DefineStartLocation(8, -128.0, -10816.0)
DefineStartLocation(9, -4160.0, -10752.0)
DefineStartLocation(10, -448.0, -5056.0)
DefineStartLocation(11, -2944.0, -640.0)
DefineStartLocation(12, 5632.0, 9152.0)
DefineStartLocation(13, 2944.0, 7616.0)
DefineStartLocation(14, 6464.0, 6784.0)
InitCustomPlayerSlots()
InitCustomTeams()
InitAllyPriorities()
end

