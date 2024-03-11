/*
output "resource_group_name" {
  value = azurerm_service_plan.aiopswebapp_service_plan.resource_group_name
}
output "location" {
  value = azurerm_service_plan.aiopswebapp_service_plan.location
}
output "azure_service_plan_name" {
  value = azurerm_service_plan.aiopswebapp_service_plan.name
}
output "azure_webapp_name" {
  value = azurerm_windows_web_app.aiops_webapp.name
}
*/
output "app_service_plan_id" {  
  value = azurerm_service_plan.aiops_app_service_plan.id  
}  
  
output "web_app_id" {  
  value = azurerm_service.aiops_app.id  
}  
  
output "web_app_default_hostname" {  
  value = azurerm_service.aiops_app.default_site_hostname  
}  
