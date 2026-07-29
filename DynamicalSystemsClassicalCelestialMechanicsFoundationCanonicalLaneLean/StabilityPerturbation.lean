import DynamicalSystemsClassicalCelestialMechanicsFoundationCanonicalLaneLean.HamiltonianMechanics

/-!
# Stability and Perturbation Package
-/

namespace HautevilleHouse
namespace DynamicalSystemsClassicalCelestialMechanicsFoundationCanonicalLaneLean

structure StabilityPerturbationPackage {G : RiemannianCurvaturePackage}
    {S : NBodySystemPackage G} {K : KeplerTwoBodyPackage S}
    {H : HamiltonianMechanicsPackage G S K} where
  perturbationParameter : Type u
  kamiltonianExpansion : Prop
  stabilityCriteria : Prop
  secularTermsControlled : Prop

structure StabilityPerturbationEvidence {G : RiemannianCurvaturePackage}
    {S : NBodySystemPackage G} {K : KeplerTwoBodyPackage S}
    {H : HamiltonianMechanicsPackage G S K}
    (P : StabilityPerturbationPackage G S K H) where
  kamiltonianExpansionClosed : P.kamiltonianExpansion
  stabilityCriteriaClosed : P.stabilityCriteria
  secularTermsControlledClosed : P.secularTermsControlled

def StabilityPerturbationClosed {G : RiemannianCurvaturePackage}
    {S : NBodySystemPackage G} {K : KeplerTwoBodyPackage S}
    {H : HamiltonianMechanicsPackage G S K}
    (P : StabilityPerturbationPackage G S K H) : Prop :=
  P.kamiltonianExpansion ∧ P.stabilityCriteria ∧ P.secularTermsControlled

theorem stability_perturbation_closed_from_evidence
    {G : RiemannianCurvaturePackage} {S : NBodySystemPackage G}
    {K : KeplerTwoBodyPackage S} {H : HamiltonianMechanicsPackage G S K}
    (P : StabilityPerturbationPackage G S K H)
    (E : StabilityPerturbationEvidence P) : StabilityPerturbationClosed P := by
  exact And.intro E.kamiltonianExpansionClosed
    (And.intro E.stabilityCriteriaClosed E.secularTermsControlledClosed)

end DynamicalSystemsClassicalCelestialMechanicsFoundationCanonicalLaneLean
end HautevilleHouse