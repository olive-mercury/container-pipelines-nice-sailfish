terraform {
  required_version = ">= 0.15"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3"
    }

    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3"
    }
  }
}