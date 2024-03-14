# Variables for azure_storageaccount_module  
variable "resource_group_name_storage" {  
  type = string  
  default = "rg-AIOps-Corp-Connectivity-eus"  
}  
  
variable "location_storage" {  
  type = string  
  default = "eastus"  
}  
  
# Variables for azure_search_module  
variable "resource_group_name_search" {  
  type = string  
  default = "rg-AIOps-Corp-Connectivity-eus"  
}  
  
variable "location_search" {  
  type = string  
  default = "eastus"  
}  
  
variable "azure_search_service_name" {  
  type = string  
  default = "as-aiops-mvp-eus"  
}  
  
# Variables for azure_openai_module  
variable "resource_group_name_openai" {  
  type = string  
  default = "rg-AIOps-Corp-Connectivity-eus"  
}  
  
variable "location_openai" {  
  type = string  
  default = "eastus"  
}  
  
variable "azure_openai_service_name" {  
  type = string  
  default = "azopenai-aiops-terraform-mvp-eus"  
}  
  
variable "azure_openai_deployment_name" {  
  type = string  
  default = "azopenai-deployment-aiops-terraform-003-eus"  
}  
  
variable "azure_openai_kind" {  
  type = string  
  default = "OpenAI"  
}  
  
# Variables for azure_webapp_module  
variable "resource_group_name_webapp" {  
  type = string  
  default = "rg-AIOps-Corp-Connectivity-eus"  
}  
  
variable "location_webapp" {  
  type = string  
  default = "eastus"  
}  
  
variable "aiops_serviceplan_name" {  
  type = string  
  default = "wa-aiops-service-plan-003"  
}  
  
variable "aiops_webapp_name" {  
  type = string  
  default = "wa-aiops-terraform-003"  
}  
  
variable "os_type" {  
  type = string  
  default = "Linux"  
}  
  
# Variables for azure_functionapp_module  
variable "resource_group_name_functionapp" {  
  type = string  
  default = "rg-AIOps-Corp-Connectivity-eus"  
}  
  
variable "location_functionapp" {  
  type = string  
  default = "eastus"  
}  
  
variable "app_function_storageacc_name" {  
  type = string  
  default = "stfaaiopterraformesu99"  
}  
  
variable "app_function_storageacc_replication" {  
  type = string  
  default = "LRS"  
}  
  
variable "app_function_storageacc_tier" {  
  type = string  
  default = "Standard"  
}  
  
variable "app_linux_function_name" {  
  type = string  
  default = "fa-linux-aiops-terraform99"  
}  
  
variable "app_linux_function_serviceplan_name" {  
  type = string  
  default = "faaiopsappfunctionspn99"  
}  
