/*
resource "azurerm_cognitive_account" "ai_account" {  
  name                = var.ai_account_name  
  resource_group_name = azurerm_resource_group.rg.name  
  kind                = "CognitiveServices"  
  sku_name            = var.ai_account_sku  
  identity {  
    type = "SystemAssigned"  
  }  
}  
resource "azurerm_cognitive_account_openai" "openai" {  
  name                = var.openai_name  
  resource_group_name = azurerm_resource_group.rg.name  
  kind                = "OpenAi"  
  sku_name            = var.openai_sku  
  identity {  
    type = "SystemAssigned"  
  }  
}  
resource "azurerm_cognitive_account_search" "ai_search" {  
  name                = var.ai_search_name  
  resource_group_name = azurerm_resource_group.rg.name  
  kind                = "AzureSearch"  
  sku_name            = var.ai_search_sku  
  identity {  
    type = "SystemAssigned"  
  }  
}  
*/

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
