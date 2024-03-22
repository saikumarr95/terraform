#Function App Service plan

resource "azurerm_service_plan" "function-appserviceplan" {
  name                = var.app_linux_function_serviceplan_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku_name   = "P1v3" 
  os_type    = "Linux"
  lifecycle {
    ignore_changes = [
      # Ignore changes to tags, e.g. because a management agent
      # updates these based on some ruleset managed elsewhere.
      tags, 
    ]
  }
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

#Sample function
/*
resource "azurerm_function_app_function" "sample_function" {
  name            = "sample-function-app-function"
  function_app_id = azurerm_linux_function_app.function_name.id
  language        = "Python"
  test_data = jsonencode({
    "name" = "Azure"
  })
  config_json = jsonencode({
    "bindings" = [
      {
        "authLevel" = "function"
        "direction" = "in"
        "methods" = [
          "get",
          "post",
        ]
        "name" = "req"
        "type" = "httpTrigger"
      },
      {
        "direction" = "out"
        "name"      = "$return"
        "type"      = "http"
      },
    ]
  })
}

*/


# vnet connection

resource "azurerm_app_service_virtual_network_swift_connection" "vnet_integration" {
  app_service_id = azurerm_linux_function_app.function_name.id
  subnet_id           = flatten(data.azurerm_subnet.virtualSubnets1.*.id)[0]
}

