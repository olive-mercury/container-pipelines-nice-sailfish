# Read details about the resource group created for this project.
data "azurerm_resource_group" "rg" {
  name = var.resource_group_name
}

data "azurerm_resource_group" "ops" {
  name = var.ops_resource_group_name
}

# Assign roles for resources in the resource group.
resource "azurerm_role_assignment" "acr_pull" {
  for_each = {
    for k, v in module.aks : k => v.kubelet_identity_object_id
  }

  principal_id         = each.value
  role_definition_name = "AcrPull"
  scope                = data.azurerm_resource_group.ops.id
}