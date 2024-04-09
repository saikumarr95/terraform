#Defintion for azure webapp and attacing a private endpoint to it.

azure_webapps = [
  {
    aiops_serviceplan_name = sp-wa-aiops-uat-001-eastus
    resource_group_name    = rg-AIOps-Corp-UAT-Connectivity-eus
    location               = eastus
    os_type                = Linux
    aiops_webapp_name      = wa-aiops-uat-001-eastus
    common_tags            = { Created by = Ebin Thomas, Env = UAT  }
    subnet_id              = 
    private_endpoint_name  = PE-WA-UAT-AIOPS-001
    private_service_connection = psc-wa-iops-uat-001-eastus
    subresource_name       = sites
  }
  // ... add more webapp configurations here ...
]


# varibale definiton to create multiple azure aearch srvices and attaching private endpoint to the same

azure_search_services = [
  {
    search_service_name = swa-aiops-uat-001-eastus
    resource_group_name = rg-AIOps-Corp-UAT-Connectivity-eus
    location            = eastus
    sku                 = "sku1"
    private_endpoint_name  = PE-SWA-UAT-AIOPS-001
    subnet_id              = 
    private_service_connection =  psc-Swa-iops-uat-001-eastus
    subresource_name       = staticsites
  }
  
  // ... add more search service configurations here ...
]


#openai definition 

azure_openai = [
  {
    service_name = openai-aiops-uat-001-eastus
    location = eastus
    resource_group_name = rg-AIOps-Corp-UAT-Connectivity-eus
    kind = OpenAI
    sku_name = s0
    deployment_name = openai-deployment-aiops-uat-001-eastus
    private_endpoint_name = pe-openai-aiops-uat-eastus
    subnet_id =
  }
  
  // ... add more openai configurations here ...
]
#defintion for static web app

azure_static_web_apps = [
  {
    name = swa-aiops-uat-001-eastus
    resource_group_name = rg-AIOps-Corp-UAT-Connectivity-eus
    location = eastus
    repository_url = https://CTO-Global@dev.azure.com/CTO-Global/CTO%20Engineering/_git/ESLZ.AIOPS-UI
    branch = uat
    sku = "standard"
    private_endpoint_name = pe-swa-aiops-uat-001-eastus
    subnet_id =
    private_service_connection = psc-swa-aiops-uat-001-eastus
    subresource_name = "sites"
  }
  
  // ... add more static web app configurations here ...
]

#defintion for storage account

azure_storage_accounts = [
  {
    name                 = staaiopsuatwa
    resource_group_name  = rg-AIOps-Corp-UAT-Connectivity-eus
    location             =eastus
    subnet_id            = 
    environment          = uat
    private_endpoint_name  = pe-sta-aiops-uat-eastus-001
    private_service_connection = psc-sta-aiops-uat-001-eastus
    subresource_name       = blob
  },
  {
    name                 = staaiopsuatswa
    resource_group_name  = rg-AIOps-Corp-UAT-Connectivity-eus
    location             = eastus
    subnet_id            = "subnet-id2"
    environment          = uat
    private_endpoint_name  = pe-sta-aiops-uat-eastus-002
    private_service_connection = psc-sta-aiops-uat-002-eastus
    subresource_name       = blob
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

