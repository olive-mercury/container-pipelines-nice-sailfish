resource "azurerm_kubernetes_cluster" "aks" {
  depends_on = [
    azurerm_role_assignment.network_contributor
  ]

  dns_prefix           = local.aks_cluster_name
  kubernetes_version   = data.azurerm_kubernetes_service_versions.current.latest_version
  location             = local.resource_group.location
  name                 = local.aks_cluster_name
  node_resource_group  = "${var.resource_group.name}-${var.environment}-aks"
  resource_group_name  = local.resource_group.name
  tags                 = var.resource_group.tags
  azure_policy_enabled = true

  oms_agent {
    log_analytics_workspace_id = local.log_analytics_workspace.id
  }

  default_node_pool {
    enable_auto_scaling          = true
    max_count                    = 3
    min_count                    = 1
    name                         = "system"
    only_critical_addons_enabled = true
    orchestrator_version         = data.azurerm_kubernetes_service_versions.current.latest_version
    os_disk_size_gb              = 1024
    tags                         = var.resource_group.tags
    vm_size                      = "Standard_DS2_v2"
    vnet_subnet_id               = azurerm_subnet.subnet["aks-subnet"].id
    zones                        = [1, 2, 3]

    upgrade_settings {
      max_surge = "200"
    }
  }

  identity {
    type         = "UserAssigned"
    identity_ids = [azurerm_user_assigned_identity.aks.id]
  }

  network_profile {
    dns_service_ip     = "10.0.0.10"
    docker_bridge_cidr = "172.17.0.1/16"
    network_plugin     = "kubenet"
    network_policy     = "calico"
    pod_cidr           = "10.244.0.0/16"
    service_cidr       = "10.0.0.0/16"
  }

  azure_active_directory_role_based_access_control {
    admin_group_object_ids = [azuread_group.aks_administrators.object_id]
    azure_rbac_enabled     = true
    managed                = true
    tenant_id              = data.azurerm_client_config.current.tenant_id
  }
}
