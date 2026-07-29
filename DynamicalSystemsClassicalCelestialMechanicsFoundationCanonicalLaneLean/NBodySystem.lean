import DynamicalSystemsClassicalCelestialMechanicsFoundationCanonicalLaneLean.RiemannianCurvature
import Mathlib.Data.Real.Basic

/-!
# N-Body System Package
-/

namespace HautevilleHouse
namespace DynamicalSystemsClassicalCelestialMechanicsFoundationCanonicalLaneLean

structure NBodySystemPackage (G : RiemannianCurvaturePackage) where
  numBodies : Nat
  masses : Vector ℝ numBodies
  positions : Vector (Vector ℝ 3) numBodies
  velocities : Vector (Vector ℝ 3) numBodies
  equationsOfMotion : Prop
  centerOfMassFixed : Prop

structure NBodySystemEvidence {G : RiemannianCurvaturePackage} (S : NBodySystemPackage G) where
  equationsOfMotionClosed : S.equationsOfMotion
  centerOfMassFixedClosed : S.centerOfMassFixed

def NBodySystemClosed {G : RiemannianCurvaturePackage} (S : NBodySystemPackage G) : Prop :=
  S.equationsOfMotion ∧ S.centerOfMassFixed

theorem nbody_system_closed_from_evidence
    {G : RiemannianCurvaturePackage} (S : NBodySystemPackage G)
    (E : NBodySystemEvidence S) : NBodySystemClosed S := by
  exact And.intro E.equationsOfMotionClosed E.centerOfMassFixedClosed

end DynamicalSystemsClassicalCelestialMechanicsFoundationCanonicalLaneLean
end HautevilleHouse