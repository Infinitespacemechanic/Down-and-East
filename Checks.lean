import One12.Basic

/-- Check: shell 0 is 2, shell 1 is 26, shell 2 is 50. -/
theorem shellIndex_zero : shellIndex 0 = 2 := by rfl
theorem shellIndex_one : shellIndex 1 = 26 := by rfl
theorem shellIndex_two : shellIndex 2 = 50 := by rfl

/-- Check: 365 days at 50 tons a day is 18,250 tons. -/
theorem dust_year : 365 * 50 = 18250 := by norm_num

theorem helix_not_closed {R ω vForward t T : ℝ} (hv : vForward ≠ 0)
    (hT : T = 2 * Real.pi / ω) (hω : ω ≠ 0) :
    helix R ω vForward t ≠ helix R ω vForward (t + T) := by
  intro h
  have hz : vForward * t = vForward * (t + T) := by
    simpa [helix] using congrArg (fun p : ℝ × ℝ × ℝ => p.2.2) h
  have hTpos : T ≠ 0 := by
    rw [hT]
    exact div_ne_zero (mul_ne_zero (by norm_num) Real.pi_ne_zero) hω
  have : vForward * T = 0 := by linarith
  exact hv (eq_zero_of_mul_eq_zero this |>.resolve_right hTpos)

def exampleJunction : Junction :=
  { t₁ := 0
    t₂ := Real.pi
    timeDifferent := by
      simp only [ne_eq]
      exact ne_of_gt Real.pi_pos |>.symm
    pos := trochoid 1 0.5 0.5 0
    residue := { amount := 2, positive := by norm_num } }
