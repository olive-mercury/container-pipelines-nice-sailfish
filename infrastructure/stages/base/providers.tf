provider "azurerm" {
  subscription_id = var.subscription_id
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