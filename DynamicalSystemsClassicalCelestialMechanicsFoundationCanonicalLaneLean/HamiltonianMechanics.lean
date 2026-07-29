import DynamicalSystemsClassicalCelestialMechanicsFoundationCanonicalLaneLean.KeplerTwoBody

/-!
# Hamiltonian Mechanics Package
-/

namespace HautevilleHouse
namespace DynamicalSystemsClassicalCelestialMechanicsFoundationCanonicalLaneLean

structure HamiltonianMechanicsPackage {G : RiemannianCurvaturePackage}
    {S : NBodySystemPackage G} {K : KeplerTwoBodyPackage S} where
  phaseSpace : Type u
  symplecticForm : Type v
  hamiltonianFunction : Type w
  canonicalEquations : Prop
  poissonStructure : Prop

structure HamiltonianMechanicsEvidence {G : RiemannianCurvaturePackage}
    {S : NBodySystemPackage G} {K : KeplerTwoBodyPackage S}
    (H : HamiltonianMechanicsPackage G S K) where
  canonicalEquationsClosed : H.canonicalEquations
  poissonStructureClosed : H.poissonStructure

def HamiltonianMechanicsClosed {G : RiemannianCurvaturePackage}
    {S : NBodySystemPackage G} {K : KeplerTwoBodyPackage S}
    (H : HamiltonianMechanicsPackage G S K) : Prop :=
  H.canonicalEquations ∧ H.poissonStructure

theorem hamiltonian_mechanics_closed_from_evidence
    {G : RiemannianCurvaturePackage} {S : NBodySystemPackage G}
    {K : KeplerTwoBodyPackage S} (H : HamiltonianMechanicsPackage G S K)
    (E : HamiltonianMechanicsEvidence H) : HamiltonianMechanicsClosed H := by
  exact And.intro E.canonicalEquationsClosed E.poissonStructureClosed

end DynamicalSystemsClassicalCelestialMechanicsFoundationCanonicalLaneLean
end HautevilleHouse