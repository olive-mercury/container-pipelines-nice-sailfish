terraform {
  required_version = ">= 1"

  cloud {
    organization = "olive-mercury"
    workspaces {
      tags = ["kubernetes", "container", "pipelines"]
    }
  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2"
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