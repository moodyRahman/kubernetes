resource "kubernetes_manifest" "infisical_secret" {
  depends_on       = [kubernetes_namespace_v1.infisical]
  manifest = {
    apiVersion = "bitnami.com/v1alpha1"
    kind       = "SealedSecret"

    metadata = {
      name      = "infisical"
      namespace = "infisical"
    }

    spec = {
      encryptedData = {
        client_secret = "AgCDv30t1k56quTzU6hrb/8eqV1hYFKI+lTsJIOmjeTkfCevbDvtD6QIWqMxS/tXPBxt7r6zysn8uapUXLer0pvD80765usa2+p/DHc54Si7AbdzsbgSo92FTYbmYti05FOQxQjOaI7y3kE8Pch6x9GjOVM+yKvwZICgQkTfF9+76RCilQJUQYZfziJk6C3ACtXc+f7+FaNIxXcLWC2pO09/Nbq3xE91StfKq6cBW8c01S9afCUUB1uvozdfZHL6C4DauHNX3y20jlkt2dF3943Y2bpH30sfsT4HQNHIXm2QS5HpFl5pxMUWdkLipcRLbBF7x7yZr4KHdFL7P/eQ0qYNdcxHbsWKY8X/IymgxsLBkVVybTRgHJbcbP92VWeotStlao/Y50KU/6QdEHizSbWgWoFOS0J/SeMFKEd07hoVC3tnHYAbg2hw1hejfhiqhDGYFnK6OuEvklsoLyEVLjPUB8v/qWdsx+mf6KhDWlOMrUG6WOJ7SqXm2fy92BcuolzW5vOaIHt1Dx8CUcg28EcQrBwBugaf4xrx5a8zhXJaTqjAyMEOhCSoLdZKHIaGVu7tA0f9+Ib+q17Q88EtNWK0b+846KLxL2h8ZZcjfOQDeGrEDd+u2ybab49Wi4FNpRsoC8Co36Hp0TmJkdRmIqPPb999TfbUNTDrlK7MiO1lCAmqq488b+uPjAl6nJGCVENwrO4qp4Yfb/3VEfuxDvEAM+jMtgugrlshvb4fP9YseVt7as4KQ9s2XeR8mLkp46IiHPInZz+gCA0Y/Afi2BNJ"
        client_id = "AgB6vABfkoCj6yqqiQ1+v53z2Q4b1D+HVIW2IqQyiDkZm2GBk0+Cp3VJd7uIgV66sZs32rVfL0ZtRqYv/ZhmvXpHBjTcwb/XTGr623YcknXQmDgy47dpH+kruwAQ0wAROKg3ob3Ya2zwjyaQRW+DfU2SM89zTlkEdCmI7ILalgxQGJZbeHf2nX3bYfLR01Keh/nqo54r4/fF1XO46lV7/Odrp+MkKZgEyBkDxLJon4MuLCQiNguquYFXvkDsC7GJuBwu8xXrCcPjiDuiQ78Ui5MK4kAf5Q4GenoLimJ/eKDytSlMZ700FV5ZU06t5VldRP2PUpP/fYyNo4f0/LnkFuPUjSy3QOg477NkGMH1Edxe8Uink2aaw/XycPdWTmT8zxq+WaJHU9lg7A7I8yC04BwDjBxZ0Yq9qudnyb/G5xLOgtmu/unpKmDFndsyNHmzRBEtVRlS9mstO10AFKXg0vp+7dUcd+F/jfJ1lU0IKUraFH+Pzt9GlY9RHH3QL+tSXYCD9yq5JZ3SXhbh367VO75keBc5buLCi8RtO8UQ8Wj8oS2LFSucrKnPJTvTSLmA5e5taO2pPDuxPTQ0QYSBaVbqCWaa29T5WgnEFka86CWdicoHWWWxvrsV4A2yvsoXTm+vlbvsFxxI71xlpZVcXYmSA9f5b2mDtfw9wYKzjNcTOHgI28Fo93Wpmdcpu+GG2Gpnu2R/cFkMKU/cgQJJlrLE9s/u8lBImYx7JemytPpnloL7E50="
      }

      template = {
        metadata = {
          name      = "infisical"
          namespace = "default"
        }
      }
    }
  }
}

resource "kubernetes_namespace_v1" "infisical" {
  metadata {
    name = "infisical"
  }
}


resource "helm_release" "eso" {
  name             = "eso"
  create_namespace = true
  repository       = "https://charts.external-secrets.io"
  chart            = "external-secrets"
}
