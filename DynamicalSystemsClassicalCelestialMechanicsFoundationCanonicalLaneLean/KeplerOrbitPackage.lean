import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsClassicalCelestialMechanicsFoundationCanonicalLaneLean

structure KeplerOrbitPackage where
  centralMass : Type u
  testMass : Type v
  orbitPlane : Prop
  eccentricity : Prop
  semiMajorAxis : Prop
  keplerLaws : Prop

structure KeplerOrbitEvidence (K : KeplerOrbitPackage) where
  orbitPlaneClosed : K.orbitPlane
  eccentricityClosed : K.eccentricity
  semiMajorAxisClosed : K.semiMajorAxis
  keplerLawsClosed : K.keplerLaws

def KeplerOrbitClosed (K : KeplerOrbitPackage) : Prop :=
  K.orbitPlane ∧ K.eccentricity ∧ K.semiMajorAxis ∧ K.keplerLaws

theorem kepler_orbit_closed_from_evidence (K : KeplerOrbitPackage) (E : KeplerOrbitEvidence K) :
    KeplerOrbitClosed K := by
  exact And.intro E.orbitPlaneClosed
    (And.intro E.eccentricityClosed
      (And.intro E.semiMajorAxisClosed E.keplerLawsClosed))

end DynamicalSystemsClassicalCelestialMechanicsFoundationCanonicalLaneLean
end HautevilleHouse
