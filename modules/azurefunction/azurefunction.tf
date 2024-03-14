/*
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
*/

resource "azurerm_service_plan" "function-appserviceplan" {
  name                = var.app_linux_function_serviceplan_name
  location            = var.location
  resource_group_name = var.resource_group_name
  #kind                = var.app_linux_function_serviceplan_kind
  sku_name   = "P1v3" 
  os_type    = "Linux"
}


resource "azurerm_linux_function_app" "function_name" {
  name                       = var.app_linux_function_name
  location                   = var.location
  resource_group_name        = var.resource_group_name
  service_plan_id            = azurerm_service_plan.function-appserviceplan.id
  storage_account_name       = azurerm_storage_account.aiops-storage.name
  storage_account_access_key = azurerm_storage_account.aiops-storage.primary_access_key
  https_only                 = true
  public_network_access_enabled = false
  depends_on = [ azurerm_storage_account.aiops-storage ]
  app_settings = {
      WEBSITE_RUN_FROM_PACKAGE = "https://faaiops999.blob.core.windows.net/func/HttpTrigger1.zip?sp<sastoken>"
      "FUNCTIONS_WORKER_RUNTIME" = "python",
      "AzureWebJobsDisableHomepage" = "true",
      "SCM_DO_BUILD_DURING_DEPLOYMENT" =  "true"
  }
  site_config {
    application_stack {
      python_version = "3.10"
      }
    elastic_instance_minimum = 1
    }
}

# vnet connection
/*
resource "azurerm_app_service_virtual_network_swift_connection" "example" {
  app_service_id = azurerm_linux_function_app.example.id
  subnet_id           = flatten(data.azurerm_subnet.virtualSubnets1.*.id)[0]
}
*/

