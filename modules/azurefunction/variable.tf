// Resource group and location will be inherited from webappapp module
variable "resource_group_name" {
  type=string
  description = "This defines the function resource group name"
}
variable "location" {
  type=string
  description = "This defines function location of resource"
}
variable "app_linux_function_serviceplan_name" {
  type=string
  description = "This defines the function service plan name."
}
#variable "app_function_serviceplan_kind" {
#  type=string
#  description = "This defines the function service plan name."
#}

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
variable "app_linux_function_name" {
  type=string
  description = "This defines the function name."
}

##storage account variables

variable "private_endpoint_name" {  
  type        = string  
  description = "The name of the private endpoint."
  default     = "pe-st-fa-terraform999"  
}  

variable "private_service_connection" {  
  type        = string  
  description = "The name of the private service connection to create."  
 default = "psc-st-fa-blob-terraform-private-connection"
}

variable "private_endpoint_name2" {  
  type        = string  
  description = "The name of the private endpoint."
  default = "pe2-st-fa-terraform999"  
}  
variable "private_service_connection2" {  
  type        = string  
  description = "The name of the private service connection to create."  
 default = "psc2-st-fa-file-terraform-private-connection"
}
variable "private_endpoint_name3" {  
  type        = string  
  description = "The name of the private endpoint."
  default = "pe3-st-fa-terraform999"  
}  
variable "private_service_connection3" {  
  type        = string  
  description = "The name of the private service connection to create."  
 default = "psc3-st-fa-web-terraform-private-connection"
}
/*
variable "private_endpoint_name4" {  
  type        = string  
  description = "The name of the private endpoint."
  default = "pe4-st-fa-terraform999"  
}  
variable "private_service_connection4" {  
  type        = string  
  description = "The name of the private service connection to create."  
 default = "psc4-st-fa-sites-terraform-private-connection"
}
*/


