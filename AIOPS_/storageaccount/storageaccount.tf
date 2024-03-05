resource "azurerm_storage_account" "staiopsmvp" {
  name                     = var.storageaccount_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = var.storageacc_account_tier
  account_replication_type = var.storage_account_replication_type
  public_network_access_enabled = false
}