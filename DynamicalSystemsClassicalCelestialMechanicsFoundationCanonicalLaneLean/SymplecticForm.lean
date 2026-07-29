import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsClassicalCelestialMechanicsFoundationCanonicalLaneLean

structure PhaseSpace (n : Nat) where
  positions : ℝ ^ n
  momenta : ℝ ^ n

structure SymplecticForm (n : Nat) where
  matrix : Matrix (ℝ ^ (2*n)) (ℝ ^ (2*n)) ℝ
  nondegenerate : Prop
  closed : Prop
  nondegenerateClosed : nondegenerate
  closedCondition : closed

def canonicalSymplecticMatrix (n : Nat) : Matrix (ℝ ^ (2*n)) (ℝ ^ (2*n)) ℝ :=
  Matrix.blockDiagonal (Matrix.fromBlocks (0 : Matrix (ℝ^n) (ℝ^n) ℝ) (1 : Matrix (ℝ^n) (ℝ^n) ℝ) (-1 : Matrix (ℝ^n) (ℝ^n) ℝ) (0 : Matrix (ℝ^n) (ℝ^n) ℝ))

theorem canonical_symplectic_nondegenerate (n : Nat) :
  (canonicalSymplecticMatrix n).det ≠ 0 := by
  sorry

definition symplecticTwoForm (n : Nat) (p : PhaseSpace n) : (ℝ ^ (2*n)) × (ℝ ^ (2*n)) → ℝ := λ (u, v) =>
  u ⬝ (canonicalSymplecticMatrix n).toLinearMap v

theorem symplectic_two_form_closed (n : Nat) (p : PhaseSpace n) :
  (symplecticTwoForm n p).closed := by
  sorry

end DynamicalSystemsClassicalCelestialMechanicsFoundationCanonicalLaneLean
end HautevilleHouse