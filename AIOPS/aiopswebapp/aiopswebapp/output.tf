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