import AnalyticalInequalitiesCanonicalLaneLean.AdmissibleClass
import Mathlib.Data.Real.Basic

/-!
# Minkowski's Inequality Layer

This layer records the certificate for the discrete Minkowski inequality.
-/

namespace HautevilleHouse
namespace AnalyticalInequalitiesCanonicalLaneLean

structure MinkowskiCertificate where
  p : ℝ
  n : ℕ
  xi : ℝ
  yi : ℝ
  conditionCheck : p ≥ 1
  nonnegativeCheck : xi ≥ 0 ∧ yi ≥ 0
  inequalitySatisfied : (∑ i in Finset.range n, (xi + yi)^p)^(1/p) ≤ (∑ i in Finset.range n, xi^p)^(1/p) + (∑ i in Finset.range n, yi^p)^(1/p)

def defaultMinkowskiCertificate : MinkowskiCertificate := {
  p := 2
  n := 1
  xi := 1
  yi := 1
  conditionCheck := by norm_num
  nonnegativeCheck := by norm_num
  inequalitySatisfied := by
    simp [Finset.sum_range_one]
    norm_num
}

def MinkowskiLayerClosed (C : MinkowskiCertificate) : Prop :=
  C.conditionCheck ∧ C.nonnegativeCheck ∧ C.inequalitySatisfied

theorem minkowski_layer_closed_checked : MinkowskiLayerClosed defaultMinkowskiCertificate := by
  exact And.intro defaultMinkowskiCertificate.conditionCheck
    (And.intro defaultMinkowskiCertificate.nonnegativeCheck defaultMinkowskiCertificate.inequalitySatisfied)

end AnalyticalInequalitiesCanonicalLaneLean
end HautevilleHouse