provider "azurerm" {
  client_id       = var.client_id
  client_secret   = var.client_secret
  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id

  features {}
}

provider "azurerm" {
  alias = "ops"

  client_id       = var.client_id
  client_secret   = var.client_secret
  subscription_id = var.ops_subscription_id
  tenant_id       = var.tenant_id

  features {}
}

provider "kubernetes" {
  host                   = local.kube_config["host"]
  client_certificate     = base64decode(local.kube_config["client_certificate"])
  client_key             = base64decode(local.kube_config["client_key"])
  cluster_ca_certificate = base64decode(local.kube_config["cluster_ca_certificate"])
}

provider "helm" {
  kubernetes {
    host                   = local.kube_config["host"]
    client_certificate     = base64decode(local.kube_config["client_certificate"])
    client_key             = base64decode(local.kube_config["client_key"])
    cluster_ca_certificate = base64decode(local.kube_config["cluster_ca_certificate"])
  }
}
