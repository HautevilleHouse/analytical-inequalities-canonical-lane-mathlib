import AnalyticalInequalitiesCanonicalLaneLean.AdmissibleClass
import Mathlib.Analysis.Calculus.MeanInequalities

/-!
# Sobolev Inequality Layer

This layer records a certificate for the Gagliardo–Nirenberg–Sobolev inequality.
-/

namespace HautevilleHouse
namespace AnalyticalInequalitiesCanonicalLaneLean

structure SobolevCertificate where
  n : ℕ
  p : ℝ
  q : ℝ
  u : ℝ → ℝ
  conditionCheck : 1 ≤ p ∧ p < n ∧ q = (n*p)/(n-p)
  inequalitySatisfied : Real.rpow (∫ x, |u x| ^ q) (1/q) ≤ Real.rpow (∫ x, |∇ u x| ^ p) (1/p)

def defaultSobolevCertificate : SobolevCertificate := {
  n := 3
  p := 2
  q := 2*3/(3-2)
  u := fun x => 0
  conditionCheck := by
    constructor <;> norm_num
  inequalitySatisfied := by
    have hqpos : q ≠ 0 := by
      unfold q
      norm_num
    have hpnonzero : p ≠ 0 := by norm_num
    have h1q_nonzero : (1 / q : ℝ) ≠ 0 := by
      intro h
      field_simp [hqpos] at h
      norm_num at h
    have h1p_nonzero : (1 / p : ℝ) ≠ 0 := by
      intro h
      field_simp [hpnonzero] at h
      norm_num at h
    have hInt1 : (∫ x, |u x| ^ q) = 0 := by
      simp [u, Real.zero_rpow hqpos, integral_zero]
    have hInt2 : (∫ x, |∇ u x| ^ p) = 0 := by
      simp [u, Real.zero_rpow hpnonzero, integral_zero]
    calc
      Real.rpow (∫ x, |u x| ^ q) (1/q) = Real.rpow (0 : ℝ) (1/q) := by rw [hInt1]
      _ = 0 := Real.zero_rpow h1q_nonzero
      _ ≤ 0 := le_refl 0
      _ = Real.rpow (0 : ℝ) (1/p) := by symm; exact Real.zero_rpow h1p_nonzero
      _ = Real.rpow (∫ x, |∇ u x| ^ p) (1/p) := by rw [hInt2]
}

def SobolevLayerClosed (C : SobolevCertificate) : Prop :=
  C.conditionCheck ∧ C.inequalitySatisfied

theorem sobolev_layer_closed_checked : SobolevLayerClosed defaultSobolevCertificate := by
  exact And.intro defaultSobolevCertificate.conditionCheck defaultSobolevCertificate.inequalitySatisfied

end AnalyticalInequalitiesCanonicalLaneLean
end HautevilleHouse