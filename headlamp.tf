
# resource "helm_release" "headlamp" {
#   name       = "headlamp"
#   repository = "https://kubernetes-sigs.github.io/headlamp/"
#   chart      = "headlamp"
#   namespace  = "kube-system"

#   set = [
#     {
#       name  = "serviceAccount.create"
#       value = "false"
#     },
#     {
#       name  = "serviceAccount.name"
#       value = "headlamp-admin"
#     },
#   ]
# }


# resource "kubernetes_service_account_v1" "headlamp_admin" {
#   depends_on = [helm_release.headlamp]

#   metadata {
#     name      = "headlamp-admin"
#     namespace = "kube-system"
#   }
# }

# resource "kubernetes_cluster_role_binding_v1" "headlamp_admin" {
#   depends_on = [kubernetes_service_account_v1.headlamp_admin]

#   metadata {
#     name = "headlamp-admin"
#   }

#   subject {
#     kind      = "ServiceAccount"
#     name      = "headlamp-admin"
#     namespace = "kube-system"
#   }

#   role_ref {
#     api_group = "rbac.authorization.k8s.io"
#     kind      = "ClusterRole"
#     name      = "cluster-admin"
#   }
# }


# resource "kubernetes_ingress_v1" "headlamp" {
#   depends_on = [helm_release.headlamp]

#   metadata {
#     name      = "headlamp"
#     namespace = "kube-system"
#   }

#   spec {
#     ingress_class_name = "traefik"

#     rule {
#       host = "headlamp.k8s.moody"

#       http {
#         path {
#           path      = "/"
#           path_type = "Prefix"

#           backend {
#             service {
#               name = "headlamp"
#               port {
#                 number = 80
#               }
#             }
#           }
#         }
#       }
#     }
#   }
# }