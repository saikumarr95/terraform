 
# for openai services
azure_openai_service_name = "my-openai-service"
location = "West US"
resource_group_name = "my-resource-group"
azure_openai_kind = "CognitiveServices"
sku_name = "S0"
azure_openai_deployment_name = "my-openai-deployment"

#for azure search

resource_group_name = "my-resource-group"
location = "West US"
azure_search_service_name = "my-azure-search-service"
sku = "standard"

#for azure static webapp

name = "my-static-web-app"
resource_group_name = "my-resource-group"
location = "West US"
azure_devops_token = "my-azure-devops-token"
repository_url = "https://dev.azure.com/my-org/my-project/_git/my-repo"
branch = "main"


#for azure webapp

aiops_serviceplan_name = "my-service-plan"
resource_group_name = "my-resource-group"
location = "West US"
os_type = "Linux"
aiops_webapp_name = "my-web-app"
common_tags = {
  ManagedBy   = "Terraform"
  Environment = "Production"
}
ip_restrictions = [
  {
    ip_address = "123.123.123.123/32"
    name       = "my-ip-restriction"
    priority   = 100
    action     = "Allow"
  }
]

# for private endpoint

private_endpoint_name = "my-private-endpoint"
location = "West US"
resource_group_name = "my-resource-group"
subnet_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/mygroup1/providers/Microsoft.Network/virtualNetworks/myvnet1/subnets/mysubnet1"
private_service_connection = "my-private-service-connection"
resource_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/mygroup1/providers/Microsoft.Network/virtualNetworks/myvnet1"
subresource_name = "my-subresource"

# for storage account

azure_resource_name = "my-azure-resource"
resource_group_name = "my-resource-group"
location = "West US"
subnet_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/mygroup1/providers/Microsoft.Network/virtualNetworks/myvnet1/subnets/mysubnet1"
environment = "development"