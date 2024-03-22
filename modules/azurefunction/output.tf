/*
output "resource_group_name" {
  value = azurerm_app_service_plan.function-appserviceplan.resource_group_name
}
output "location" {
  value = azurerm_app_service_plan.function-appserviceplan.location
}
output "azure_service_plan_name" {
  value = azurerm_service_plan.aiopswebapp_service_plan.name
}
output "azure_webapp_name" {
  value = azurerm_windows_web_app.aiops_webapp.name
}
*/

output "private_endpoint_id" {  
  value = azurerm_private_endpoint.storage_account_private_endpoint4.id  
}  

# Fetch subnet_id
output "virtualnetwork_subnets_ids" {
  value = data.azurerm_subnet.virtualSubnets1.*.id
}