resource "helm_release" "postgresql" {
  name      = "postgresql"
  namespace = "data"

  repository = "oci://registry-1.docker.io/bitnamicharts"
  chart      = "postgresql"

}
