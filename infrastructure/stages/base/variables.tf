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

variable "subscription_id" {
  description = "The Azure subscription ID for the solution environment."
  type        = string
}