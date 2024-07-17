-- Hollow Arena

function map.UnitTests()
  local testFramework = map.TestFramework_Create()
  xpcall(testFramework.TestRunner, print)
end

function map.LaunchLua()
  print("Map Start")
  -- map.UnitTests()
  map.Game_Start()
  print("Map End")
end

map.UnitTests()


