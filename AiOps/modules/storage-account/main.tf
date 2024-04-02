resource "random_id" "dns_suffix" {
  byte_length = 4
  keepers = {
    # Generate a new ID only when a new resource group is defined
    resource_group = var.resource_group_name
  }
}

resource "azurerm_storage_account" "appstore" { 
  name                     = "staaiops${var.azure_resource_name}${random_id.dns_suffix.dec}"
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  account_kind             = "StorageV2"
  
  enable_https_traffic_only = true
  is_hns_enabled           = true

  network_rules {
    default_action             = "Deny"
    virtual_network_subnet_ids = [var.subnet_id]
    bypass                     = ["AzureServices"]
  }

  tags = {
    environment = var.environment
  }
}