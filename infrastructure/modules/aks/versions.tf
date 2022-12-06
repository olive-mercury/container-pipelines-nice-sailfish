terraform {
  required_version = "~> 1.3.6"

  required_providers {
    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 2"
    }

    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3"
    }
  }
}