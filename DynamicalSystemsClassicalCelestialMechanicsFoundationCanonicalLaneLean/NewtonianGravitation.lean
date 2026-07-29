import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsClassicalCelestialMechanicsFoundationCanonicalLaneLean

structure NewtonianGravitationPackage where
  gravitationalConstant : ℝ
  massDistribution : Type u
  potentialFunction : massDistribution → ℝ
  inverseSquareLaw : Prop
  superPositionPrinciple : Prop

structure NewtonianGravitationEvidence (N : NewtonianGravitationPackage) where
  inverseSquareLawClosed : N.inverseSquareLaw
  superPositionPrincipleClosed : N.superPositionPrinciple

def NewtonianGravitationClosed (N : NewtonianGravitationPackage) : Prop :=
  N.inverseSquareLaw ∧ N.superPositionPrinciple

theorem newtonian_gravitation_closed_from_evidence (N : NewtonianGravitationPackage)
    (E : NewtonianGravitationEvidence N) : NewtonianGravitationClosed N := by
  exact And.intro E.inverseSquareLawClosed E.superPositionPrincipleClosed

end DynamicalSystemsClassicalCelestialMechanicsFoundationCanonicalLaneLean
end HautevilleHouse