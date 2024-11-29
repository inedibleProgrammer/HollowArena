--luacheck: push ignore

-- Interface between the scripting code and the wc3 editor
function map.Editor_Create()
  local editor = {}

  editor.contestableRects = {}

  editor.startRect = gg_rct_startRect
  editor.wormwoodRect = gg_rct_wormwoodRect
  editor.wormwoodPlayerID = 20

  editor.contestedShipyardRect1 = gg_rct_contestedShipyardRect1

  table.insert(editor.contestableRects, editor.contestedShipyardRect1)



  return editor
end

--luacheck: pop
