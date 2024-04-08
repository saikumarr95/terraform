variable "resource_name" {
  description = "The name of the resource."
  type        = string
}

variable "project_name" {
  description = "The name of the project."
  type        = string
}

variable "environment_name" {
  description = "The name of the environment."
  type        = string
}

variable "number" {
  description = "A number to ensure the name is unique."
  type        = string
}

variable "location" {
  description = "The location where the resource will be used."
  type        = string
}

locals {
  name = "${var.resource_name}-${var.project_name}-${var.environment_name}-${var.number}-${var.location}"
}

output "name" {
  description = "The generated name for the resource."
  value       = local.name
}