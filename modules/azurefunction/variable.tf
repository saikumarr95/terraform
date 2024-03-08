// Resource group and location will be inherited from webappapp module
variable "resource_group_name" {
  type=string
  description = "This defines the function resource group name"
}
variable "location" {
  type=string
  description = "This defines function location of resource"
}
variable "app_function_serviceplan_name" {
  type=string
  description = "This defines the function service plan name."
}
variable "app_function_serviceplan_kind" {
  type=string
  description = "This defines the function service plan name."
}
variable "app_function_storageacc_name" {
  type=string
  description = "This defines the function storage acc"
}
variable "app_function_storageacc_tier" {
  type=string
  description = "This defines the function storage acc"
}
variable "app_function_storageacc_replication" {
  type=string
  description = "This defines the function storage acc"
}
variable "app_function_name" {
  type=string
  description = "This defines the function name."
}

