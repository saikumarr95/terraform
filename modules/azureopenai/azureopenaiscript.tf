resource "azurerm_cognitive_account" "azure_open_ai" {
  name = var.azure_openai_service_name
  location =var.location
  resource_group_name = var.resource_group_name
  kind = var.azure_openai_kind
  sku_name = var.sku_name
  public_network_access_enabled = false
  lifecycle {
    ignore_changes = [
      # Ignore changes to tags, e.g. because a management agent
      # updates these based on some ruleset managed elsewhere.
      tags,
    ]
  }
  }


resource "azurerm_cognitive_deployment" "azure_open_ai_deployment" {
  name = var.azure_openai_deployment_name
  cognitive_account_id = azurerm_cognitive_account.azure_open_ai.id
  model {
    format = "OpenAI"
    name = "gpt-4"
    #version = "0301" set to default version
    #version = "1106-preview"
    version = "0613"
  }
  scale {
    type= "standard"
  }
  
}
