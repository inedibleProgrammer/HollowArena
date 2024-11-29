--[[
  The third angel blew his trumpet, and a great star fell from heaven,
  blazing like a torch, and it fell on a third of the rivers and on
  the springs of water.  The name of the star is Wormwood.  A third of
  the waters became wormwood, and many died from the water, because it
  was made bitter.  (Rev 8:10-11)
-- ]]

function map.Wormwood_Create(wc3api, editor, players)
  local wormwood = {}

  local wormwoodRectInfo = {}
  wormwoodRectInfo.centerx = wc3api.GetRectCenterX(editor.wormwoodRect)
  wormwoodRectInfo.centery = wc3api.GetRectCenterY(editor.wormwoodRect)

  wormwood.player = players.GetPlayerByID(editor.wormwoodPlayerID)

  wormwood.unit = wc3api.CreateUnit(wormwood.player.ref,
                                    wc3api.FourCC("nbal"),
                                    wormwoodRectInfo.centerx,
                                    wormwoodRectInfo.centery,
                                    270.0)


  wc3api.BlzSetUnitName(wormwood.unit, "Wormwood")
  wc3api.BlzSetUnitMaxHP(wormwood.unit, 100000)
  wc3api.SetUnitState(wormwood.unit, wc3api.constants.UNIT_STATE_LIFE, 100000.0)
  wc3api.BlzSetUnitRealField(wormwood.unit, wc3api.constants.UNIT_RF_HIT_POINTS_REGENERATION_RATE, 10)
  wc3api.BlzSetUnitBaseDamage(wormwood.unit, 500, wc3api.constants.WEAPON_INDEX_GROUND)
  wc3api.BlzSetUnitBaseDamage(wormwood.unit, 500, wc3api.constants.WEAPON_INDEX_AIR)
  wc3api.BlzSetUnitArmor(wormwood.unit, 150)
  wc3api.SetUnitScale(wormwood.unit, 2.0, 0.0, 0.0)
  wc3api.SetUnitVertexColor(wormwood.unit, 100, 100, 100, 255)

  local function WormwoodDiesAction()
    -- https://www.hiveworkshop.com/threads/best-way-to-detect-if-a-unit-is-dead-or-not.269052/
    local function WormwoodDiesAction2()
      local deadUnit = wc3api.GetDyingUnit()
      -- if(wc3api.IsUnitType(wormwood.unit, wc3api.constants.UNIT_TYPE_DEAD)) then
      if(deadUnit == wormwood.unit) then
        for _,player in pairs(players.list) do
          wc3api.CustomVictoryDialogBJ(player.ref)
        end
      else
        print("nothing")
      end
    end
    xpcall(WormwoodDiesAction2, print)
  end

  local wormwoodDeadTrigger = wc3api.CreateTrigger()
  wc3api.TriggerRegisterPlayerUnitEvent(wormwoodDeadTrigger,
                                        wormwood.player.ref,
                                        wc3api.constants.EVENT_PLAYER_UNIT_DEATH,
                                        wc3api.constants.NO_FILTER)
  wc3api.TriggerAddAction(wormwoodDeadTrigger, WormwoodDiesAction)

  return wormwood
end
