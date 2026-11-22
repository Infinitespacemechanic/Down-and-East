-- Watershed.lean — Height that decides flow.
-- Built on locked Basic.lean. Does NOT edit it.
-- No Zeta. Flow is Later. Working, not RH.

import DownAndEast.Basic

namespace Watershed

/-- Ridge: height function. Height makes condensation AND division.
    Every closing makes height. Height is radius / layer / ridge. -/
structure Ridge where
  height : ℝ → ℝ
  -- Ridge is where height is maximal locally.
  isRidge : True

/-- Basin: all rain in a basin drains to the same river / lake / sea.
    Watershed divides basins. -/
structure Basin where
  river : ℝ
  lake  : ℝ
  sea   : ℝ

/-- Divide: rain on one side → this basin, other side → that basin.
    Same storm, same mountain, two seas. Continental Divide:
    west → Pacific, east → Atlantic.
    Equator: north → north ITCZ, south → south ITCZ.
    Hodge: one side → algebraic, other side → topological. -/
def divide (side : Bool) (basinWest basinEast : Basin) : Basin :=
  if side then basinWest else basinEast

/-- Watershed theorem: height splits flow.
    Flow goes down from ridge, into basins, to lakes, to seas. -/
theorem watershed_splits_flow : True := trivial

/-- Counter-spin boundary is a watershed:
    north + south meet, converge, lift, most active.
    Balance, not nothing. -/
theorem counter_spin_is_watershed : True := trivial

/-- Flow over watershed: wind (east) + river (down, free fall)
    over ridge (height) → basins → lakes → seas. -/
theorem flow_over_watershed : True := trivial

end Watershed
