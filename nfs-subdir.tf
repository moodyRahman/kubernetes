# resource "helm_release" "nfs_provisioner" {
#   name       = "nfs-subdir-external-provisioner"
#   repository = "https://kubernetes-sigs.github.io/nfs-subdir-external-provisioner/"
#   chart      = "nfs-subdir-external-provisioner"
#   namespace  = "default"

#   set = [
#     {
#       name  = "nfs.server"
#       value = "nfs"
#     },
#     {
#       name  = "nfs.path"
#       value = "/srv/nfs/shared"
#     }
#   ]
# }

# resource "kubernetes_annotations" "nfs_client_default" {
#   depends_on = [helm_release.nfs_provisioner]

#   api_version = "storage.k8s.io/v1"
#   kind        = "StorageClass"

#   metadata {
#     name = "nfs-client"
#   }

#   annotations = {
#     "storageclass.kubernetes.io/is-default-class" = "true"
#   }
# }
