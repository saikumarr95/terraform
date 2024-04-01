resource "azurerm_static_site" "static_site" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  sku_tier            = "Free"
  sku_size            = "Standard"

  source {
    repository_url   = var.repository_url
    branch           = var.branch
    repository_token = var.github_token
  }
}