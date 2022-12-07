<!-- BEGIN_TF_DOCS -->


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

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_aws_access_key_id"></a> [aws\_access\_key\_id](#input\_aws\_access\_key\_id)

Description: Specifies the AWS access key ID for the AWS Terraform provider.

Type: `string`

Default: `null`

### <a name="input_aws_secret_access_key"></a> [aws\_secret\_access\_key](#input\_aws\_secret\_access\_key)

Description: Specifies the AWS access key secret for the AWS Terraform provider.

Type: `string`

Default: `null`

### <a name="input_client_id"></a> [client\_id](#input\_client\_id)

Description: The AzureAD Appication Client ID

Type: `string`

Default: `null`

### <a name="input_client_secret"></a> [client\_secret](#input\_client\_secret)

Description: The AzureAD Application Password

Type: `string`

Default: `null`

### <a name="input_subscription_id"></a> [subscription\_id](#input\_subscription\_id)

Description: The Azure subscription ID

Type: `string`

Default: `null`

### <a name="input_tenant_id"></a> [tenant\_id](#input\_tenant\_id)

Description: The Azure AD tenant ID

Type: `string`

Default: `null`

## Outputs

No outputs.

## Resources

The following resources are used by this module:

- [azurerm_role_assignment.acr_pull](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) (resource)
- [azurerm_key_vault.config](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/key_vault) (data source)
- [azurerm_key_vault_certificate.certificate](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/key_vault_certificate) (data source)
- [azurerm_log_analytics_workspace.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/log_analytics_workspace) (data source)
- [azurerm_resource_group.ops](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/resource_group) (data source)
- [azurerm_resource_group.rg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/resource_group) (data source)

## Requirements

The following requirements are needed by this module:

- <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) (~> 1.3.6)

- <a name="requirement_aws"></a> [aws](#requirement\_aws) (~> 3)

- <a name="requirement_azuread"></a> [azuread](#requirement\_azuread) (~> 2)

- <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) (~> 3)

- <a name="requirement_random"></a> [random](#requirement\_random) (~> 3)

## Providers

The following providers are used by this module:

- <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) (3.34.0)

- <a name="provider_azurerm.ops"></a> [azurerm.ops](#provider\_azurerm.ops) (3.34.0)

## Modules

The following Modules are called:

### <a name="module_agw"></a> [agw](#module\_agw)

Source: ../../modules/application-gateway

Version:

### <a name="module_aks"></a> [aks](#module\_aks)

Source: ../../modules/aks

Version:

## Update Docs

Run this command:

```
terraform-docs markdown document --output-file README.md --output-mode inject .
```
<!-- END_TF_DOCS -->