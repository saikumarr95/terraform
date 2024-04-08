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
  for_each = { for endpoint in var.private_endpoints : endpoint.name => endpoint }

  private_endpoint_name       = each.value.name
  location                    = each.value.location
  resource_group_name         = each.value.resource_group_name
  subnet_id                   = each.value.subnet_id
  private_service_connection  = each.value.private_service_connection
  resource_id                 = each.value.resource_id
  subresource_name            = each.value.subresource_name
}


#definiton for create multiple azure search services and attaching private endpoint to same

module "search_service" {
  source = "./modules/azure-search"  // adjust this path to point to your module

  for_each = { for service in var.azure_search_services : service.search_service_name => service }

  search_service_name = each.value.search_service_name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  sku                 = each.value.sku
}

module "private_endpoint_search_service" {
  source = "./modules/private_endpoint"

  for_each = { for service in var.azure_search_services : service.search_service_name => service }

  private_endpoint_name       = each.value.private_endpoint_name
  location                    = each.value.location
  resource_group_name         = each.value.resource_group_name
  subnet_id                   = each.value.subnet_id
  private_service_connection  = each.value.private_service_connection
  resource_id                 = module.search_service[each.key].id
  subresource_name            = each.value.subresource_name
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