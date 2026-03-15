resource "kubernetes_namespace_v1" "argocd" {
  metadata {
    name = "argocd"
  }
}


resource "helm_release" "argocd" {
  depends_on = [ kubernetes_namespace_v1.argocd ]
  name             = "argocd"
  namespace        = "argocd"
  create_namespace = true
  repository       = "https://argoproj.github.io/argo-helm"
  chart            = "argo-cd"

  
  set = [
    {
      name  = "configs.params.server\\.insecure"
      value = "true"
    }
  ]

}

resource "kubernetes_ingress_v1" "argocd" {
  depends_on = [helm_release.argocd]

  metadata {
    name      = "argocd"
    namespace = "argocd"
    annotations = {
      "traefik.ingress.kubernetes.io/router.entrypoints" = "websecure"
      "traefik.ingress.kubernetes.io/router.tls"         = "true"
    }
  }

  spec {
    ingress_class_name = "traefik"

    rule {
      host = "argocd.k8s.moody"

      http {
        path {
          path      = "/"
          path_type = "Prefix"

          backend {
            service {
              name = "argocd-server"
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

# apiVersion: traefik.io/v1alpha1
# kind: IngressRoute
# metadata:
#   name: argocd-server
#   namespace: argocd
# spec:
#   entryPoints:
#     - websecure
#   routes:
#     - kind: Rule
#       match: Host(`argocd.example.com`)
#       priority: 10
#       services:
#         - name: argocd-server
#           port: 80
#     - kind: Rule
#       match: Host(`argocd.example.com`) && Header(`Content-Type`, `application/grpc`)
#       priority: 11
#       services:
#         - name: argocd-server
#           port: 80
#           scheme: h2c
#   tls:
#     certResolver: default