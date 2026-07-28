import AnalyticalInequalitiesCanonicalLaneLean.BridgeLemmas
import AnalyticalInequalitiesCanonicalLaneLean.GateLemmas

namespace HautevilleHouse
namespace AnalyticalInequalitiesCanonicalLaneLean

def ConstrainedInequalityClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A ∧ ClassicalSourceBoundaryCarried

theorem constrained_inequality_closure (A : AdmissibleClass) :
    ConstrainedInequalityClosure A := by
  exact And.intro (bridge_from_admissible_class A)
    (And.intro (gate_from_admissible_class A) classical_source_boundary_carried_checked)

theorem inequality_closure_endgame : ConstrainedInequalityClosure (rhAdmissibleClass) := by
  exact constrained_inequality_closure rhAdmissibleClass

end AnalyticalInequalitiesCanonicalLaneLean
end HautevilleHouse