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

## Watershed — NEW
Ridge = height function. Basin = all rain drains to same river/lake/sea.
Divide: rain on one side → this basin, other side → that basin.
Same storm, same mountain, two seas. Continental Divide: west → Pacific, east → Atlantic.
Equator: north → north ITCZ, south → south ITCZ.
Hodge: one side → algebraic, other side → topological.
Watershed is where Flow decides. Height splits flow, dew point locks it, sea level collects it.

## What else do we need
- [x] Locked base — Basic.lean
- [x] MassBudget — Uni.lean, total conserved, tested 1180
- [x] Sea level datum — ample class
- [x] Height / mountain / dew point — condensation
- [x] Counter-spin boundary — north + south balanced
- [x] Day / Night — heat present / heat absent exposes cold
- [x] Lake + River — storage + flow, free fall
- [x] Watershed — Watershed.lean, ridge splits flow
- [x] Cloud — Cloud.lean, vapor → cloud → rain, up/down, charge, saturation, lapse
- [x] Energy — Cloud.lean, Sun in, Day heat present, Night heat absent exposes cold
- [x] Groundwater — Cloud.lean, infiltration, aquifer holds, returns to river
- [x] Ice / Snowpack — Cloud.lean, Snow is height, frozen storage, melts in spring
- [ ] Tributary network — branching: small streams → river, tree, not yet
- [ ] Flow for (1,1) — first real Flow theorem, divisors as watersheds, Lefschetz, not yet proved
- [ ] Flow for general (k,k) — Later, open, equivalent to Hodge

## Cloud — NEW
Cloud = mass that likes up/down. Updraft lifts drops, downdraft drops them, collisions make static.
Top positive ions, bottom negative, ground down. Lightning = discharge.
Saturation makes cloud, cloud base = dew point height.
Lapse: colder further up, less mass to heat during day.
Snow is height: water stored at height, frozen, river later.

## Tributary + Flow — LOCKED
Tributary: Void holds, Overflow to nearest below, Network = chain of dishes, SeaLevel collects all.
Tidal: river down + tide up = flood sideways. NS blow up = tidal collision. RH floods sideways too.
LOCK: No mass, no water, no ice. It can be 100 below. Cold alone does NOT make ice. You need water for ice or snow.
Lava boundary: lava and water don't mix, water can't compete with heavy metals in hot rock, steam is boundary.
Springs: driven by earth core temps, rise from deep, top down + bottom up = circulation.
Flow (1,1): Divisors as watersheds, Lefschetz, 4 properties for k=1. Flow general (k,k) = Later, open, equivalent to Hodge.

## Files
- Basic.lean — LOCKED (in repo)
- Uni.lean — MassBudget, first construction
- Flow.lean — Later spec, second construction
- README.md — this loop
