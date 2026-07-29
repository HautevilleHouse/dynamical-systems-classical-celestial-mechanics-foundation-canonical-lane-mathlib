import DynamicalSystemsClassicalCelestialMechanicsFoundationCanonicalLaneLean.NBodySystem

/-!
# Kepler Two-Body Package
-/

namespace HautevilleHouse
namespace DynamicalSystemsClassicalCelestialMechanicsFoundationCanonicalLaneLean

structure KeplerTwoBodyPackage {G : RiemannianCurvaturePackage}
    (S : NBodySystemPackage G) where
  reducedMass : Prop
  relativePosition : Vector ℝ 3
  relativeVelocity : Vector ℝ 3
  orbitTypeConic : Prop
  conservedQuantities : Prop

structure KeplerTwoBodyEvidence {G : RiemannianCurvaturePackage}
    {S : NBodySystemPackage G} (K : KeplerTwoBodyPackage S) where
  orbitTypeConicClosed : K.orbitTypeConic
  conservedQuantitiesClosed : K.conservedQuantities

def KeplerTwoBodyClosed {G : RiemannianCurvaturePackage}
    {S : NBodySystemPackage G} (K : KeplerTwoBodyPackage S) : Prop :=
  K.orbitTypeConic ∧ K.conservedQuantities

theorem kepler_two_body_closed_from_evidence
    {G : RiemannianCurvaturePackage} {S : NBodySystemPackage G}
    (K : KeplerTwoBodyPackage S) (E : KeplerTwoBodyEvidence K) :
    KeplerTwoBodyClosed K := by
  exact And.intro E.orbitTypeConicClosed E.conservedQuantitiesClosed

end DynamicalSystemsClassicalCelestialMechanicsFoundationCanonicalLaneLean
end HautevilleHouse