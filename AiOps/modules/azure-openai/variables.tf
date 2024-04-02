variable "azure_openai_service_name" {
  description = "The name of the Azure OpenAI service"
  type        = string
}

variable "location" {
  description = "The location where the Azure OpenAI service should be created"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the Azure OpenAI service"
  type        = string
}

variable "azure_openai_kind" {
  description = "The kind of the Azure OpenAI service"
  type        = string
}

variable "sku_name" {
  description = "The SKU name for the Azure OpenAI service"
  type        = string
}

variable "azure_openai_deployment_name" {
  description = "The name of the Azure OpenAI deployment"
  type        = string
}