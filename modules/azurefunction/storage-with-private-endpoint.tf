#Storage account with private endpoint for FunctionApp 

resource "azurerm_storage_account" "aiops-storage" {
  name                     = var.app_function_storageacc_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = var.app_function_storageacc_tier
  account_replication_type = var.app_function_storageacc_replication
  public_network_access_enabled = false
  allow_nested_items_to_be_public = false
  lifecycle {
    ignore_changes = [
      # Ignore changes to tags, e.g. because a management agent
      # updates these based on some ruleset managed elsewhere.
      tags, 
    ]
  }
}

# Private Endpoint Blob
resource "azurerm_private_endpoint" "storage_account_private_endpoint" {  
  name                = var.private_endpoint_name  
  location            = var.location 
  resource_group_name = var.resource_group_name  
  subnet_id           = flatten(data.azurerm_subnet.virtualSubnets1.*.id)[0]
  private_service_connection {  
    name                           = var.private_service_connection
    private_connection_resource_id = azurerm_storage_account.aiops-storage.id  
    is_manual_connection           = false  
    subresource_names              = ["blob"]  
  }  
}

#Private Endpoint Files  
resource "azurerm_private_endpoint" "storage_account_private_endpoint2" {  
  name                = var.private_endpoint_name2  
  location            = var.location 
  resource_group_name = var.resource_group_name  
  subnet_id           = flatten(data.azurerm_subnet.virtualSubnets1.*.id)[0]
  private_service_connection {  
    name                           = var.private_service_connection2
    private_connection_resource_id = azurerm_storage_account.aiops-storage.id  
    is_manual_connection           = false  
    subresource_names              = ["file"]  
  }  
}  
#Private Endpoint Web 
resource "azurerm_private_endpoint" "storage_account_private_endpoint3" {  
  name                = var.private_endpoint_name3  
  location            = var.location 
  resource_group_name = var.resource_group_name  
  subnet_id           = flatten(data.azurerm_subnet.virtualSubnets1.*.id)[0]
  private_service_connection {  
    name                           = var.private_service_connection3
    private_connection_resource_id = azurerm_storage_account.aiops-storage.id  
    is_manual_connection           = false  
    subresource_names              = ["web"]  
  }  
}  

#Private Endpoint Sites
resource "azurerm_private_endpoint" "storage_account_private_endpoint4" {  
  name                = var.private_endpoint_name4  
  location            = var.location 
  resource_group_name = var.resource_group_name  
  subnet_id           = flatten(data.azurerm_subnet.virtualSubnets1.*.id)[0]
  private_service_connection {  
    name                           = var.private_service_connection4
    private_connection_resource_id = azurerm_storage_account.aiops-storage.id  
    is_manual_connection           = false  
    subresource_names              = ["sites"]  
    
  }  
} 



