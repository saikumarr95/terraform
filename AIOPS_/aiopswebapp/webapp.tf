
resource "azurerm_service_plan" "aiopswebapp_service_plan" {
  name                = var.aiops_serviceplan_name
  resource_group_name = var.resource_group_name
  location            = var.location
  os_type             = var.os_type
  sku_name            = var.sku_name
  depends_on = [
    azurerm_resource_group.rg-aiops-dev-mvp-eus
  ]
}

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