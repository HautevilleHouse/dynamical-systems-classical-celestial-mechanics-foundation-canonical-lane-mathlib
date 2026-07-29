import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsClassicalCelestialMechanicsFoundationCanonicalLaneLean

structure DynamicalSystem where
  stateSpace : Type u
  timeDomain : Type v
  evolution : timeDomain → stateSpace → stateSpace
  groupProperty : Prop
  continuousEvolution : Prop

def dynamical_system_closed (D : DynamicalSystem) : Prop :=
  D.groupProperty ∧ D.continuousEvolution

theorem dynamical_system_closed_iff (D : DynamicalSystem) : dynamical_system_closed D ↔ (D.groupProperty ∧ D.continuousEvolution) := by
  rfl

end DynamicalSystemsClassicalCelestialMechanicsFoundationCanonicalLaneLean
end HautevilleHouse