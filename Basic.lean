import Mathlib.Data.Real.Basic
import Mathlib.Analysis.SpecialFunctions.Trigonometric.Basic
import Mathlib.Data.Nat.Basic

/- ========== FUNDAMENTALS: 1-12, working, not RH ========== -/

/-- The 1. Presence. The center that stays. -/
structure Presence where
  center : ℝ × ℝ
  deriving Repr

/-- The 2. Mass accumulation. Always positive, always increasing. -/
structure Accumulation where
  massAfter : ℕ → ℝ
  massPositive : ∀ n, 0 < massAfter n
  massIncreasing : ∀ n, massAfter n < massAfter (n + 1)

/-- K + 1. Container with the witness inside it. -/
structure Container (K : ℕ) where
  presence : Presence
  accumulation : Accumulation

/-- Height is radius. Height after n closings is mass after n closings. -/
def heightAfter (acc : Accumulation) (n : ℕ) : ℝ :=
  acc.massAfter n

/-- Residue. Every reaction leaves at least a residue. Never zero, always greater than. -/
structure Residue where
  amount : ℝ
  positive : 0 < amount

/-- Time as resistance. Always greater than zero. -/
structure TimeResistance where
  resistance : ℝ
  resistancePositive : 0 < resistance

/-- Time passes at one second per second for the mass at hand. -/
def timeRate : ℝ := 1

theorem time_one_per_one (t : ℝ) : t + 1 = t + timeRate := by rfl

/-- Two free directions. Down and east, at the same time, forever. Benefits, not work. -/
structure FreeDirections where
  east : ℝ
  down : ℝ

def compose (v : FreeDirections) : ℝ × ℝ :=
  (v.east, v.down)

/-- Trochoid from the two free directions. -/
def trochoid (R r d t : ℝ) : ℝ × ℝ :=
  ( (R - r) * Real.cos t + d * Real.cos ((R - r) / r * t)
  , (R - r) * Real.sin t - d * Real.sin ((R - r) / r * t) )

/-- Helix. Forward march plus spin. One mass, two outputs, same direction. -/
def helix (R ω vForward t : ℝ) : ℝ × ℝ × ℝ :=
  ( R * Real.cos (ω * t)
  , R * Real.sin (ω * t)
  , vForward * t )

theorem helix_height_per_second {R ω vForward t : ℝ} :
    (helix R ω vForward (t + 1)).2.2 = (helix R ω vForward t).2.2 + vForward * timeRate := by
  simp [helix, timeRate]
  ring

/-- Shells. No need to go beyond 12. Carry the container. 3k, 6k, 9k, 12k. -/
def shell (k : ℕ) : ℕ :=
  12 * k

/-- Wall every 24, plus 2 to the next shell. -/
def shellIndex (n : ℕ) : ℕ :=
  24 * n + 2

/-- Junction. Same position, different times, with residue. Middle shared at the ends. -/
structure Junction where
  t₁ t₂ : ℝ
  timeDifferent : t₁ ≠ t₂
  pos : ℝ × ℝ
  residue : Residue

/-- Closing. Never returns to the same place. Every closing makes height. -/
structure Closing where
  before : ℝ × ℝ
  after : ℝ × ℝ
  placeDifferent : before ≠ after
  height : ℝ
  heightPositive : 0 < height

/-- Phase shift for figure-eight timing. Three bodies, same curve, offset by T / 3. -/
def phaseShift (T : ℝ) (k : Fin 3) (t : ℝ) : ℝ :=
  t - (k : ℝ) * T / 3
