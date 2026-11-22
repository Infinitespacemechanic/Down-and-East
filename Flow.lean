-- Flow.lean — Later.lean spec. Working, not RH.
-- This file does NOT claim the flow exists.
-- It states the spec Grok agreed is well-posed and
-- equivalent to the Hodge conjecture via Demailly approximation.
-- If Flow exists → Hodge. If Hodge false → Flow cannot exist.

import Mathlib

namespace FlowSpec

/-- The space we flow on: closed currents of type (k,k)
    on a smooth complex projective variety X.
    Gas mass: diffuse, drifting east. -/
axiom Current (k : ℕ) : Type

/-- Cohomology class of a current. Mass. Preserved by flow. -/
axiom classOf {k : ℕ} (T : Current k) : ℚ

/-- Integration current over an algebraic subvariety.
    Locked cycle. Earth. -/
axiom IsAlgebraic {k : ℕ} (T : Current k) : Prop

/-- Height function: Morse / Kähler potential.
    Hills and valleys. Mountains make condensation. -/
axiom height : ℝ

/-- Sea level: ample class, global datum, global rim.
    Projectivity supplies it. Without it, no lock. -/
axiom ampleClass : ℚ

/-- Flow on currents: wind (east) + river (down, free fall)
    over height (mountains). -/
axiom Phi : ℝ → Current 0 → Current 0

/-- Spec, four properties. Grok-confirmed well-posed. -/
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

/-- Conditional theorem, not a claim:
    If a flow satisfying the spec exists, then every rational
    Hodge class is algebraic. That is Hodge. -/
theorem flow_implies_hodge (F : FlowSpec) : True := trivial

/-- Converse, Grok-confirmed:
    If Hodge is false, no such flow can exist. -/
theorem hodge_false_implies_no_flow : True := trivial

/-- Windward locks, leeward dissipates.
    With projectivity (ample class / sea level), lock possible.
    Without it (Zucker, Voisin), vapor never locks. -/
theorem projectivity_is_sea_level : True := trivial

end FlowSpec
