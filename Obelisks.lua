function map.Obelisk_Create(x, y, player, wc3api, terror)
  local obelisk = {}

  function obelisk.Update()
    
  end

  obelisk.u = wc3api.CreateUnit(player, wc3api.FourCC("nico"), x, y, 0)
  wc3api.BlzSetUnitMaxHp(obelisk.u, wc3api.constants.UNIT_STATE_LIFE, 500)
  wc3api.PingMinimapEx(x, y, 5, 255, 0, 0, false)

  return obelisk
end


function map.ObeliskManager_Create(wc3api, gamestate, editor, triggers, terror)
  local obeliskManager = {}
  obeliskManager.UPDATE_PERIOD = 1.0
  obeliskManager.list = {}
  obeliskManager.counter = 0
  obeliskManager.currentTerror = 1

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
      if(obeliskManager.counter == 5) then
        obeliskManager.counter = 0

        local obeliskRect = GetRandomRect()
        local point = GetRandomPointInRect(obeliskRect)
        local terrorPlayer = wc3api.Player(editor.terrors[obeliskManager.currentTerror].playerID)

        local obelisk = map.Obelisk_Create(point.x, point.y, terrorPlayer, wc3api, terror)

        obeliskManager.currentTerror = obeliskManager.currentTerror + 1
      end

      -- Check each obelisk
      for _, obelisk in pairs(obeliskManager.list) do
        obelisk.Update()
      end
      obeliskManager.counter = obeliskManager.counter + 1



      if(obeliskManager.currentTerror > 4) then
        obeliskManager.currentTerror = 1
      end
    end
    xpcall(HandleObelisks2, print)
  end

  obeliskManager.periodicTrigger = triggers.CreatePeriodicTrigger(obeliskManager.UPDATE_PERIOD, HandleObelisks)

  return obeliskManager
end




function map.Obelisk_Tests(testFramework)
  testFramework.Suites.ObeliskSuite = {}
  testFramework.Suites.ObeliskSuite.Tests = {}
  local tsc = testFramework.Suites.ObeliskSuite

  local wc3api = {}

  function tsc.Setup() end
  function tsc.Teardown() end

  function tsc.Tests.ObeliskCreated()

    -- local obelisk = map.Obelisk_Create(0, 0, player, wc3api)
  end
end
