resource "azurerm_kubernetes_cluster_node_pool" "user" {
  enable_auto_scaling   = true
  kubernetes_cluster_id = azurerm_kubernetes_cluster.aks.id
  max_count             = 3
  min_count             = 1
  mode                  = "User"
  name                  = "user"
  orchestrator_version  = data.azurerm_kubernetes_service_versions.current.latest_version
  os_disk_size_gb       = 1024
  tags                  = var.resource_group.tags
  vm_size               = "Standard_DS2_v2"
  vnet_subnet_id        = azurerm_subnet.subnet["aks-subnet"].id
  zones                 = [1, 2, 3]

  upgrade_settings {
    max_surge = "200"
  }
}