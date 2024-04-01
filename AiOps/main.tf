module "azure_webapp" {
  source = "./modules/azure-webapp"  # adjust this path to point to your module

  aiops_serviceplan_name = var.aiops_serviceplan_name
  resource_group_name    = var.resource_group_name
  location               = var.location
  os_type                = var.os_type
  aiops_webapp_name      = var.aiops_webapp_name
  common_tags            = var.common_tags
  ip_restrictions        = var.ip_restrictions
}

module "private_endpoint_azure_webapp" {
  source = "./modules/private_endpoint"

  private_endpoint_name       = var.private_endpoint_name
  location                    = var.location
  resource_group_name         = var.resource_group_name
  subnet_id                   = var.subnet_id
  private_service_connection  = var.private_service_connection
  resource_id                 = azurerm_storage_account.appstore.id
  subresource_name            = "blob"
}

module "search_service" {
  source = "./modules/azure-search" // path to your module

  search_service_name = random_string.azurerm_search_service_name.result
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = var.sku
  
}

module "storage_account" {
  source = "./modules/storage_account"  # update with the actual path to the module

  resource_group_name = var.resource_group_name
  location            = var.location
  subnet_id           = var.subnet_id
  environment         = "staging"

 module "static_web_app" {
  source = "./modules/static_web_app"  # update with the actual path to the module

  name                 = var.name
  resource_group_name  = var.resource_group_name
  location             = var.location
  azure_devops_token   = var.github_token
  repository_url       = "https://dev.azure.com/my_organization/my_project/_git/my_repository"
  branch               = "main"
} 
}