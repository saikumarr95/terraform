variable "static_web_app" {
  type = object({
    name = string
    resource_group_name = string
    location = string
    azure_devops_token = string
    repository_url = string
    branch = string
  })
  description = "This defines the Azure Static Web App configuration."
  sensitive = true
}