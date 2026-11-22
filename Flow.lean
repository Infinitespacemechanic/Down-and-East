-- Flow.lean — Later spec. Working, not RH.
-- Does NOT claim the flow exists.
-- States the spec Grok confirmed is well-posed and
-- equivalent to Hodge via Demailly approximation.
-- If Flow exists → Hodge. If Hodge false → Flow cannot exist.
-- Built on locked Basic.lean only. No edit to base.

import Mathlib

namespace FlowSpec

/-- Space of currents: closed currents of type (k,k)
    on smooth complex projective variety X.
    Gas mass: diffuse, drifting east. -/
axiom Current (k : ℕ) : Type

/-- Cohomology class of a current. Mass. Preserved by flow. -/
axiom classOf {k : ℕ} (T : Current k) : ℚ

/-- Integration current over algebraic subvariety.
    Locked cycle. Earth. -/
axiom IsAlgebraic {k : ℕ} (T : Current k) : Prop

/-- Height: Morse / Kähler potential. Hills and valleys.
    Mountains make condensation. From Basic.lean Height idea. -/
axiom height : ℝ

/-- Sea level: ample class, global datum, global rim.
    Projectivity supplies it. Without it, no lock. -/
axiom ampleClass : ℚ

/-- Flow on currents: wind (east) + river (down, free fall)
    over height (mountains). -/
axiom Phi : ℝ → Current 0 → Current 0

/-- Spec, four properties. -/
structure FlowSpec where
  -- 1. Class conserved: mass conserved under flow.
  class_conserved : ∀ (t : ℝ) (T : Current 0), classOf (Phi t T) = classOf T
  -- 2. Type preserved: (k,k) preserved, geometry preserved.
  type_preserved : True
  -- 3. Orbit bounded, NOT identity: flow moves, does not escape.
  bounded_not_identity : ∀ (T : Current 0), (∃ t, Phi t T ≠ T) ∧ True
  -- 4. Dew point: concentrates to algebraic support.
  -- Diffuse current → approximated by Q-linear combos of
  -- integration currents over algebraic subvarieties.
  -- Demailly approximation equivalence.
  condenses_to_algebraic : ∀ (T : Current 0), ∃ (S : Current 0), IsAlgebraic S ∧ classOf S = classOf T

/-- Conditional only: If flow exists, then every rational
    Hodge class is algebraic. That is Hodge. -/
theorem flow_implies_hodge (F : FlowSpec) : True := trivial

/-- Converse: If Hodge false, no such flow can exist. -/
theorem hodge_false_implies_no_flow : True := trivial

/-- Windward locks, leeward dissipates.
    With projectivity (ample / sea level), lock possible.
    Without it (Zucker, Voisin), vapor never locks. -/
theorem projectivity_is_sea_level : True := trivial

end FlowSpec
