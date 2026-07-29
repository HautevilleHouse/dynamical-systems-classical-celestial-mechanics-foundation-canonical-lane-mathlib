import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsClassicalCelestialMechanicsFoundationCanonicalLaneLean

structure ThreeBodySystem where
  masses : Type u
  positions : masses -> Type v
  velocities : masses -> Type w
  gravitationalConstant : Prop
  newtonEquations : Prop
  centerOfMassFixed : Prop
  angularMomentumConserved : Prop
  energyConserved : Prop

structure ThreeBodyEvidence (S : ThreeBodySystem) where
  gravitationalConstantClosed : S.gravitationalConstant
  newtonEquationsClosed : S.newtonEquations
  centerOfMassFixedClosed : S.centerOfMassFixed
  angularMomentumConservedClosed : S.angularMomentumConserved
  energyConservedClosed : S.energyConserved

def ThreeBodyClosed (S : ThreeBodySystem) : Prop :=
  S.gravitationalConstant ∧ S.newtonEquations ∧
  S.centerOfMassFixed ∧ S.angularMomentumConserved ∧ S.energyConserved

theorem three_body_closed_from_evidence (S : ThreeBodySystem) (E : ThreeBodyEvidence S) :
    ThreeBodyClosed S := by
  exact And.intro E.gravitationalConstantClosed
    (And.intro E.newtonEquationsClosed
      (And.intro E.centerOfMassFixedClosed
        (And.intro E.angularMomentumConservedClosed E.energyConservedClosed)))

end DynamicalSystemsClassicalCelestialMechanicsFoundationCanonicalLaneLean
end HautevilleHouse
