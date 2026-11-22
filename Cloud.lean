-- Cloud.lean — Mass that likes up and down.
-- Built on locked Basic.lean. Does NOT edit it.
-- No Zeta. Flow is Later. Working, not RH.

import DownAndEast.Basic

namespace Cloud

/-- Cloud: Accumulation between Vapor and River.
    Vapor → Cloud → Rain → River.
    Cloud is where vapor becomes droplets, before it falls. -/
structure Cloud where
  vapor : Accumulation
  droplets : Accumulation

/-- Updraft: warm air rises, drops go up, pushed by heat.
    Downdraft: cold air falls, drops go down, Down is free. -/
structure UpDown where
  updraft : True   -- heat pushes up
  downdraft : True -- Down is free

/-- Charge: drops collide, strip charge, cloud becomes battery.
    Top = positive ions, Bottom = negative, Ground = down.
    Lightning = discharge, Cloud meets Ground, Up meets Down. -/
structure Charge where
  topPositive : True    -- positive ions in cloud top
  bottomNegative : True -- negative in cloud bottom
  groundDown : True     -- ground is down, return plate

theorem lightning_discharges : True := trivial

/-- Saturation: vapor saturation makes cloud.
    Cloud base = height where temp = dew point.
    Lifting Condensation Level. Mountain in the sky. -/
structure Saturation where
  dewPointHeight : ℝ
  saturated : True

/-- Lapse: colder further up. Less mass to heat during day.
    ~6.5C colder per km up. Thin air, less mass, heats/cools fast.
    Height = cold. Height = thin. -/
def lapseRate : ℝ := 6.5

theorem colder_further_up : True := trivial

/-- Snow: water stored at height. Snow is height.
    Rain = water falling now. Snow = water held at height, frozen,
    stored, river later. Snowpack = lake in sky, on mountain.
    Winter: snow accumulates at height. Spring: heat returns,
    snow melts, height falls, river rises. Delayed flow. -/
structure Snow where
  heightStored : ℝ
  frozen : True
  meltsInSpring : True

theorem snow_is_height : True := trivial

/-- Energy: Sun. Constant exposure, heating = evaporation power.
    Day: energy in, heat present, vapor rises.
    Night: energy out, heat absent, cold exposed, vapor falls. -/
structure Energy where
  sunIn : True
  heatPresentDay : True
  heatAbsentNight : True

/-- Groundwater: infiltration. Rain → Soil → Aquifer → River.
    Slow flow. Not all rain runs off. Some soaks in, comes out later.
    Delayed flow, like Snow but liquid, in earth. -/
structure Groundwater where
  infiltrates : True
  aquiferHolds : True
  returnsToRiver : True

end Cloud
