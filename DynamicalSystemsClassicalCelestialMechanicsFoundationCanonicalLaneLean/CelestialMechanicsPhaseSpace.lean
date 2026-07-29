import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsClassicalCelestialMechanicsFoundationCanonicalLaneLean

structure PhaseSpace where
  position : Type u
  momentum : Type v
  symplecticForm : Prop
  coordinates : position → momentum → Prop

def phase_space_closed (P : PhaseSpace) : Prop :=
  P.symplecticForm

theorem phase_space_closed_iff (P : PhaseSpace) : phase_space_closed P ↔ P.symplecticForm := by
  rfl

end DynamicalSystemsClassicalCelestialMechanicsFoundationCanonicalLaneLean
end HautevilleHouse