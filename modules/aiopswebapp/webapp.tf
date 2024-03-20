
resource "azurerm_service_plan" "aiopswebapp_service_plan" {
  name                = var.aiops_serviceplan_name
  resource_group_name = var.resource_group_name
  location            = var.location
  os_type             = var.os_type
  sku_name            = "P1v3"
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
  app_settings = {  
    "PYTHON_VERSION" = "3.10"  
  }  
  site_config {
   
  }
  lifecycle {
    ignore_changes = [
      # Ignore changes to tags, e.g. because a management agent
      # updates these based on some ruleset managed elsewhere.
      tags,
    ]
  }
  depends_on = [
    azurerm_service_plan.aiopswebapp_service_plan
  ]
}
