terraform {
  required_providers {
    kubernetes = {
      source  = "gavinbunney/kubectl"
      version = ">= 1.14.0"
    }
  }
}


resource "kubectl_manifest" "manifest" {
  yaml_body = yamldecode(file(var.file_path))
}