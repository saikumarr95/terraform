resource "random_id" "dns_suffix" {
  byte_length = 1
}

resource "azurerm_storage_account" "appstore" { 
  name                     = "staiopsterraform${random_id.dns_suffix.dec}"
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  account_kind             = "StorageV2"
  public_network_access_enabled = false
  allow_nested_items_to_be_public = false
}

resource "azurerm_private_endpoint" "storage_account_private_endpoint" {  
  name                = var.private_endpoint_name  
  location            = var.location 
  resource_group_name = var.resource_group_name  
  subnet_id           = flatten(data.azurerm_subnet.virtualSubnets1.*.id)[0]  

  private_service_connection {  
    name                           = var.private_service_connection
    private_connection_resource_id = azurerm_storage_account.appstore.id  
    is_manual_connection           = false  
    subresource_names              = ["blob"]  
  }  

  lifecycle {
    ignore_changes = [
      tags, 
      private_dns_zone_group,
    ]
  }

  depends_on = [azurerm_storage_account.appstore]
}