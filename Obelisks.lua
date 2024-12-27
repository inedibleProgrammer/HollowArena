function map.Obelisk_Create()
end


function map.ObeliskManager_Create()
end




function map.Obelisk_Tests(testFramework)
  testFramework.Suites.ObeliskSuite = {}
  testFramework.Suites.ObeliskSuite.Tests = {}
  local tsc = testFramework.Suites.ObeliskSuite

  function tsc.Setup() end
  function tsc.Teardown() end

  function tsc.Tests.ObeliskDummy()
  end
end
