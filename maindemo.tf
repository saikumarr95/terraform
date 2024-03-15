#Terraform Modules for AIOPS   
  
module "azure_storageaccount_module" {  
  source = "./modules/storageaccount_aiops"  
  resource_group_name = var.resource_group_name_storage  
  location = var.location_storage  
    
}  
  
module "azure_search_module" {  
  source = "./modules/azuresearch"  
  resource_group_name = var.resource_group_name_search  
  location = var.location_search  
  azure_search_service_name = var.azure_search_service_name  
}  
  
module "azure_openai_module" {  
  source = "./modules/azureopenai"  
  resource_group_name = var.resource_group_name_openai  
  location = var.location_openai  
  azure_openai_service_name = var.azure_openai_service_name  
  azure_openai_deployment_name = var.azure_openai_deployment_name  
  azure_openai_kind = var.azure_openai_kind  
}  
  
module "azure_webapp_module" {  
  source = "./modules/aiopswebapp"  
  resource_group_name = var.resource_group_name_webapp  
  location = var.location_webapp  
  aiops_serviceplan_name = var.aiops_serviceplan_name  
  aiops_webapp_name = var.aiops_webapp_name  
  os_type = var.os_type  
}  
  
module "azure_functionapp_module" {  
  source = "./modules/azurefunction"  
  resource_group_name = var.resource_group_name_functionapp  
  location = var.location_functionapp  
  app_function_storageacc_name = var.app_function_storageacc_name  
  app_function_storageacc_replication = var.app_function_storageacc_replication  
  app_function_storageacc_tier = var.app_function_storageacc_tier  
  app_linux_function_name = var.app_linux_function_name  
  app_linux_function_serviceplan_name = var.app_linux_function_serviceplan_name  
}  
