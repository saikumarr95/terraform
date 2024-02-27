data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "appvault" {
  name                       = "kvfabterraesu${random_id.dns-suffix.dec}"
  location                   = local.location
  resource_group_name        = local.resource_group_name
  tenant_id                  = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days = 90
  purge_protection_enabled   = false

  sku_name = "standard"

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id
 
  key_permissions = [
      "Get", "Update", "List", "Delete"
    ]

  secret_permissions = [
      "Get", "Set", "Delete", "List", "Recover", "Purge"
    ]
  }
  depends_on = [
    azurerm_resource_group.appgrp
  ]

  timeouts {
    create = "45m"
    delete = "1h"
  }
   
}

resource "azurerm_key_vault_secret" "vmpassword" {
  name         = "vmpassword"
  value        = "Azure@123"
  key_vault_id = azurerm_key_vault.appvault.id
  depends_on = [
    azurerm_key_vault.appvault
  ]
    
  timeouts {
    create = "45m"
    delete = "1h"
  }

}
