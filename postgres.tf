
# resource "kubernetes_namespace_v1" "data" {
#   metadata {
#     name = "data"
#   }
# }

# resource "helm_release" "postgresql" {
#   depends_on = [kubernetes_namespace_v1.data]
#   name      = "postgresql"
#   namespace = "data"

#   repository = "oci://registry-1.docker.io/bitnamicharts"
#   chart      = "postgresql"

  # set = [
  #   {
  #     name  = "test"
  #     value = "moody"
  #   },
  #   {
  #     name  = "auth.username"
  #     value = "moody"
  #   },
  #   {
  #     name  = "auth.password"
  #     value = "moody"
  #   },
  #   {
  #     name  = "auth.database"
  #     value = "data"
  #   },
  # ]
# }

# nfs-subdir-provisioner is already set to be the default provisioner

# resource "kubernetes_persistent_volume_claim_v1" "postgres_pvc" {
#   metadata {
#     name      = "postgres-pvc"
#     namespace = "data"
#   }

#   spec {
#     access_modes       = ["ReadWriteMany"]
#     storage_class_name = "nfs"
#     volume_name        = kubernetes_persistent_volume_v1.nfs_pv_postgres.metadata[0].name

#     resources {
#       requests = {
#         storage = "5Gi"
#       }
#     }
#   }
# }
