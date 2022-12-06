module "diagnostics" {
  source = "../diagnostics"

  log_analytics_workspace_id = var.log_analytics_workspace.id

  monitored_services = {
    aks  = azurerm_kubernetes_cluster.aks.id
    vnet = azurerm_virtual_network.vnet.id
  }
}