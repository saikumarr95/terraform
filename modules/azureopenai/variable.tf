variable "resource_group_name" {  
  description = "Name of the resource group to deploy resources into."  
}  
  
variable "location" {  
  description = "Location of the resource group."  
}  
  
variable "aiops_openai_name" {  
  description = "Name of the Azure Cognitive Services OpenAI resource."  
}  
  
variable "aiops_custom_subdomain_name" {  
  description = "Custom subdomain name for the Azure Cognitive Services OpenAI resource."  
}  

/*
variable "resource_group_name" {
  type=string
  description = "This defines the Azure open ai resource group name"
}
variable "location" {
  type=string
  description = "This defines theopen ai location of resource"
}
variable "azure_openai_service_name" {
  type=string
  description = "This defines the open ai service name."
}
variable "azure_openai_deployment_name" {
  type=string
  description = "This defines the open ai service name."
}
variable "azure_openai_kind" {
  type=string
  description = "This defines the open ai service Kind."
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