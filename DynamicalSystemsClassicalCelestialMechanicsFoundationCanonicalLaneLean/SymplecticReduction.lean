import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicalSystemsClassicalCelestialMechanicsFoundationCanonicalLaneLean.HamiltonianMechanics

namespace HautevilleHouse
namespace DynamicalSystemsClassicalCelestialMechanicsFoundationCanonicalLaneLean

structure SymplecticReductionPackage {H : HamiltonianMechanicsPackage} where
  groupAction : Type u
  momentumMap : H.phaseSpace → ℝ
  reducedPhaseSpace : Type v
  reducedSymplecticForm : Type w
  reductionTheorem : Prop

structure SymplecticReductionEvidence {H : HamiltonianMechanicsPackage}
    (S : SymplecticReductionPackage H) where
  reductionTheoremClosed : S.reductionTheorem

def SymplecticReductionClosed {H : HamiltonianMechanicsPackage}
    (S : SymplecticReductionPackage H) : Prop :=
  S.reductionTheorem

theorem symplectic_reduction_closed_from_evidence {H : HamiltonianMechanicsPackage}
    (S : SymplecticReductionPackage H) (E : SymplecticReductionEvidence S) :
    SymplecticReductionClosed S := by
  exact E.reductionTheoremClosed

end DynamicalSystemsClassicalCelestialMechanicsFoundationCanonicalLaneLean
end HautevilleHouse