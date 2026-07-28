import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace AnalyticalInequalitiesCanonicalLaneLean

structure InequalityDatum where
  p : ℝ
  q : ℝ
  exponentPairValid : 1/p + 1/q = 1
  a : ℝ
  b : ℝ
  youngInequalityHolds : (a^p)/p + (b^q)/q ≥ a*b

structure InequalityAdmittedObject where
  sourceKey : String
  theoremObject : String
  datum : InequalityDatum

end AnalyticalInequalitiesCanonicalLaneLean
end HautevilleHouse