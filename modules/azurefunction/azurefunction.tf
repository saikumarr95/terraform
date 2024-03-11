resource "azurerm_storage_account" "function-appserviceplan" {
  name                     = "fa-aiops-terraform-001"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_service_plan" "function-appserviceplan" {
  name                = "example-app-service-plan"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  os_type             = "Linux"
  sku_name            = "Y1"
}

resource "azurerm_linux_function_app" "" {
  name                = "example-linux-function-app"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location

  storage_account_name       = azurerm_storage_account.example.name
  storage_account_access_key = azurerm_storage_account.example.primary_access_key
  service_plan_id            = azurerm_service_plan.example.id

  site_config {}
}




/*

resource "azurerm_app_service_plan" "function-appserviceplan" {
  name                = var.app_function_serviceplan_name
  location            = var.location
  resource_group_name = var.resource_group_name
  kind                = var.app_function_serviceplan_kind
  reserved = true
  sku {
    tier = "Dynamic"
    size = "Y1"
  }
}
resource "azurerm_storage_account" "aiops-storage" {
  name                     = var.app_function_storageacc_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = var.app_function_storageacc_tier
  account_replication_type = var.app_function_storageacc_replication
}
resource "azurerm_function_app" "function_name" {
  name                       = var.app_function_name
  location                   = var.location
  resource_group_name        = var.resource_group_name
  app_service_plan_id        = azurerm_app_service_plan.function-appserviceplan.id
  storage_account_name       = azurerm_storage_account.aiops-storage.name
  storage_account_access_key = azurerm_storage_account.aiops-storage.primary_access_key
}
*/