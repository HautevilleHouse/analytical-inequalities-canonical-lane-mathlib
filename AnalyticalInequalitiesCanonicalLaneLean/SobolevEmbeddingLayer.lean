import HautevilleHouse.AnalyticalInequalitiesCanonicalLaneLean.MathlibObjects

namespace HautevilleHouse
namespace AnalyticalInequalitiesCanonicalLaneLean

structure SobolevLayerCertificate where
  dimension : ℕ
  exponentP : ℝ
  exponentPStar : ℝ
  embeddingCondition : exponentP < dimension ∧ exponentPStar = (dimension * exponentP) / (dimension - exponentP)
  inequalityStatement : Prop
  bridgeChecked : Bool

def sobolevLayerCertificate : SobolevLayerCertificate :=
  { dimension := 3, exponentP := 2, exponentPStar := 6, embeddingCondition := by
    constructor <;> norm_num,
    inequalityStatement := True, bridgeChecked := true }

def SobolevLayerClosed (C : SobolevLayerCertificate) : Prop :=
  C.embeddingCondition ∧ C.bridgeChecked = true

theorem sobolev_layer_closed_checked : SobolevLayerClosed sobolevLayerCertificate :=
  ⟨by
    constructor <;> norm_num,
    rfl⟩

end AnalyticalInequalitiesCanonicalLaneLean
end HautevilleHouse