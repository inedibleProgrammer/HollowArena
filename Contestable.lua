--[[
  A contestable region is a region where a resource is given to
  whichever player has the most number of units for 10 consecutive
  seconds in the region

  -- NOTE: when making a contestable region, make sure exactly one
     unit is in the region in the editor.
]]



function map.Contestable_Create(wc3api, editor)
  local contestable = {}
  contestable.list = {}

  -- Go through all rects and set them up
  for _,crect in pairs(editor.contestableRects) do
    local cinfo = {}
    cinfo.unitCount = 0
    local function setupCrect()
      cinfo.unitCount = cinfo.unitCount + 1
      -- The unit is the contestable unit
      cinfo.cUnit = wc3api.GetTriggerUnit()
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

    table.insert(contestable.list, cinfo)
    wc3api.DestroyGroup(cinfo.g)
    cinfo.g = nil
  end

  local function periodicContestable()
    local function periodicContestable2()
      for _, cinfo in pairs(contestable.list) do
        print("hello")
      end
    end
    xpcall(periodicContestable2, print)
  end

  -- Initialize the periodic trigger to update contestables
  contestable.periodicTrigger = wc3api.CreateTrigger()
  wc3api.TriggerAddAction(contestable.periodicTrigger, periodicContestable)
  wc3api.TriggerRegisterTimerEvent(contestable.periodicTrigger, 1.0, wc3api.constants.IS_PERIODIC)

  return contestable
end

function map.Contestable_Tests(testFramework)
  testFramework.Suites.ContestableSuite = {}
  testFramework.Suites.ContestableSuite.Tests = {}
  local tsc = testFramework.Suites.ContestableSuite
  local wc3api = {}
  local editor = {}

  function tsc.Setup()
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
  end

  function tsc.Teardown() end

  function tsc.Tests.MoreThanOneUnitInRegionChecked()
    editor.contestableRects.crect1 = "crect1"
    editor.contestableRects.crect2 = "crect2"
    wc3api.ForGroup = function(p1, p2)
      p2()
      p2()
    end

    local contestable = map.Contestable_Create(wc3api, editor)

    for _, cinfo in pairs(contestable.list) do
      assert(cinfo.error == true)
    end

  end

  function tsc.Tests.MakeSomethingContestable()
    local contestable = map.Contestable_Create(wc3api, editor)
    
  end
end
