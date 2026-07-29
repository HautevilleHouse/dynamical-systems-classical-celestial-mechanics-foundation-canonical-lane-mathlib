import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsClassicalCelestialMechanicsFoundationCanonicalLaneLean

structure ConfigurationSpace (n : Nat) where
  coordinates : ℝ ^ n
  velocities : ℝ ^ n

structure Lagrangian (n : Nat) where
  kineticEnergy : ℝ ^ n → ℝ
  potentialEnergy : ℝ ^ n → ℝ
  lagrangian : ℝ ^ n → ℝ ^ n → ℝ := λ q v => kineticEnergy v - potentialEnergy q

def computeEulerLagrange (n : Nat) (L : ℝ ^ n → ℝ ^ n → ℝ) : (ℝ ^ n → ℝ ^ n) := λ q =>
  let partialQ := Finsupp.fderiv (λ q' => L q' 0) q
  let partialQDot := Finsupp.fderiv (λ v => L q v) 0
  λ t => partialQ - (Finsupp.fderiv (λ t' => partialQDot) t)

theorem lagrangian_implies_newton (m : ℝ) (q : ℝ → ℝ) (force : ℝ → ℝ) (h : m * derivative q '' (λ t => derivative q t) = force) :
  False := by
  sorry

end DynamicalSystemsClassicalCelestialMechanicsFoundationCanonicalLaneLean
end HautevilleHouse