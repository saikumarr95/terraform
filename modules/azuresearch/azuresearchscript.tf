resource "azurerm_search_service" "search" {
  name                = random_string.azurerm_search_service_name.result
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = var.sku
  lifecycle {
    ignore_changes = [
      # Ignore changes to tags, e.g. because a management agent
      # updates these based on some ruleset managed elsewhere.
      tags,
    ]
  }
}