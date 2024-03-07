resource "random_id" "dns-suffix" {
  byte_length = 1
}

resource "azurerm_storage_account" "appstore" { 
  name                     = "stfabricterraform${random_id.dns-suffix.dec}"
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  account_kind = "StorageV2"
  public_network_access_enabled = false
 
}
# Container

resource "azurerm_storage_container" "data" {
  for_each = toset(["st-fab-webapps-hosts","stfab-webapps-secrets","st-fab-scm-releases"])
  name                  = each.key
  storage_account_name  = azurerm_storage_account.appstore.name
  container_access_type = "private"
  depends_on = [
    azurerm_storage_account.appstore
  ]
}