function map.Terror_Create(editor, wc3api)
end



function map.Terror_Tests(testFramework)
  testFramework.Suites.TerrorSuite = {}
  testFramework.Suites.TerrorSuite.Tests = {}
  local tsc = testFramework.Suites.TerrorSuite

  local wc3api = {}

  function tsc.Setup() end
  function tsc.Teardown() end

  function tsc.Tests.TerrorCreated()
    
  end

end

--[[
function map.Terror_Create(wc3api, findTarget)
  local terror = {}
  terror.STATES = {
    IDLE = 1,
    ATTACKING_PLAYER = 2,
  }
  terror.state = terror.STATES.IDLE

  function terror.Spawn(playerID, unitID, x, y)
    terror.u = wc3api.CreateUnit(wc3api.Player(playerID), wc3api.FourCC(unitID), x, y, 0)
  end

  function terror.Update()
    if terror.state == terror.STATES.IDLE then
      -- Find target and attack
      local target = findTarget()
      wc3api.IssuePointOrder(terror.u, "attack", wc3api.GetUnitX(target), wc3api.GetUnitY(target))
      terror.state = terror.STATES.ATTACKING_PLAYER
    elseif terror.state == terror.STATES.ATTACKING_PLAYER then
      if wc3api.GetUnitCurrentOrder(terror.u) ~= 851983 then
        terror.state = terror.STATES.IDLE
      end
      -- TODO: If in range of gate, attack the gate
    end
  end

  return terror
end

--]]
