terraform {
  required_version = "~> 1.3.6"

  cloud {
    organization = "olive-mercury"
    workspaces {
      tags = ["base","container", "pipelines"]
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 2"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3"
    }
  }
}

provider "azurerm" {
  subscription_id = var.env_subscription_id
  features {}
}

provider "azurerm" {
  alias = "ops"

  subscription_id = var.ops_subscription_id
  features {}
}

provider "aws" {
  region = "us-west-2"
}