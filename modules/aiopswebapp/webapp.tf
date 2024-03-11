
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

resource "azurerm_linux_web_app" "aiops_webapp" {
  name                = var.aiops_webapp_name
  resource_group_name = var.resource_group_name
  location            = var.location
  service_plan_id     = azurerm_service_plan.aiopswebapp_service_plan.id
  https_only          = true
  public_network_access_enabled = false
  site_config {
   # application_stack {
   #   current_stack=var.current_stack
   #   dotnet_version= var.dotnet_version
   # }
  }

  depends_on = [
    azurerm_service_plan.aiopswebapp_service_plan
  ]
}
##
/*
#resource "azurerm_app_service_plan" "aiops_app_service_plan" {  
resource "azurerm_service_plan" "aiops_app_service_plan" {  
  name                = var.aiops_serviceplan_name  
  resource_group_name = var.resource_group_name  
  location            = var.location
  os_type             = "Linux"
  sku_name            = "P1v3"  
#  sku {  
#    tier = "Basic"  
#    size = "B1"  
#  }  
}  
# azurerm_windows_web_app
#resource "azurerm_app_service" "aiops_app" { 
resource "azurerm_linux_web_app" "aiops_app" {  
  name                = var.aiops_webapp_name  
  resource_group_name = var.resource_group_name  
  location            = var.location  
#  app_service_plan_id = azurerm_app_service_plan.aiops_app_service_plan.id 
  service_plan_id = azurerm_service_plan.aiops_app_service_plan.id 
  https_only          = true
  public_network_access_enabled = false
  site_config {  
    app_command_line = "python manage.py runserver 0.0.0.0:8000"  
    linux_fx_version = "PYTHON|3.8"  
  }  
  
  app_settings = {  
    "WEBSITE_RUN_FROM_PACKAGE" = "1"  
  }  
  
  depends_on = [  
    azurerm_service_plan.aiops_app_service_plan  
  ]  
}  
*/