import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicalSystemsClassicalCelestialMechanicsFoundationCanonicalLaneLean.CelestialNBodySystem

namespace HautevilleHouse
namespace DynamicalSystemsClassicalCelestialMechanicsFoundationCanonicalLaneLean

structure NBodyDynamics (C : CelestialNBodySystem) where
  equationsOfMotion : Type
  gravitationalConstant : ℝ
  forceLaw : Prop
  energyConservation : Prop
  angularMomentumConservation : Prop

structure NBodyDynamicsEvidence {C : CelestialNBodySystem} (D : NBodyDynamics C) where
  gravitationalConstantPositive : D.gravitationalConstant > 0
  forceLawClosed : D.forceLaw
  energyConservationClosed : D.energyConservation
  angularMomentumConservationClosed : D.angularMomentumConservation

def NBodyDynamicsClosed {C : CelestialNBodySystem} (D : NBodyDynamics C) : Prop :=
  D.gravitationalConstant > 0 ∧ D.forceLaw ∧ D.energyConservation ∧ D.angularMomentumConservation

theorem n_body_dynamics_closed_from_evidence {C : CelestialNBodySystem} (D : NBodyDynamics C) (E : NBodyDynamicsEvidence D) : NBodyDynamicsClosed D := by
  exact And.intro E.gravitationalConstantPositive (And.intro E.forceLawClosed (And.intro E.energyConservationClosed E.angularMomentumConservationClosed))

end DynamicalSystemsClassicalCelestialMechanicsFoundationCanonicalLaneLean
end HautevilleHouse