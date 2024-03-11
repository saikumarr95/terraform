/*
variable "resource_group_name" {
  type=string
  description = "This defines the Webapp ai resource group name"
}
variable "location" {
  type=string
  description = "This defines the Webapp location of resource"
}
variable "aiops_serviceplan_name" {
  type=string
  description = "This defines the Webapp service plan name."
}
variable "aiops_webapp_name" {
  type=string
  description = "This defines the Webapp service name."
}
variable "os_type" {
  type=string
  description = "This defines the Webapp service name."
}
variable "current_stack" {
  type=string
  description = "This defines the Webapp stack name."
}
variable "dotnet_version" {
  type=string
  description = "This defines the stack version."
}
variable "sku_name" {
  description = "The pricing tier of the search service you want to create (for example, basic or standard)."
  default     = "S0"
  type        = string
  validation {
    condition     = contains(["S0", "S1"], var.sku_name)
    error_message = "The sku must be one of the following values: S0,S1."
  }
}
*/
variable "resource_group_name" {  
  description = "Name of the resource group to deploy resources into."  
}  
  
variable "location" {  
  description = "Location of the resource group."  
}  
  
variable "aiops_serviceplan_name" {  
  description = "Name of the app service plan."  
}  
  
variable "aiops_webapp_name" {  
  description = "Name of the web app."  
}  

