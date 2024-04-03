variable "azure_openai" {
  type = object({
    service_name = string
    location = string
    resource_group_name = string
    kind = string
    sku_name = string
    deployment_name = string
  })
  description = "This defines the Azure OpenAI configuration."
}