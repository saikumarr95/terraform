output "private_endpoint_id" {
  description = "The ID of the private endpoint."
  value       = azurerm_private_endpoint.generic_private_endpoint.id
}