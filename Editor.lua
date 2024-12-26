--luacheck: push ignore

-- Interface between the scripting code and the wc3 editor
function map.Editor_Create()
  local editor = {}
  editor.contestableRects = {}

  editor.startRect = gg_rct_startRect
  editor.wormwoodRect = gg_rct_wormwoodRect
  editor.wormwoodPlayerID = 20

  editor.contestedShipyardRect1 = gg_rct_contestedShipyardRect1
  editor.contestedShipyardRect2 = gg_rct_contestedShipyardRect2
  editor.contestedShipyardRect3 = gg_rct_contestedShipyardRect3
  editor.contestedShipyardRect4 = gg_rct_contestedShipyardRect4
  editor.contestedShipyardRect5 = gg_rct_contestedShipyardRect5
  editor.contestedShipyardRect6 = gg_rct_contestedShipyardRect6
  editor.contestedShipyardRect7 = gg_rct_contestedShipyardRect7
  editor.contestedShipyardRect8 = gg_rct_contestedShipyardRect8
  editor.contestedShipyardRect9 = gg_rct_contestedShipyardRect9
  editor.contestedShipyardRect10 = gg_rct_contestedShipyardRect10
  table.insert(editor.contestableRects, editor.contestedShipyardRect1)
  table.insert(editor.contestableRects, editor.contestedShipyardRect2)
  table.insert(editor.contestableRects, editor.contestedShipyardRect3)
  table.insert(editor.contestableRects, editor.contestedShipyardRect4)
  table.insert(editor.contestableRects, editor.contestedShipyardRect5)
  table.insert(editor.contestableRects, editor.contestedShipyardRect6)
  table.insert(editor.contestableRects, editor.contestedShipyardRect7)
  table.insert(editor.contestableRects, editor.contestedShipyardRect8)
  table.insert(editor.contestableRects, editor.contestedShipyardRect9)
  table.insert(editor.contestableRects, editor.contestedShipyardRect10)



  return editor
end

--luacheck: pop
