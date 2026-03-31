
resource "kubernetes_namespace_v1" "data" {
  metadata {
    name = "data"
  }
}

resource "random_password" "postgres" {
  length  = 24
  special = false
}

resource "kubernetes_secret_v1" "postgres" {
  metadata {
    name      = "postgres-credentials"
    namespace = "data"
  }

  data = {
    postgres-password = random_password.postgres.result
  }
}

resource "helm_release" "postgresql" {
  name      = "postgresql"
  namespace = "data"

  repository = "oci://registry-1.docker.io/bitnamicharts"
  chart      = "postgresql"

  set = [
    {
      name  = "auth.username"
      value = "postgres"
    },
    {
      name  = "auth.database"
      value = "postgres"
    },
    {
      name  = "auth.postgresPassword"
      value = "postgres"
    },
    {
      name  = "primary.persistence.enabled"
      value = "true"
    },
    {
      name  = "primary.persistence.existingClaim"
      value = "postgres-pvc"
    }
  ]
}

# nfs-subdir-provisioner is already set to be the default provisioner

output "postgres_password" {
  value     = random_password.postgres.result
  sensitive = true # hides it from terminal output
}


resource "kubernetes_persistent_volume_claim_v1" "postgres_pvc" {
  metadata {
    name      = "postgres-pvc"
    namespace = "data"
  }



  spec {
    access_modes       = ["ReadWriteMany"]
    storage_class_name = "nfs"
    volume_name        = kubernetes_persistent_volume_v1.nfs_pv_postgres.metadata[0].name

    resources {
      requests = {
        storage = "5Gi"
      }
    }
  }
}


resource "kubernetes_persistent_volume_v1" "nfs_pv_postgres" {
  metadata {
    name = "nfs-pv-postgres"
  }

  spec {
    capacity = {
      storage = "5Gi"
    }

    access_modes                     = ["ReadWriteMany"]
    persistent_volume_reclaim_policy = "Retain"
    storage_class_name               = "nfs"
    mount_options                    = ["hard", "nfsvers=4.1"]

    persistent_volume_source {
      nfs {
        server    = "nfs"
        path      = "/srv/nfs/shared/postgres"
        read_only = false
      }
    }
  }
}
