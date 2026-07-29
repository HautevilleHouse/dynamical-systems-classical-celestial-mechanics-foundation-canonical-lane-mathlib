import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsClassicalCelestialMechanicsFoundationCanonicalLaneLean

structure TwoBodySystem where
  m1 : ℝ
  m2 : ℝ
  position1 : ℝ × ℝ × ℝ
  position2 : ℝ × ℝ × ℝ
  velocity1 : ℝ × ℝ × ℝ
  velocity2 : ℝ × ℝ × ℝ

structure KeplerOrbit where
  semiMajorAxis : ℝ
  eccentricity : ℝ
  inclination : ℝ
  longitudeAscendingNode : ℝ
  argumentPeriapsis : ℝ
  trueAnomaly : ℝ

open Real

def orbitEnergy (m1 m2 : ℝ) (orbit : KeplerOrbit) : ℝ :=
  let G := 1.0
  let mu := m1 + m2
  -G * mu / (2 * orbit.semiMajorAxis)

def orbitPeriod (m1 m2 : ℝ) (orbit : KeplerOrbit) : ℝ :=
  let G := 1.0
  let mu := m1 + m2
  2 * π * Real.sqrt (orbit.semiMajorAxis^3 / (G * mu))

theorem kepler_third_law (m1 m2 : ℝ) (orbit : KeplerOrbit) (h : orbit.semiMajorAxis > 0) :
  (orbitPeriod m1 m2 orbit) ^ 2 = (4 * π ^ 2) * (orbit.semiMajorAxis ^ 3) / (m1 + m2) := by
  simp [orbitPeriod, orbit.semiMajorAxis]

end DynamicalSystemsClassicalCelestialMechanicsFoundationCanonicalLaneLean
end HautevilleHouse