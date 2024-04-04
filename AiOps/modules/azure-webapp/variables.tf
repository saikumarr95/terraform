variable "aiops" {
  type = object({
    serviceplan_name = string
    resource_group_name = string
    location = string
    os_type = string
    webapp_name = string
    common_tags = map(string)
    ip_restrictions = list(map(string))
  })
  description = "This defines the AIOPS configuration."
  default = {
    common_tags = {
      ManagedBy   = "Terraform"
      Environment = "Production"
    }
    ip_restrictions = []
  }
}