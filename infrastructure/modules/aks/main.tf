locals {
  aks_cluster_name        = "aks-${local.environment_id}"
  environment_id          = "${local.instance_id}-${var.environment}"
  instance_id             = var.instance_id
  log_analytics_workspace = var.log_analytics_workspace
  resource_group          = var.resource_group
}

data "azurerm_client_config" "current" {}