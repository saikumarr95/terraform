
resource "azurerm_service_plan" "aiopswebapp_service_plan" {
  name                = var.aiops_serviceplan_name
  resource_group_name = var.resource_group_name
  location            = var.location
  os_type             = var.os_type
  sku_name            = var.sku_name
 # depends_on = [
 #   azurerm_resource_group.rg-AIOps-Corp-Connectivity-eus
 # ]
}
/*
resource "azurerm_windows_web_app" "aiops_webapp" {
  name                = var.aiops_webapp_name
  resource_group_name = var.resource_group_name
  location            = var.location
  service_plan_id     = azurerm_service_plan.aiopswebapp_service_plan.id

  site_config {
    application_stack {
      current_stack=var.current_stack
      dotnet_version= var.dotnet_version
    }
  }

  depends_on = [
    azurerm_service_plan.aiopswebapp_service_plan
  ]
}
*/
##
resource "azurerm_app_service" "aiops_webapp" {  
  name                = var.aiops_webapp_name
  resource_group_name = var.resource_group_name
  location            = var.location
  service_plan_id     = azurerm_service_plan.aiopswebapp_service_plan.id
  site_config {  
    app_command_line = "python manage.py runserver 0.0.0.0:8000"  
    linux_fx_version = "PYTHON|3.8"  
  }  
  
  app_settings = {  
    "WEBSITE_RUN_FROM_PACKAGE" = "1"  
  }  
  
  depends_on = [
    azurerm_service_plan.aiopswebapp_service_plan
  ]
}  