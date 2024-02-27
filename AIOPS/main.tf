/*module "networking_module" {
    source = "./networking"
   resource_group_name = "app-grp"
   location = "north europe"
   virtual_network_name = "app-network"
   virtual_network_address_space = "10.0.0.0/24"
}
*/
module "azure_search_module" {
  source = "./azuresearch"
   resource_group_name = "rg-as-aiops-mvp-eus"
   location = "eastus"
   azure_search_service_name = "as-aiops-mvp-eus"
}
module "azure_openai_module" {
source = "./azureopenai"
resource_group_name = "rg-as-aiops-mvp-eus"
location = "eastus"
azure_openai_service_name = "azopenai-aiops-mvp-eus"
azure_openai_deployment_name = "azopenai-deployment-aiops-mvp-eus"
azure_openai_kind = "OpenAI"
}

module "azure_webapp_module" {
source = "./aiopswebapp"
resource_group_name = "rg-as-aiops-mvp-eus"
location = "eastus"
aiops_serviceplan_name = "aiops_webapp_serviceplan"
aiops_webapp_name = "aiops-webapp"
os_type = "Windows"
sku_name = "S1"
current_stack = "dotnet"
dotnet_version = "v6.0"
}