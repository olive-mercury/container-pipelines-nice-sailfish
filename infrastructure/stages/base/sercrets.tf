data "azurerm_key_vault" "config" {
  name                = "kv-${local.ops_instance_id}"
  resource_group_name = data.azurerm_resource_group.ops.name
}

data "azurerm_key_vault_certificate" "certificate" {
  for_each = {
    dev = "dev-jamesrcounts-com"
    prd = "prd-jamesrcounts-com"
  }

  name         = each.value
  key_vault_id = data.azurerm_key_vault.config.id
}