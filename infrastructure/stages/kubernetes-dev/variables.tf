variable "resource_group_name" {
  description = "(Required) The name of the resource group for this project."
  type        = string
}

variable "subscription_id" {
  description = "(Required) The Azure subscription ID for the solution environment."
  type        = string
}

variable "ops_subscription_id" {
  description = "(Required) The subscription ID containing this project's ops resources"
  type        = string
}

variable "ops_resource_group_name" {
  description = "The name of the resource group for this project's ops resources."
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

variable "tenant_id" {
  default     = null
  description = "The Azure AD tenant ID"
  type        = string
}