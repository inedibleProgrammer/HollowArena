function map.Contestable_Create(wc3api, editor)
  local contestable = {}
  contestable.list = {}

  for _,crect in pairs(editor.contestableRects) do
    local function setupCrect()
      
    end
    local cinfo = {}
    cinfo.g = wc3api.CreateGroup()
    wc3api.GroupEnumUnitsInRect(cinfo.g, crect, wc3api.constants.NO_FILTER)
    wc3api.ForGroup(cinfo.g, setupCrect)

    table.insert(contestable.list, cinfo)
    wc3api.DestroyGroup(cinfo.g)
    cinfo.g = nil
  end


  return contestable
end

function map.Contestable_Tests(testFramework)
  testFramework.Suites.ContestableSuite = {}
  testFramework.Suites.ContestableSuite.Tests = {}
  local tsc = testFramework.Suites.ContestableSuite
  local wc3api = {}
  local editor = {}
  editor.contestableRects = {}
  editor.contestableRects.crect1 = "crect1"
  editor.contestableRects.crect2 = "crect2"

  function tsc.Setup() end
  function tsc.Teardown() end

  function tsc.Tests.MakeSomethingContestable()
    local contestable = map.Contestable_Create(wc3api, editor)
    
  end
end
