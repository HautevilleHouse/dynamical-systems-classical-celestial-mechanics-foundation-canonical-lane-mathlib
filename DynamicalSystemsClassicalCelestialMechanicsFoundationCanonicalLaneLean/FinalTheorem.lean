import canonicalLaneMathlib.AdmissibleClass
import DynamicalSystemsClassicalCelestialMechanicsFoundationCanonicalLaneLean.GateLemmas

namespace HautevilleHouse
namespace DynamicalSystemsClassicalCelestialMechanicsFoundationCanonicalLaneLean

def ConstrainedCelestialClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_celestial_endgame (A : AdmissibleClass) :
    ConstrainedCelestialClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end DynamicalSystemsClassicalCelestialMechanicsFoundationCanonicalLaneLean
end HautevilleHouse