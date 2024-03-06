
resource "random_id" "dns-suffix" {
  byte_length = 1
}

resource "azurerm_storage_account" "appstore" { 
  name                     = "stfabricterraform${random_id.dns-suffix.dec}"
  resource_group_name      = local.resource_group_name
  location                 = local.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  account_kind = "StorageV2"
  public_network_access_enabled = false
 
}
/*
resource "azurerm_storage_container" "data" {
  for_each = toset(["st-fab-webjobs-hosts","stfab-webjobs-secrets","st-fab-scm-releases"])
  name                  = each.key
  storage_account_name  = azurerm_storage_account.appstore.name
  container_access_type = "private"
  depends_on = [
    azurerm_storage_account.appstore
  ]
}
*/
