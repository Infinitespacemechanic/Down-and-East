-- Flow.lean — LOCKED SPEC for (1,1), Later for general (k,k).
-- Built on locked Basic.lean. Does NOT edit it.
-- Working, not RH. Spec only for general case.

import DownAndEast.Basic

namespace Flow

/-- Flow for (1,1): Divisors as watersheds.
    First real Flow. Lefschetz.
    Divisors = watersheds, Flow = overflow chain. -/
structure Flow11 where
  divisorsAreWatersheds : True
  lefschetz : True
  -- 4 properties, for k=1:
  classConserved : True
  kkPreserved : True
  orbitBoundedNotIdentity : True
  condensesToAlgebraic : True

theorem flow11_spec : True := trivial

/-- Flow for general (k,k): Later, open, equivalent to Hodge.
    If Flow exists -> Hodge. If Hodge false -> Flow cannot exist.
    Projectivity = sea level = ample class. Without it, vapor never locks.
    DO NOT CLAIM IT EXISTS. -/
structure FlowGeneral where
  later : True
  openProblem : True

/-- Geometry managing mass.
    Dish, void, overflow, collision, sea.
    Solve once in water, find analogs in primes, Hodge, NS. -/
theorem geometry_manages_mass : True := trivial

end Flow
