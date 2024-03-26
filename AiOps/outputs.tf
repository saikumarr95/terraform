output "service_plan_id" {
  description = "The ID of the created service plan"
  value       = azurerm_service_plan.aiopswebapp_service_plan.id
}

output "web_app_default_site_hostname" {
  description = "The default hostname of the web app"
  value       = azurerm_linux_web_app.aiops_webapp.default_site_hostname
}