import HautevilleHouse.AnalyticalInequalitiesCanonicalLaneLean.GateLemmas
import HautevilleHouse.AnalyticalInequalitiesCanonicalLaneLean.YoungInequalityLayer
import HautevilleHouse.AnalyticalInequalitiesCanonicalLaneLean.HolderInequalityLayer

namespace HautevilleHouse
namespace AnalyticalInequalitiesCanonicalLaneLean

def ConstrainedAnalyticalInequalitiesClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A.object ∧ gateClosed A

def NativeClosureTheorem (A : AdmissibleClass) : Prop :=
  ConstrainedAnalyticalInequalitiesClosure A

theorem constrained_analytical_inequalities_endgame (A : AdmissibleClass) :
    ConstrainedAnalyticalInequalitiesClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

theorem native_closure_theorem_checked (A : AdmissibleClass) :
    NativeClosureTheorem A := by
  exact constrained_analytical_inequalities_endgame A

def youngAdmittedObject : InequalityAdmittedObject := {
  sourceKey := "young-inequality",
  theoremObject := "Young inequality",
  datum := {
    p := 2, q := 2, a := 1, b := 1,
    exponentPairValid := youngInequalityCertificate.exponentValid,
    youngInequalityHolds := youngInequalityCertificate.inequalityHolds
  }
}

def youngAdmissibleClass : AdmissibleClass := {
  object := youngAdmittedObject,
  endpointSatisfied := YoungInequalityLayerClosed youngInequalityCertificate,
  remainderRecorded := False,
  gateWitness := Or.inl (young_inequality_layer_closed_checked)
}

end AnalyticalInequalitiesCanonicalLaneLean
end HautevilleHouse