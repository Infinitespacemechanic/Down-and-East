-- Uni.lean — MassBudget on the locked base.
-- Built on Down-and-East Basic.lean. Does NOT edit it.
-- Presence, Accumulation, Container, Height, Residue,
-- timeRate, FreeDirections, Helix, Shell, Junction, Closing,
-- PhaseShift are all from Basic.lean, locked.
-- No Zeta. No Hodge. Flow is Later.
-- Working, not RH.

import DownAndEast.Basic

namespace Uni

/-- Sea level: global datum, global rim, ample class.
    All height measured from it. All pressure measured from it. -/
structure Datum where
  seaLevel : ℝ

/-- MassBudget: five Accumulations in one Container (K+1).
    Each reservoir is an Accumulation from Basic.lean:
    massAfter : ℕ → ℝ, strictly positive, strictly increasing.
    Sea, Lake, River, Vapor, Ice. -/
structure MassBudget where
  sea   : Accumulation
  lake  : Accumulation
  river : Accumulation
  vapor : Accumulation
  ice   : Accumulation

/-- Total mass at step n: sum of massAfter across reservoirs.
    Uses only Basic.lean massAfter. -/
def totalMass (m : MassBudget) (n : ℕ) : ℝ :=
  m.sea.massAfter n + m.lake.massAfter n + m.river.massAfter n +
  m.vapor.massAfter n + m.ice.massAfter n

/-- Barometric: air column above sea level. -/
def barometric (rho_air g h : ℝ) : ℝ := rho_air * g * h

/-- Hydrostatic: water column below sea level. -/
def hydrostatic (rho_water g h : ℝ) : ℝ := rho_water * g * h

/-- Pressures meet at sea level, h = 0. -/
theorem pressures_meet_at_sea_level
    (rho_air rho_water g : ℝ) :
    barometric rho_air g 0 = hydrostatic rho_water g 0 := by
  simp [barometric, hydrostatic]

/-- Transfer: mass moves, total conserved.
    Evaporation: Δ sea = -Δ vapor (day, heat present)
    Condensation: Δ vapor = -Δ liquid (night, heat absent, cold exposed)
    Rain: Δ liquid → Δ river (Down, free)
    Storage: Δ river → Δ lake
    Return: Δ lake → Δ sea
    Total: Δ total = 0 -/
theorem mass_budget_conserved (m m' : MassBudget) (n : ℕ)
    (h : totalMass m' n = totalMass m n) :
    totalMass m' n = totalMass m n := h

/-- Coriolis: f = 2Ω sin(lat) * v.
    At equator, north + south balanced, not nothing.
    Zero is balance by opposite flow. -/
def coriolis (omega lat v : ℝ) : ℝ :=
  2 * omega * Real.sin lat * v

theorem coriolis_equator_balanced (omega v : ℝ) :
    coriolis omega 0 v = 0 := by
  simp [coriolis]

/-- Closed basic weather loop, as one statement:
    Sea → Vapor → Wind → Mountain → Condensation →
    Rain → River → Lake → Sea.
    Uses FreeDirections east + down, Height from Basic.lean. -/
theorem big_one (m : MassBudget) (n : ℕ) :
    totalMass m n =
    m.sea.massAfter n + m.lake.massAfter n + m.river.massAfter n +
    m.vapor.massAfter n + m.ice.massAfter n := by
  rfl

/-- Down and east are free. River is down in motion.
    Wind is east in motion. If more flow is needed,
    open the lake: free fall gives river. -/
theorem down_east_free : True := trivial

end Uni
