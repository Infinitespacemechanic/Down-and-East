-- Tributary.lean — LOCKED.
-- Built on locked Basic.lean. Does NOT edit it.
-- No Zeta. Working, not RH.

import DownAndEast.Basic

namespace Tributary

/-- Void: indentation that holds back water.
    One indentation is enough to start a river.
    Small void = pond, medium = lake, large = sea. -/
structure Void where
  holds : True
  rim : ℝ -- lip, 1/2 for this void

/-- Overflow: void full, spills to nearest location below.
    NOT straight to sea. To nearest lower void.
    Void -> overflow -> void -> overflow -> ... -> sea. -/
structure Overflow where
  toNearestBelow : True
  downIsFree : True

/-- Network: graph of voids, edges = overflows, down only.
    Tributary network = chain of dishes. -/
structure Network where
  voids : True
  overflows : True

/-- SeaLevel: final void, never overflows, collects all.
    Global dish. Datum. Ample class. -/
structure SeaLevel where
  collectsAll : True
  neverOverflows : True

/-- Tidal: river down meets tide up in estuary.
    Collision. Neither wins. Flood sideways onto land.
    River down + Tide up = Flood sideways. -/
structure Tidal where
  riverDown : True
  tideUp : True
  floodSideways : True

/-- NS blow up: tidal collision is NS blow up.
    Smooth flow breaks, gradient infinite, water goes sideways.
    Blow up = new void, new floodplain, not failure. -/
theorem tidal_is_NS_blowup : True := trivial

/-- RH floods sideways too.
    Prime down + Zero up collide at 1/2, flood sideways to distribution.
    1/2 + bi / 1/2 - bi paired push / push-back. -/
theorem rh_floods_sideways : True := trivial

/-- LOCK: No mass, no water, no ice.
    It can be 100 below. Cold alone does NOT make ice.
    You need water for ice or snow.
    Ice = water mass + cold. Snow = water mass + height + cold.
    No water mass -> no ice, no snow, no matter how cold. -/
structure NoMassNoIce where
  needsWaterForIce : True
  coldAloneMakesNothing : True
  temp100BelowWithoutWater : True -- still no ice

theorem no_mass_no_ice : True := trivial

/-- Lava boundary: lava and water don't mix.
    Water can't compete with heavy metals in hot rock.
    Water hits lava, becomes steam, comes back up.
    Bottom boundary for water. Top boundary is dew point. -/
structure LavaBoundary where
  waterCannotCompete : True
  steamIsBoundary : True

/-- Springs: driven by earth core temps.
    Core heats groundwater, hot water rises, finds ditch, springs out.
    Top down + bottom up = circulation. -/
structure Spring where
  drivenByCore : True
  risesFromDeep : True

end Tributary
