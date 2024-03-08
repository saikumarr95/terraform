resource "azurerm_search_service" "search" {
  name                = random_string.azurerm_search_service_name.result
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = var.sku
}