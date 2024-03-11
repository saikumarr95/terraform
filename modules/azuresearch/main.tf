/*
resource "azurerm_resource_group" "rg-aiops-dev-mvp-eus" {
  name     = var.resource_group_name
  location = var.location  
}
*/

resource "random_string" "azurerm_search_service_name" {
  length  = 12
  upper   = false
  numeric = false
  special = false
}