variable "aws_access_key_id" {
  default     = null
  description = "Specifies the AWS access key ID for the AWS Terraform provider."
  type        = string
}

variable "aws_secret_access_key" {
  default     = null
  description = "Specifies the AWS access key secret for the AWS Terraform provider."
  sensitive   = true
  type        = string
}


variable "client_id" {
  default     = null
  description = "The AzureAD Appication Client ID"
  type        = string
}

variable "client_secret" {
  default     = null
  description = "The AzureAD Application Password"
  sensitive   = true
  type        = string
}

variable "subscription_id" {
  default     = null
  description = "The Azure subscription ID"
  type        = string
}

variable "tenant_id" {
  default     = null
  description = "The Azure AD tenant ID"
  type        = string
}

variable "ops_resource_group_name" {
  description = "The name of the resource group for this project's ops resources."
  type        = string
}

variable "ops_subscription_id" {
  description = "The subscription ID containing this project's ops resources"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group for this project."
  type        = string
}