data "azurerm_log_analytics_workspace" "main" {
  name                = "la-${local.ops_instance_id}"
  resource_group_name = data.azurerm_resource_group.ops.name
}