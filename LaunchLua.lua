-- Hollow Arena

function map.UnitTests()
  local testFramework = map.TestFramework_Create()
  map.Wagons_Tests(testFramework)
  map.Contestable_Tests(testFramework)
  map.Obelisk_Tests(testFramework)
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


