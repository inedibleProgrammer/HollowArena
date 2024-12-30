function map.GameState_Create()
  local gamestate = {}

  gamestate.unitSteroidCounter = 0
  gamestate.terrorSpawnCount = 1
  gamestate.terrorSpawnPeriod = 5
  gamestate.obeliskSpawnPeriod = 60
  gamestate.terrorLevel = 0
  gamestate.terrorUpgradePeriod = 180

  return gamestate
end
