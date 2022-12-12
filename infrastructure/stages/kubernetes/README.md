<!-- BEGIN_TF_DOCS -->
## Requirements

The following requirements are needed by this module:

- <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) (~> 1.3.6)

- <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) (~> 3)

- <a name="requirement_helm"></a> [helm](#requirement\_helm) (~> 2)

- <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) (~> 2)

## Providers

The following providers are used by this module:

- <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) (3.35.0)

- <a name="provider_helm"></a> [helm](#provider\_helm) (2.7.1)

- <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) (2.16.1)

## Modules

No modules.

## Resources

The following resources are used by this module:

- [helm_release.nginx_ingress](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) (resource)
- [kubernetes_cluster_role_binding.view](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/cluster_role_binding) (resource)
- [kubernetes_namespace.apps](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/namespace) (resource)
- [kubernetes_secret.tls](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/secret) (resource)
- [azurerm_key_vault.config](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/key_vault) (data source)
- [azurerm_key_vault_secret.tls](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/key_vault_secret) (data source)
- [azurerm_kubernetes_cluster.aks](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/kubernetes_cluster) (data source)
- [azurerm_resource_group.rg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/resource_group) (data source)
- [azurerm_subnet.aks](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/subnet) (data source)

## Required Inputs

The following input variables are required:

### <a name="input_environment"></a> [environment](#input\_environment)

Description: The kubernetes environment tag.

Type: `string`

### <a name="input_ops_resource_group_name"></a> [ops\_resource\_group\_name](#input\_ops\_resource\_group\_name)

Description: The name of the resource group for this project's ops resources.

Type: `string`

### <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name)

Description: The name of the resource group for this project.

Type: `string`

### <a name="input_subscription_id"></a> [subscription\_id](#input\_subscription\_id)

Description: The Azure subscription ID for the solution environment.

Type: `string`

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_client_id"></a> [client\_id](#input\_client\_id)

Description: The AzureAD Appication Client ID

Type: `string`

Default: `null`

### <a name="input_client_secret"></a> [client\_secret](#input\_client\_secret)

Description: The AzureAD Application Password

Type: `string`

Default: `null`

### <a name="input_tenant_id"></a> [tenant\_id](#input\_tenant\_id)

Description: The Azure AD tenant ID

Type: `string`

Default: `null`

## Outputs

No outputs.
<!-- END_TF_DOCS -->