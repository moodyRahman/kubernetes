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
        client_secret = "AgCPxkYopIlCsixnopAqh6PLINRSOLzVZF1yOZEO2o/qRDNrw40CjVlHY+d9XSA2UukZ2kf5uErEXhY4RJMIZuBa3I5OXdTFOntgxDs53wfMwsg/pFhP+XmrC0qvCC6jHLsNzjLh5beqRwh8EdbHlNpTit9XXBPdEvWipkob7UYtnQ6YcqKbPiJD3Tmtgy1KelBJ5BZynTqY5kP2I/jvOL4cVmJI+GJJYY0RFXnjrOnB0xYxNbBoC2qld2Kz1WXBnGeVKY51DCqh/eKbHwGdpnKFaUNU3pAdQf6yX+HhM5D4zUCGpi12LbYd3yzFeDmF8O8HVfx+3MWIAYRXoTizhSRCZNYz13RZg//XPbdf1DfZO4XtGsj6nUspnKi5O+y0YEJTaRKVwF2lE4wetV+bgRlV/vjw8q+/f1639NzQuOkGdTvsoY4GGjezaUHdD9x+Ol/0SeBMP5SdHiYc3AG6pfPCeDHzTkEbpv+3v3FbiR9uYm7txHSoSRi3xFA21FwLw2rHV1A1DWGinAY8moHAKWxTW2ElRhrSJwozduDlVjJHQsIDqbCk89dtJcpJo+Oe+aSYpWeXv4LI8yT8dUvPaNSAKX8sx3wfHBHZ2GVhtdMY5hVJupjA7l6dtwDKm4m2MaVuvK8+p2VJ8KtXQTIiF8kGmmP/zwvU14r2c0PC66Y7aeSK0ImSTfcoKSImUF1xZGHL7yW8Eh6G4IOOKMqTn43gSMQonqnI1xVEXc1bchdUdqUZyQ4pqLzJiSC7BvRAjWvzeeBLGoDBVRPJj20y4NrB"
        client_id = "AgC0aG7DJSvkDZsr3WPSHIipyWE/e+jX13362vdrNcNy70LvkmSymzshfLgIfHp/e5uIYZgP2ecx+q9glJh3W1z8jye/A7SeShqJCPqpygPFTpdZHaeL13e5OMkTCnWZ28CdYtBEKXdmKbHW6zvhu4hzut1l9CJTqKNTp+JcpZ5zUXKm6+l2jWOtg1ikioKf8Aah7LoLv38+0TrUWBuOHBg1+0swlO8laQLjHCj9DHtRgnIqUEkpzgbnuLMUU18VlUSULPLcwp0oexnXB7NzNelZxoXQ8vs95I3UFiS2k67L53ZV6maAwYKdOWSSewhc5xuAXvSDzRPOqI3rDuaJ+V416J5hzRIUwUcLXLT6nQJM84ae2togh4rT6XHw6hDYxUUgEjwBMucWZBIBvXTmRxmqi/8XZeDfHte89Ag8OVN7apJ+/Lv/vR8+aMSqLAtHa3jFf6tWwBOrarpd4zGN3V+ysSDRSE56F+kT+ys8j1/pl7lPuH75XsxxVs+HHBGqSFVWvC2AxW/ghRIYcz2L5Pm31hV46tAWkYJbsle7B1FuezxnEVuVIy+qfF/xN1MTtF13yXSpAYQfPfqTulMhh6V0qfiglvtlvwA5wGK9I/zMBvoil4EKtCCw9qZPElCXefupx4ZQWPl/AhlgT4fzR3bOFxFd7za9WSVszarLFGp687as7MtId4VG78mXCl6vaiMkl5/M7WvWX1ZOMD8b9E9i8adFe0V5SVqI21DUs5R02jl3am0="
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
