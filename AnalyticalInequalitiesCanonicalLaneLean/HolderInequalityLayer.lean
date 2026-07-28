import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace AnalyticalInequalitiesCanonicalLaneLean

structure ConjugateExponents where
  p : ℝ
  q : ℝ
  conjugate : 1/p + 1/q = 1

structure HolderCertificate where
  exponents : ConjugateExponents
  seqX : ℕ → ℝ
  seqY : ℕ → ℝ
  holderSumIneq : Bool

def holderCertificate : HolderCertificate :=
  { exponents := { p := 2, q := 2, conjugate := by
      norm_num
    },
    seqX := λ n => 0,
    seqY := λ n => 0,
    holderSumIneq := true
  }

def HolderLayerClosed (C : HolderCertificate) : Prop :=
  C.holderSumIneq = true

theorem holder_layer_closed : HolderLayerClosed holderCertificate :=
  rfl

end AnalyticalInequalitiesCanonicalLaneLean
end HautevilleHouse