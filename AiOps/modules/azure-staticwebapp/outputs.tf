output "static_web_app_id" {
  description = "The ID of the Static Web App."
  value       = azurerm_static_site.static_site.id
}

output "static_web_app_default_hostname" {
  description = "The default hostname of the Static Web App."
  value       = azurerm_static_site.static_site.default_hostname
}