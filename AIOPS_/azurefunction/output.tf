output "resource_group_name" {
  value = azurerm_app_service_plan.function-appserviceplan.resource_group_name
}
output "location" {
  value = azurerm_app_service_plan.function-appserviceplan.location
}
/*output "azure_service_plan_name" {
  value = azurerm_service_plan.aiopswebapp_service_plan.name
}
output "azure_webapp_name" {
  value = azurerm_windows_web_app.aiops_webapp.name
}*/