provider "kubernetes" {
  config_path = "~/.kube/config"
}

provider "helm" {
  kubernetes = {
    config_path = "~/.kube/config"
  }
}

terraform {
  required_providers {
    argocd = {
      source  = "argoproj-labs/argocd"
      version = "~> 7.15"
    }
  }
}

variable "argocd_password" {
  type = string
}

provider "argocd" {
  use_local_config = true
}


resource "kubernetes_namespace_v1" "test" {
  metadata {
    name = "test"
  }
}
