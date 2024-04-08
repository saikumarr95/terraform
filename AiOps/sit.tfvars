#Defintion for azure webapp and attacing a private endpoint to it.

azure_webapps = [
  {
    aiops_serviceplan_name = "serviceplan1"
    resource_group_name    = "resource-group1"
    location               = "location1"
    os_type                = "os-type1"
    aiops_webapp_name      = "webapp1"
    common_tags            = { "tag1" = "value1", "tag2" = "value2" }
    ip_restrictions        = [ "ip1", "ip2" ]
    private_endpoint_name  = "private-endpoint1"
    subnet_id              = "subnet-id1"
    private_service_connection = "service-connection1"
    subresource_name       = "subresource-name1"
  },
  {
    aiops_serviceplan_name = "serviceplan2"
    resource_group_name    = "resource-group2"
    location               = "location2"
    os_type                = "os-type2"
    aiops_webapp_name      = "webapp2"
    common_tags            = { "tag3" = "value3", "tag4" = "value4" }
    ip_restrictions        = [ "ip3", "ip4" ]
    private_endpoint_name  = "private-endpoint2"
    subnet_id              = "subnet-id2"
    private_service_connection = "service-connection2"
    subresource_name       = "subresource-name2"
  },
  // ... add more webapp configurations here ...
]


# varibale definiton to create multiple azure aearch srvices and attaching private endpoint to the same

azure_search_services = [
  {
    search_service_name = "search-service1"
    resource_group_name = "resource-group1"
    location            = "location1"
    sku                 = "sku1"
    private_endpoint_name  = "private-endpoint1"
    subnet_id              = "subnet-id1"
    private_service_connection = "service-connection1"
    subresource_name       = "subresource-name1"
  },
  {
    search_service_name = "search-service2"
    resource_group_name = "resource-group2"
    location            = "location2"
    sku                 = "sku2"
    private_endpoint_name  = "private-endpoint2"
    subnet_id              = "subnet-id2"
    private_service_connection = "service-connection2"
    subresource_name       = "subresource-name2"
  },
  // ... add more search service configurations here ...
]


azure_openai = {
  service_name = "my-openai-service"
  location = "West US"
  resource_group_name = "my-resource-group"
  kind = "my-kind"
  sku_name = "my-sku"
  deployment_name = "my-deployment"
}

static_web_app = {
  name = "my-static-web-app"
  resource_group_name = "my-resource-group"
  location = "West US"
  azure_devops_token = "my-azure-devops-token"
  repository_url = "https://dev.azure.com/my-repo"
  branch = "main"
}

aiops = {
  serviceplan_name = "my-service-plan"
  resource_group_name = "my-resource-group"
  location = "West US"
  os_type = "Linux"
  webapp_name = "my-web-app"
  common_tags = {
    ManagedBy   = "Terraform"
    Environment = "Production"
  }
  ip_restrictions = []

}

private_endpoints = [
  {
    name = "endpoint1"
    location = "location1"
    resource_group_name = "my-resource-group1"
    subnet_id = "subnet-id1"
    private_service_connection = "service-connection1"
    resource_id = "resource-id1"
    subresource_name = "subresource-name1"
  },
  // ... add more endpoint configurations here ...
]

azure_storage_accounts = [
  {
    name                 = "storage-account1"
    resource_group_name  = "resource-group1"
    location             = "location1"
    subnet_id            = "subnet-id1"
    environment          = "environment1"
    private_endpoint_name  = "private-endpoint1"
    private_service_connection = "service-connection1"
    subresource_name       = "subresource-name1"
  },
  {
    name                 = "storage-account2"
    resource_group_name  = "resource-group2"
    location             = "location2"
    subnet_id            = "subnet-id2"
    environment          = "environment2"
    private_endpoint_name  = "private-endpoint2"
    private_service_connection = "service-connection2"
    subresource_name       = "subresource-name2"
  },
  // ... add more storage account configurations here ...
]

#Defnition for openai

azure_openai = [
  {
    service_name = "openai-service1"
    location = "location1"
    resource_group_name = "resource-group1"
    kind = "kind1"
    sku_name = "sku-name1"
    deployment_name = "deployment-name1"
    private_endpoint_name = "private-endpoint1"
    subnet_id = "subnet-id1"
  },
  {
    service_name = "openai-service2"
    location = "location2"
    resource_group_name = "resource-group2"
    kind = "kind2"
    sku_name = "sku-name2"
    deployment_name = "deployment-name2"
    private_endpoint_name = "private-endpoint2"
    subnet_id = "subnet-id2"
  },
  // ... add more openai configurations here ...
]

