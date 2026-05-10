

resource "kubernetes_namespace_v1" "longhorn-system" {
  metadata {
    name = "longhorn-system"
  }
}


resource "helm_release" "longhorn" {
  depends_on = [ kubernetes_namespace_v1.longhorn-system ]
  name       = "longhorn"
  repository = "https://charts.longhorn.io"
  chart      = "longhorn"
  namespace  = "longhorn-system"

  set = [
    {
      name  = "persistence.defaultClass"
      value = "false"
    }
  ]
}

resource "kubernetes_ingress_v1" "longhorn" {
  depends_on = [helm_release.longhorn]

  metadata {
    name      = "longhorn"
    namespace = "longhorn-system"
  }

  spec {
    ingress_class_name = "traefik"

    rule {
      host = "longhorn.k8s.moody"

      http {
        path {
          path      = "/"
          path_type = "Prefix"

          backend {
            service {
              name = "longhorn-frontend"
              port {
                number = 80
              }
            }
          }
        }
      }
    }
  }
}