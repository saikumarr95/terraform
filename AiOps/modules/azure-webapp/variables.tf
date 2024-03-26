variable "aiops_serviceplan_name" {
  description = "The name of the service plan"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The location of the resources"
  type        = string
}

variable "os_type" {
  description = "The OS type of the service plan"
  type        = string
}

variable "aiops_webapp_name" {
  description = "The name of the web app"
  type        = string
}

variable "common_tags" {
  description = "Common tags to be applied to resources"
  type        = map(string)
  default     = {
    ManagedBy   = "Terraform"
    Environment = "Production"
  }
}

variable "ip_restrictions" {
  description = "IP restrictions for the web app"
  type        = list(map(string))
  default     = []
}