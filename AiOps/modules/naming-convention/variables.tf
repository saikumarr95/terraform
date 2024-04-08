variable "resource_config" {
  description = "Configuration for the resource."
  type = object({
    resource_name    = string
    project_name     = string
    environment_name = string
    number           = string
    location         = string
  })
}