

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