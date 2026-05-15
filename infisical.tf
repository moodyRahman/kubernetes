
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
