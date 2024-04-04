resource "azurerm_key_vault" "kv" {
  name                        = var.keyvault.name
  location                    = var.keyvault.location
  resource_group_name         = var.keyvault.resource_group_name
  tenant_id                   = var.keyvault.tenant_id
  sku_name                    = var.keyvault.sku_name
  purge_protection_enabled    = true
  soft_delete_retention_days  = 7

  access_policy {
    dynamic "access_policy" {
      for_each = var.keyvault.access_policies
      content {
        tenant_id = access_policy.value.tenant_id
        object_id = access_policy.value.object_id

        key_permissions = access_policy.value.key_permissions
        secret_permissions = access_policy.value.secret_permissions
        certificate_permissions = access_policy.value.certificate_permissions
      }
    }
  }
}

resource "azurerm_private_endpoint" "pe" {
  name                = "${var.keyvault.name}-PE"
  location            = var.keyvault.location
  resource_group_name = var.keyvault.resource_group_name
  subnet_id           = var.keyvault.private_endpoint_id

  private_service_connection {
    name                           = "${var.keyvault.name}-PSC"
    is_manual_connection           = false
    private_connection_resource_id = azurerm_key_vault.kv.id
    subresource_names              = ["vault"]
  }
}