terraform {
  required_version = "~> 1.3.6"

  cloud {
    organization = "olive-mercury"
    workspaces {
      tags = ["kubernetes", "container", "pipelines"]
    }
  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3"
    }

    helm = {
      source  = "hashicorp/helm"
      version = "~> 2"
    }

    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2"
    }
  }
}