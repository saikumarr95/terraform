output "resource_group_name" {
  value = azurerm_cognitive_account.azure_open_ai.resource_group_name
}
output "location" {
  value = azurerm_cognitive_account.azure_open_ai.location
}
output "azure_openai_service_name" {
  value = azurerm_cognitive_account.azure_open_ai.name
}
output "azure_openai_deployment_name" {
  value = azurerm_cognitive_deployment.azure_open_ai_deployment.name
}