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

# Create container

resource "azurerm_storage_container" "data" {
  for_each = toset(["st-fab-webjobs-hosts","stfab-webjobs-secrets","st-fab-scm-releases"])
  name                  = each.key
  storage_account_name  = azurerm_storage_account.appstore.name
  container_access_type = "blob"
  depends_on = [
    azurerm_storage_account.appstore
  ]
}

resource "azurerm_storage_blob" "files" {
  for_each = {
    sample1="C:\\tmp\\sample1.txt"
    sample2="C:\\tmp\\sample2.txt"
    sample3="C:\\tmp\\sample3.txt"
  }
  name                   = each.key
  storage_account_name   = azurerm_storage_account.appstore.name
  storage_container_name = "data"
  type                   = "Block"
  source                 = each.value
  depends_on = [
    azurerm_storage_account.appstore
  ]
}
