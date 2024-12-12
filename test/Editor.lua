--luacheck: push ignore

-- Interface between the scripting code and the wc3 editor
function map.Editor_Create()
  local editor = {}

  editor.TestRegion1 = gg_rct_TestRegion1

  return editor
end

--luacheck: pop
