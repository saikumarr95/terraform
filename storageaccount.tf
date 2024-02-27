resource "random_id" "dns-suffix" {
  byte_length = 1
}

resource "azurerm_storage_account" "appstore" { 
  name                     = "cgpprdedasbwk${random_id.dns-suffix.dec}"
  resource_group_name      = local.resource_group_name
  location                 = local.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  account_kind = "StorageV2"
  depends_on = [
    azurerm_resource_group.appgrp
  ]
}

resource "azurerm_storage_container" "data" {
  for_each = toset(["azure-webjobs-hosts","azure-webjobs-secrets","scm-releases"])
  name                  = each.key
  storage_account_name  = azurerm_storage_account.appstore.name
  container_access_type = "private"
  depends_on = [
    azurerm_storage_account.appstore
  ]
}

