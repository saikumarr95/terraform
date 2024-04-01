variable "azure_resource_name" {
  description = "The name of the Azure resource to include in the storage account name."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the storage account."
  type        = string
}

variable "location" {
  description = "The location/region in which to create the storage account."
  type        = string
}

variable "subnet_id" {
  description = "The ID of the subnet for the storage account."
  type        = string
}

variable "environment" {
  description = "The environment for the storage account."
  type        = string
  default     = "development"
}