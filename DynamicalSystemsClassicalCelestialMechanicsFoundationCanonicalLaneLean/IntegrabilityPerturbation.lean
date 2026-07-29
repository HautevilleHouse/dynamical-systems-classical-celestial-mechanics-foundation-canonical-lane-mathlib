import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicalSystemsClassicalCelestialMechanicsFoundationCanonicalLaneLean.HamiltonianMechanics

namespace HautevilleHouse
namespace DynamicalSystemsClassicalCelestialMechanicsFoundationCanonicalLaneLean

structure IntegrabilityPerturbationPackage {H : HamiltonianMechanicsPackage} where
  integrableSystem : Prop
  perturbationParameter : ℝ
  kamoConditions : Prop
  invariantToriPersistence : Prop

structure IntegrabilityPerturbationEvidence {H : HamiltonianMechanicsPackage}
    (I : IntegrabilityPerturbationPackage H) where
  integrableSystemClosed : I.integrableSystem
  kamoConditionsClosed : I.kamoConditions
  invariantToriPersistenceClosed : I.invariantToriPersistence

def IntegrabilityPerturbationClosed {H : HamiltonianMechanicsPackage}
    (I : IntegrabilityPerturbationPackage H) : Prop :=
  I.integrableSystem ∧ I.kamoConditions ∧ I.invariantToriPersistence

theorem integrability_perturbation_closed_from_evidence {H : HamiltonianMechanicsPackage}
    (I : IntegrabilityPerturbationPackage H) (E : IntegrabilityPerturbationEvidence I) :
    IntegrabilityPerturbationClosed I := by
  exact And.intro E.integrableSystemClosed
    (And.intro E.kamoConditionsClosed E.invariantToriPersistenceClosed)

end DynamicalSystemsClassicalCelestialMechanicsFoundationCanonicalLaneLean
end HautevilleHouse