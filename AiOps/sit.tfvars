azure_search = {
  resource_group_name = "my-resource-group"
  location = "West US"
  service_name = "my-search-service"
  sku = "standard"
}

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

private_endpoint = {
  name = "my-private-endpoint"
  location = "West US"
  resource_group_name = "my-resource-group"
  subnet_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/mygroup1/providers/Microsoft.Network/virtualNetworks/myvnet1/subnets/mysubnet1"
  private_service_connection = "my-private-service-connection"
  resource_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/mygroup1/providers/Microsoft.Network/virtualNetworks/myvnet1"
  subresource_name = "my-subresource"
}