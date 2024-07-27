function map.StartingResources_Create(wc3api, players)
  local startingResources = {}

  local function GiveResourcesToAllPlayers()
    local function GiveResourcesToAllPlayers2()
      for _,player in pairs(players.list) do
        wc3api.SetPlayerState(player.ref, wc3api.constants.PLAYER_STATE_RESOURCE_GOLD, 2000)
        wc3api.SetPlayerState(player.ref, wc3api.constants.PLAYER_STATE_RESOURCE_LUMBER, 2000)
      end
    end
    xpcall(GiveResourcesToAllPlayers2, print)
  end

  local startingResourcesTrigger = wc3api.CreateTrigger()
  wc3api.TriggerAddAction(startingResourcesTrigger, GiveResourcesToAllPlayers)

  wc3api.TriggerExecute(startingResourcesTrigger)

  wc3api.DestroyTrigger(startingResourcesTrigger)

  return startingResources
end
