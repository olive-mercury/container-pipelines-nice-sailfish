provider "azuread" {
  client_id     = var.client_id
  client_secret = var.client_secret
  tenant_id     = var.tenant_id
}

provider "azurerm" {
  client_id       = var.client_id
  client_secret   = var.client_secret
  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id

  features {}
}

provider "aws" {
  access_key = var.aws_access_key_id
  region     = "us-west-2"
  secret_key = var.aws_secret_access_key
}