<!-- BEGIN_TF_DOCS -->
## Requirements

The following requirements are needed by this module:

- <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) (>= 0.15)

- <a name="requirement_aws"></a> [aws](#requirement\_aws) (~> 3)

- <a name="requirement_azuread"></a> [azuread](#requirement\_azuread) (~> 1.4)

- <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) (~> 2.58)

- <a name="requirement_random"></a> [random](#requirement\_random) (~> 3.1)

## Providers

The following providers are used by this module:

- <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) (2.88.1)

- <a name="provider_azurerm.ops"></a> [azurerm.ops](#provider\_azurerm.ops) (2.88.1)

## Modules

The following Modules are called:

### <a name="module_agw"></a> [agw](#module\_agw)

Source: github.com/jamesrcounts/phippyandfriends.git//infrastructure/modules/application-gateway

Version: application-gateway-0.0.1

### <a name="module_aks"></a> [aks](#module\_aks)

Source: github.com/jamesrcounts/phippyandfriends.git//infrastructure/modules/aks

Version: main

## Resources

The following resources are used by this module:

- [azurerm_role_assignment.acr_pull](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) (resource)
- [azurerm_key_vault.config](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/key_vault) (data source)
- [azurerm_key_vault_certificate.certificate](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/key_vault_certificate) (data source)
- [azurerm_log_analytics_workspace.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/log_analytics_workspace) (data source)
- [azurerm_resource_group.ops](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/resource_group) (data source)
- [azurerm_resource_group.rg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/resource_group) (data source)

## Required Inputs

The following input variables are required:

### <a name="input_ops_resource_group_name"></a> [ops\_resource\_group\_name](#input\_ops\_resource\_group\_name)

Description: The name of the resource group for this project's ops resources.

Type: `string`

### <a name="input_ops_subscription_id"></a> [ops\_subscription\_id](#input\_ops\_subscription\_id)

Description: The subscription ID containing this project's ops resources

Type: `string`

### <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name)

Description: The name of the resource group for this project.

Type: `string`

### <a name="input_subscription_id"></a> [subscription\_id](#input\_subscription\_id)

Description: The Azure subscription ID for the solution environment.

Type: `string`

## Optional Inputs

No optional inputs.

## Outputs

No outputs.
<!-- END_TF_DOCS -->