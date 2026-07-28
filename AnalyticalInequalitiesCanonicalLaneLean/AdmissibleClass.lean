import HautevilleHouse.AnalyticalInequalitiesCanonicalLaneLean.InequalityObjects

namespace HautevilleHouse
namespace AnalyticalInequalitiesCanonicalLaneLean

structure AdmissibleClass where
  object : InequalityAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end AnalyticalInequalitiesCanonicalLaneLean
end HautevilleHouse