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


variable "storage_account" {
  type = object({
    azure_resource_name = string
    resource_group_name = string
    location = string
    subnet_id = string
    environment = string
  })
  description = "This defines the Azure Storage Account configuration."
  default = {
    environment = "development"
  }
}