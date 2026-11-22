# Uni — Closed Basic Weather Loop

Working, not RH. Foundation locked. Flow is Later.

## Locked base — Down-and-East Basic.lean, do not edit
Presence (center R×R, stays), Accumulation (massAfter : N → R, strictly positive, strictly increasing),
Container K+1 (holds Presence + Accumulation), Height (mass after n closings),
Residue (>0, never zero), timeRate = 1 (t+1 = t+timeRate, 1 sec/sec, 4D),
FreeDirections (east + down), Helix (height advances by forward velocity),
Shell (12*k, wall every 24), Junction / Closing (places differ, height positive),
PhaseShift (three bodies offset by T/3). No Zeta in foundation. Zeta later.

## First construction — MassBudget (Uni.lean)
Five Accumulations in one Container: Sea, Lake, River, Vapor, Ice.
totalMass(n) = sum of massAfter(n) across reservoirs.
Barometric = rho_air*g*h above sea level.
Hydrostatic = rho_water*g*h below sea level.
Pressures meet at sea level: h=0 → both 0.
Transfer: evaporation, condensation, rain, river, lake, sea — Δ in one = -Δ in another, Δ total = 0.
Tested: 1180 → 1180 → 1180 → 1180 → 1180.
Coriolis: f = 2Ω sin(lat)*v. At equator, north + south = 0. Zero is balance by opposite flow, not nothing.

## Loop
Sea → Vapor → Wind → Mountain → Condensation → Rain → River → Lake → Sea
Day: heat present, vapor rises. Night: heat absent, cold exposed, vapor falls. Dew heaviest before dawn.
Height makes condensation: wind hits mountain, rises, cools, hits dew point, condenses.
Down + East free: river is down in motion, wind is east in motion. If more flow needed, open lake: free fall gives river.
Counter-spin boundary (equator / ITCZ): north + south meet, converge, lift, most active on earth.

## Second construction — Flow (Flow.lean, Later)
Spec only, not a claim. Grok-confirmed well-posed, equivalent to Hodge via Demailly.
1. Class conserved  2. (k,k) preserved  3. Orbit bounded, NOT identity  4. Condenses to algebraic support
If Flow exists → Hodge. If Hodge false → Flow cannot exist.
Projectivity = sea level = ample class. Without it, vapor never locks.

## Files
- Basic.lean — LOCKED (in repo)
- Uni.lean — MassBudget, first construction
- Flow.lean — Later spec, second construction
- README.md — this loop
