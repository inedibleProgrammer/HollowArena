function map.Wagons_Create(wc3api, players, commands, logging, editor)
  local wagons = {}
  wagons.list = {}

  local startRectInfo = {}
  startRectInfo.centerx = wc3api.GetRectCenterX(editor.startRect)
  startRectInfo.centery = wc3api.GetRectCenterY(editor.startRect)

  local wagonLog = {}
  wagonLog.type = logging.types.INFO

  function wagons.WagonBuildingAction()
    local function WagonBuildingAction2()
      -- GetTriggerUnit() returns the building instead of the builder BUG
      -- https://www.hiveworkshop.com/threads/how-to-get-building-unit.274883/
      local theBuilding = wc3api.GetConstructingStructure()
      local thePlayer = wc3api.GetTriggerPlayer()
      local playerName = wc3api.GetPlayerName(thePlayer)

      wc3api.BJDebugMsg("P1")

      for _,wagonData in pairs(wagons.list) do
        -- if(wagonData.built == true) then return end
        if(thePlayer == wagonData.playerref) then
          wc3api.BJDebugMsg("P2")
          if(wc3api.IsUnitInRange(wagonData.unit, theBuilding, 120)) then
            wc3api.BJDebugMsg("P3")
            local baseID = wc3api.GetUnitTypeId(theBuilding)
            local basex = wc3api.GetUnitX(theBuilding)
            local basey = wc3api.GetUnitY(theBuilding)
            local baseface = wc3api.GetUnitFacing(theBuilding)
            wc3api.RemoveUnit(theBuilding)
            wc3api.RemoveUnit(wagonData.unit)
            wagonData.unit = nil
            wc3api.CreateUnit(wagonData.playerref, baseID, basex, basey, baseface)
            wagonData.built = true

            wc3api.BJDebugMsg("P4")

            if baseID == wc3api.FourCC("htow") then
              wagonData.race = "human"
            elseif baseID == wc3api.FourCC("ogre") then
              wagonData.race = "orc"
            elseif baseID == wc3api.FourCC("unpl") then
              wagonData.race = "undead"
            elseif baseID == wc3api.FourCC("etol") then
              wagonData.race = "elf"
            end

            wc3api.BJDebugMsg("P5")


            wagonLog.message = playerName .. " builds town hall" .. " and is race " .. wagonData.race
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
    -- if(player.mapcontrol == wc3api.constants.MAP_CONTROL_USER and
       -- player.playerslotstate == wc3api.constants.PLAYER_SLOT_STATE_PLAYING) then

    if (player.playerslotstate == wc3api.constants.PLAYER_SLOT_STATE_PLAYING) then
      if(player.id < 12) then
        MakeWagon(player)
      end
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
  p1.id = 0
  local p2 = {}
  p2.ref = "p2ref"
  p2.id = 1
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
