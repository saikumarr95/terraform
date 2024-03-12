#aiops
terraform {
  backend "azurerm" {
    resource_group_name  = "rg-mhub-tfstate-uks"
    storage_account_name = "stmhubtfstateuks"
    container_name       = "cpu-cis-aiops-corp-nonprod-001"
    key                  = "terraformpipeline.tfstate"
  }
}

/*
backendServiceArm: 'azspn-cpu-cis-aiops-corp-nonprod-001'
environmentServiceName: 'azspn-cpu-cis-aiops-corp-nonprod-001'
backendAzureRmSubscriptionId: '23901823-e0ae-47b1-b16e-f3897302cca3'
providerAzureRmSubscriptionId: '6507a1cf-15d4-4a96-93b8-9680912007d5'
backendAzureRmResourceGroupName: 'rg-mhub-tfstate-uks'
backendAzureRmStorageAccountName: 'stmhubtfstateuks'
backendAzureRmContainerName: 'cpu-cis-aiops-corp-nonprod-001'
backendAzureRmKey: 'terraformpipeline.tfstate'
 */