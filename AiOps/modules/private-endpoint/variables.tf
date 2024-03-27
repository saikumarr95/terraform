variable "private_endpoint_name" {
  description = "The name of the private endpoint."
  type        = string
}

variable "location" {
  description = "The location of the private endpoint."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the private endpoint."
  type        = string
}

variable "subnet_id" {
  description = "The ID of the Subnet in which to create the private endpoint."
  type        = string
}

variable "private_service_connection" {
  description = "The name of the private service connection."
  type        = string
}

variable "resource_id" {
  description = "The resource ID of the resource for which a private endpoint is being created."
  type        = string
}

variable "subresource_name" {
  description = "The subresource name which the Private Endpoint is to be connected with."
  type        = string
}