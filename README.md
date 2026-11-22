# Uni — Closed Basic Weather Loop

Working, not RH. Foundation locked. Flow is Later.

## The loop, in one line

**Sea → Vapor → Wind → Mountain → Condensation → Rain → River → Lake → Sea**

Closed. No leak. Total mass conserved.

## Mass budget transfer

M_total = M_sea + M_lake + M_river + M_vapor + M_ice = constant

- Evaporation: ΔM_sea = -ΔM_vapor — day, heat present, vapor rises
- Condensation: ΔM_vapor = -ΔM_liquid — night, heat absent, cold exposed, vapor falls
- Rain: ΔM_liquid → ΔM_river — down, free fall
- Storage: ΔM_river → ΔM_lake — valley pools, hydrostatic holds
- Return: ΔM_lake → ΔM_sea — river drains to sea
- Total: ΔM_total = 0

Mass moves between reservoirs. Mass never leaves the dish.

## Datum: Sea level

Sea level is the global lake, the global rim, the ample class.
All height measured from sea level. All pressure measured from sea level.
Barometric above sea level, hydrostatic below sea level, they meet at sea level.
P_baro = ρ_air * g * h. P_hydro = ρ_water * g * h. Same g, same h, different ρ.

## Down + East are free

Down is free fall. East is free drift. Benefits, not work.
River is down in motion. Wind is east in motion.
If more flow is needed, open the lake: free fall gives river.

## Height makes condensation

Flat earth: wind blows, nothing happens. Gas dissipates.
Mountain: wind hits height, rises, cools, hits dew point, condenses, rains.
Windward side wet, leeward side dry. Rain shadow.
Every closing makes height. Height is radius. Height is the layer of the onion.
Hills and valleys are the dish, not flat.

## Counter-spin boundary: most active on earth

North spin meets south spin at the equator. +bi meets -bi.
Coriolis is not zero. Coriolis is balanced by opposite flow.
North + South = 0 at the equator, but 0 is balance, not nothing.
Opposite flows converge, pile up, have nowhere to go but up.
Up → cool → dew point → condense → rain.
That's the ITCZ. That's why the boundary is the most active.

## Day / Night

Day: heat present, vapor rises, east.
Night: heat absent, cold exposed, vapor falls, dew.
Absence of heat exposes cold. Cold condenses vapor.
Dew is heaviest just before dawn — coldest moment, heat most absent.

## Hodge, in this loop

Earth = variety X, solid, K.
Gas mass = Hodge class, diffuse, drifting east as a (k,k) current.
Wind = flow east on currents.
Height = Morse / Kähler potential, mountains.
Friction = Kähler metric resisting flow.
Vortex = current concentrates.
Dew point = current becomes supported on algebraic subvariety.
Hodge cycle = locked vortex.

Flow spec (Flow.lean, Later):
1. Class conserved
2. (k,k) preserved
3. Orbit bounded, NOT identity
4. Condenses to algebraic support

If Flow exists → Hodge. If Hodge false → Flow cannot exist.
Grok-confirmed well-posed and equivalent via Demailly.

## Files

- Down-and-East Basic.lean — LOCKED foundation
- WATER.lean v2 — closed state, real rotation, not identity, no sorrys
- Uni.lean — assembly, closed weather loop, mass budget
- Flow.lean — Later spec, flow on currents, conditional only
- README — this loop

Working, not RH.
