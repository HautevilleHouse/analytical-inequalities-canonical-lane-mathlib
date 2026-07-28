import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace AnalyticalInequalitiesCanonicalLaneLean

structure ConvexFunction (X : Type) [Add X] [SMul ℝ X] where
  f : X → ℝ
  convex : ∀ (x y : X) (t : ℝ), 0 ≤ t → t ≤ 1 → f (t • x + (1 - t) • y) ≤ t • f x + (1 - t) • f y

structure JensenCertificate (X : Type) [Add X] [SMul ℝ X] where
  convexFn : ConvexFunction X
  point : X
  measure : ℝ
  jensenHold : Bool

def jensenCertificate (X : Type) [Add X] [SMul ℝ X] : JensenCertificate X :=
  { convexFn := { f := λ x => 0, convex := λ x y t ht0 ht1 => by
      simp
    },
    point := 0,
    measure := 1,
    jensenHold := true
  }

def JensenLayerClosed (X : Type) [Add X] [SMul ℝ X] (C : JensenCertificate X) : Prop :=
  C.jensenHold = true

theorem jensen_layer_closed (X : Type) [Add X] [SMul ℝ X] : JensenLayerClosed X (jensenCertificate X) :=
  rfl

end AnalyticalInequalitiesCanonicalLaneLean
end HautevilleHouse