import HautevilleHouse.AnalyticalInequalitiesCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace AnalyticalInequalitiesCanonicalLaneLean

def bridgeClosed (O : InequalityAdmittedObject) : Prop :=
  O.datum.youngInequalityHolds ∧ O.datum.exponentPairValid

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A.object := by
  exact And.intro A.object.datum.youngInequalityHolds A.object.datum.exponentPairValid

end AnalyticalInequalitiesCanonicalLaneLean
end HautevilleHouse