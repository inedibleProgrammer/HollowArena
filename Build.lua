Build = {}
Build.Combined = "Combined.lua"

MAP_VERSION = "Alpha"

Build.SourceFiles = {
  "HollowArena.lua",
  "Editor.lua",
  "Wagons.lua",
  "../Wc3Tools/Commands.lua",
  "../Wc3Tools/TestFramework.lua",
  "../Wc3Tools/RealWc3Api.lua",
  "../Wc3Tools/Utility.lua",
  "../Wc3Tools/GameClock.lua",
  "../Wc3Tools/Clock.lua",
  "../Wc3Tools/Players.lua",
  "../Wc3Tools/Logging.lua",
  "../Wc3Tools/DebugTools.lua",
  "../Wc3Tools/UnitManager.lua",
  "../Wc3Tools/Colors.lua",
  "LaunchLua.lua", -- Must be last
}

function createMapFile()
  local mapFileContents = "map = {}\n"
  local mapVersion = "map.version = " .. "\"" .. MAP_VERSION .. "\"\n"

  local handle = io.popen("git rev-parse HEAD")
  local gitCommit = handle:read("*l")
  handle:close()

  local gitString = "map.commit = " .. "\"" .. gitCommit .. "\"\n"

  map_file_contents = mapFileContents .. mapVersion .. gitString
  return mapFileContents
end

function main()
  local combined = io.open(Build.Combined, "w")
  combined:close()

  local combined = io.open(Build.Combined, "w+")

  local mapFileContents = createMapFile()
  combined:write(mapFileContents)

  for k1, filename in pairs(Build.SourceFiles) do
    file = io.open(filename, "r")
    fileContents = file:read("*a")
    combined:write(fileContents)
    file:close()
  end
  combined:close()
end

main()
