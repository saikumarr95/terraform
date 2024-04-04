variable "storage_account" {
  type = object({
    azure_resource_name = string
    resource_group_name = string
    location = string
    subnet_id = string
    environment = string
  })
  description = "This defines the Azure Storage Account configuration."
  default = {
    environment = "development"
  }
}