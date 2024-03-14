#Terraform Modules for AIOPS 

module "azure_storageaccount_module" {
source = "./modules/storageaccount_aiops"
resource_group_name = "rg-AIOps-Corp-Connectivity-eus"
location = "eastus"
}

module "azure_search_module" {
  source = "./modules/azuresearch"
   resource_group_name = "rg-AIOps-Corp-Connectivity-eus"
   location = "eastus"
   azure_search_service_name = "as-aiops-mvp-eus"
}

module "azure_openai_module" {
source = "./modules/azureopenai"
resource_group_name = "rg-AIOps-Corp-Connectivity-eus"
location = "eastus"
azure_openai_service_name = "azopenai-aiops-terraform-mvp-eus"
azure_openai_deployment_name = "azopenai-deployment-aiops-terraform-003-eus"
azure_openai_kind = "OpenAI"
}

module "azure_webapp_module" {
source = "./modules/aiopswebapp"
resource_group_name = "rg-AIOps-Corp-Connectivity-eus"
location = "eastus"
aiops_serviceplan_name = "wa-aiops-service-plan-003"
aiops_webapp_name = "wa-aiops-terraform-003"
os_type = "Linux"
}

module "azure_functionapp_module" {
source = "./modules/azurefunction"
resource_group_name = "rg-AIOps-Corp-Connectivity-eus"
location = "eastus"
app_function_storageacc_name = "stfaaiopterraformesu99"
app_function_storageacc_replication = "LRS"
app_function_storageacc_tier = "Standard"
app_linux_function_name = "fa-linux-aiops-terraform99"
#app_function_serviceplan_kind = "FunctionApp"
app_linux_function_serviceplan_name = "faaiopsappfunctionspn99"
}

