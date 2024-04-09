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


#definition for storage account 


module "storage_account" {
  source = "./modules/storage_account"  // adjust this path to point to your module

  for_each = { for account in var.azure_storage_accounts : account.name => account }

  name                 = each.value.name
  resource_group_name  = each.value.resource_group_name
  location             = each.value.location
  subnet_id            = each.value.subnet_id
  environment          = each.value.environment
}

module "private_endpoint_storage_account" {
  source = "./modules/private_endpoint"

  for_each = { for account in var.azure_storage_accounts : account.name => account }

  private_endpoint_name       = each.value.private_endpoint_name
  location                    = each.value.location
  resource_group_name         = each.value.resource_group_name
  subnet_id                   = each.value.subnet_id
  private_service_connection  = each.value.private_service_connection
  resource_id                 = module.storage_account[each.key].id
  subresource_name            = each.value.subresource_name
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
  sku                  = each.value.sku
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

#Definiiton for azure openai


module "azure_openai" {
  source = "./modules/azure_openai"  // adjust this to the actual path of your module

  for_each = { for ai in var.azure_openai : ai.service_name => ai }

  azure_openai_service_name = each.value.service_name
  location = each.value.location
  resource_group_name = each.value.resource_group_name
  azure_openai_kind = each.value.kind
  sku_name = each.value.sku_name
  azure_openai_deployment_name = each.value.deployment_name
}

module "private_endpoint" {
  source = "./modules/private_endpoint"  // adjust this to the actual path of your private endpoint module

  for_each = { for ai in var.azure_openai : ai.service_name => ai }

  name                = each.value.private_endpoint_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  subnet_id           = each.value.subnet_id
  private_connection_resource_id = module.azure_openai[each.key].azure_open_ai.id
}

