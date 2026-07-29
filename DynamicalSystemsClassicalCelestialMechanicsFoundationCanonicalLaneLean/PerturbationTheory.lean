import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsClassicalCelestialMechanicsFoundationCanonicalLaneLean

structure PerturbationSetup where
  unperturbedHamiltonian : Hamiltonian
  perturbation : Hamiltonian
  smallParameter : ℝ
  seriesConvergence : Prop
  secularTermsRemoved : Prop

def perturbation_closed (P : PerturbationSetup) : Prop :=
  P.seriesConvergence ∧ P.secularTermsRemoved

theorem perturbation_closed_iff (P : PerturbationSetup) : perturbation_closed P ↔ (P.seriesConvergence ∧ P.secularTermsRemoved) := by
  rfl

end DynamicalSystemsClassicalCelestialMechanicsFoundationCanonicalLaneLean
end HautevilleHouse