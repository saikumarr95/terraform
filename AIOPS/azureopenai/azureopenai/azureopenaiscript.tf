resource "azurerm_cognitive_account" "azure_open_ai" {
  name = var.azure_openai_service_name
  location =var.location
  resource_group_name = var.resource_group_name
  kind = var.azure_openai_kind
  sku_name = var.sku_name
  public_network_access_enabled = false
  }

resource "azurerm_cognitive_deployment" "azure_open_ai_deployment" {
  name = var.azure_openai_deployment_name
  cognitive_account_id = azurerm_cognitive_account.azure_open_ai.id
  model {
    format = "OpenAI"
    name = "gpt-35-turbo"
    version = "0301"
  }
  scale {
    type= "standard"
  }
}