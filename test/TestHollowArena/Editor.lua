--luacheck: push ignore

-- Interface between the scripting code and the wc3 editor
function map.Editor_Create()
  local editor = {}

  editor.TestRegion1 = gg_rct_TestRegion1
  editor.TestRegion2 = gg_rct_TestRegion2

  return editor
end

--luacheck: pop
