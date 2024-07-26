function map.HollowArena_Initialize()
  local game = {}
  local wc3api = map.RealWc3Api_Create()
  local colors = map.Colors_Create()
  local utility = map.Utility_Create()
  local commands = map.Commands_Create(wc3api)
  local clock = map.Clock_Create()
  local authenticatedNames = {"WorldEdit", "MasterLich#11192", "MagicDoor#1685"}
  local players = map.Players_Create(wc3api, commands, colors, authenticatedNames)
  local gameClock = map.GameClock_Create(wc3api, clock, commands, players)
  local logging = map.Logging_Create(wc3api, gameClock, commands, players)
  local unitManager = map.UnitManager_Create(wc3api, logging, commands)
  local editor = map.Editor_Create()
  local debugTools = map.DebugTools_Create(wc3api, logging, players, commands, utility, colors)

  game.worldEdit = players.GetPlayerByName("WorldEdit")
  logging.SetPlayerOptionByID(game.worldEdit.id, logging.types.ALL)

  local gameStatusLog = {}
  gameStatusLog.type = logging.types.INFO
  gameStatusLog.message = "Game Start"
  logging.Write(gameStatusLog)


  local wagons = map.Wagons_Create(wc3api, players, commands, logging, editor)
end

