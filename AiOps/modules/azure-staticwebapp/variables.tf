variable "name" {
  description = "The name of the Static Web App."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the Static Web App."
  type        = string
}

variable "location" {
  description = "The location/region in which to create the Static Web App."
  type        = string
}

variable "azure_devops_token" {
  description = "The Azure DevOps token used to connect the Static Web App to the repository."
  type        = string
  sensitive   = true
}

variable "repository_url" {
  description = "The URL of the Azure DevOps repository to link to the Static Web App."
  type        = string
}

variable "branch" {
  description = "The branch of the Azure DevOps repository to deploy."
  type        = string
}