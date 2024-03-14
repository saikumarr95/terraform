# Outputs for azure_storageaccount_module  
output "storage_account_name" {  
  value = module.azure_storageaccount_module.storage_account_name  
}  
  
# Outputs for azure_search_module  
output "search_service_name" {  
  value = module.azure_search_module.search_service_name  
}  
  
# Outputs for azure_openai_module  
output "openai_service_endpoint" {  
  value = module.azure_openai_module.openai_service_endpoint  
}  
  
# Outputs for azure_webapp_module  
output "webapp_url" {  
  value = module.azure_webapp_module.webapp_url  
}  
  
# Outputs for azure_functionapp_module  
output "functionapp_url" {  
  value = module.azure_functionapp_module.functionapp_url  
}  
