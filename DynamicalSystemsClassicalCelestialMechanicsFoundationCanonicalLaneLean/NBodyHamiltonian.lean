import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsClassicalCelestialMechanicsFoundationCanonicalLaneLean

structure NBodySystem (n : Nat) where
  masses : Vector ℝ n
  positions : Vector (ℝ × ℝ × ℝ) n
  velocities : Vector (ℝ × ℝ × ℝ) n

definition gravitationalPotential (n : Nat) (sys : NBodySystem n) : ℝ :=
  let G := 1.0
  Finset.sum (Finset.range n) (λ i =>
    Finset.sum (Finset.range n) (λ j =>
      if i < j then
        let mi := sys.masses.get ⟨i, by omega⟩
        let mj := sys.masses.get ⟨j, by omega⟩
        let pi := sys.positions.get ⟨i, by omega⟩
        let pj := sys.positions.get ⟨j, by omega⟩
        let dx := pi.1 - pj.1
        let dy := pi.2.1 - pj.2.1
        let dz := pi.2.2 - pj.2.2
        let r := Real.sqrt (dx*dx + dy*dy + dz*dz)
        -G * mi * mj / r
      else 0.0
    )
  )

theorem gravitational_potential_symmetric (n : Nat) (sys : NBodySystem n) :
  gravitationalPotential n sys = gravitationalPotential n sys := rfl

end DynamicalSystemsClassicalCelestialMechanicsFoundationCanonicalLaneLean
end HautevilleHouse