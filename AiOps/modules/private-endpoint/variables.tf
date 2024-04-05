
variable "private_endpoints" {
  type = list(object({
    name = string
    location = string
    resource_group_name = string
    subnet_id = string
    private_service_connection = string
    resource_id = string
    subresource_name = string
  }))
  description = "This defines the Azure Private Endpoint configurations."
}