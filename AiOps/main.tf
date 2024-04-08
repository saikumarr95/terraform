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
}


 #definition to craete multiple azure static webapp and then attach private endpoints to them
 
module "static_web_app" {
  source = "./modules/static_web_app"  // adjust this path to point to your module

  for_each = { for app in var.azure_static_web_apps : app.name => app }

  name                 = each.value.name
  resource_group_name  = each.value.resource_group_name
  location             = each.value.location
  azure_devops_token   = each.value.azure_devops_token
  repository_url       = each.value.repository_url
  branch               = each.value.branch
}

module "private_endpoint_static_web_app" {
  source = "./modules/private_endpoint"

  for_each = { for app in var.azure_static_web_apps : app.name => app }

  private_endpoint_name       = each.value.private_endpoint_name
  location                    = each.value.location
  resource_group_name         = each.value.resource_group_name
  subnet_id                   = each.value.subnet_id
  private_service_connection  = each.value.private_service_connection
  resource_id                 = module.static_web_app[each.key].id
  subresource_name            = each.value.subresource_name
}


