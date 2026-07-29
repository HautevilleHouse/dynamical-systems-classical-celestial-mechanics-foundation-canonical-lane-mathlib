import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicalSystemsClassicalCelestialMechanicsFoundationCanonicalLaneLean.CelestialNBodySystem

namespace HautevilleHouse
namespace DynamicalSystemsClassicalCelestialMechanicsFoundationCanonicalLaneLean

structure KeplerProblem (C : CelestialNBodySystem) where
  centralMassIndex : Fin C.bodyCount
  secondaryMassIndex : Fin C.bodyCount
  centralMassIndexNeSecondary : centralMassIndex ≠ secondaryMassIndex
  reducedMass : ℝ
  semiMajorAxis : ℝ
  eccentricity : ℝ
  orbitalPeriod : ℝ

structure KeplerEvidence {C : CelestialNBodySystem} (K : KeplerProblem C) where
  reducedMassPositive : K.reducedMass > 0
  semiMajorAxisPositive : K.semiMajorAxis > 0
  eccentricityNonnegative : 0 ≤ K.eccentricity
  eccentricityLessThanOne : K.eccentricity < 1
  orbitalPeriodPositive : K.orbitalPeriod > 0

def KeplerClosed {C : CelestialNBodySystem} (K : KeplerProblem C) : Prop :=
  K.reducedMass > 0 ∧ K.semiMajorAxis > 0 ∧ (0 ≤ K.eccentricity ∧ K.eccentricity < 1) ∧ K.orbitalPeriod > 0

theorem kepler_closed_from_evidence {C : CelestialNBodySystem} (K : KeplerProblem C) (E : KeplerEvidence K) : KeplerClosed K := by
  exact And.intro E.reducedMassPositive (And.intro E.semiMajorAxisPositive (And.intro (And.intro E.eccentricityNonnegative E.eccentricityLessThanOne) E.orbitalPeriodPositive))

end DynamicalSystemsClassicalCelestialMechanicsFoundationCanonicalLaneLean
end HautevilleHouse