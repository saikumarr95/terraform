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

module "private_endpoint" {
  source = "./modules/private_endpoint"

  private_endpoint_name       = var.private_endpoint_name
  location                    = var.location
  resource_group_name         = var.resource_group_name
  subnet_id                   = var.subnet_id
  private_service_connection  = var.private_service_connection
  resource_id                 = azurerm_storage_account.appstore.id
  subresource_name            = "blob"
}