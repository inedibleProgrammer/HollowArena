--luacheck: push ignore

-- Interface between the scripting code and the wc3 editor
function map.Editor_Create()
  local editor = {}
  editor.contestableRects = {}

  editor.startRect = gg_rct_startRect

  editor.TestRegion1 = gg_rct_TestRegion1
  editor.TestRegion2 = gg_rct_TestRegion2

  editor.contestedShipyard1 = gg_rct_contestedShipyard1
  table.insert(editor.contestableRects, editor.contestedShipyard1)

  return editor
end

--luacheck: pop
